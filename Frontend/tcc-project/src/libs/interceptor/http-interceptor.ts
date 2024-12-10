import { TokenUtil } from './../utils/Token.util';
import { Injectable } from "@angular/core";
import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent, HttpErrorResponse } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { retryWhen, delay, tap, map, catchError, switchMap } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { NzMessageService } from 'ng-zorro-antd/message';
import { Router } from '@angular/router';

@Injectable()
export class HttpRequestInterceptor implements HttpInterceptor {

    public baseUrl = environment.apiEndpoint;
    //protected baseUrl = AppConfig.settings.apiServer.url;

    constructor(
        private _snackBar: NzMessageService,
        private route: Router
    ) { }

    //Intercept Padrão do sistema
    intercept(request: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {

        // const user = AccountUtil.get();
        // let token = user ? user.AccessToken : null;
        let localStorageToken = TokenUtil.getLocalStorage();
        let tokenStorage = localStorageToken && !window.location.href.includes("andonscreen") ? localStorageToken.token : null;

        if (!window.location.href.includes("andonscreen") && !window.location.href.includes("sso") && tokenStorage == null) {
            TokenUtil.clearLocalStorage();
            this.route.navigate(['/dashboard']);
        }

        const authReq = this.addToken(request, tokenStorage);

        return next.handle(authReq).pipe(
            //PRIMEIRO CATCH SERVE PARA PEGAR ERROS TRATADOS DO SISTEMA E 401 - UNAUTHORIZED
            catchError((error: any) => {
                if (error instanceof HttpErrorResponse) {
                    switch ((<HttpErrorResponse>error).status) {
                        case 401:
                            if (!window.location.href.includes("andonscreen")) {
                                //return this.handle401(request,next); //DIRECIONO PARA ROTINA QUE CHAMA O REFRESHTOKEN
                                TokenUtil.clearLocalStorage();
                                this.route.navigate(['/dashboard']);
                            }
                        default:
                            return throwError(error);  //LANÇO O ERRO PARA A PRÓXIMA CAMADA    
                    }
                } else {
                    return throwError(error);
                }
            }),
            retryWhen(err => {
                //AQUI É A ROTINA DE TENTATIVAS QUE INICIALMENTE ESTÁ CONFIGURADA COMO 3.
                //AQUI PENSO EM DEIXAR CONFIGURÁVEL ATRAVÉS DO HEADER DA REQUISIÇÃO SE VAI OU NÃO TER RETENTATIVA
                let retries = 1;

                return err.pipe(
                    delay(1500),
                    tap(() => {
                        console.log('Retries: ' + retries);
                    }),
                    map(error => {
                        if (retries++ === 1) {
                            throw error
                        }
                        return error;
                    })
                )
            }),
            catchError(error => {
                //CATCH PADRÃO DO INTERCEPTOR, 
                //AQUI POSSO PEGAR OS ERROS DO PRIMEIRO CATCH E DO RETRY
                // this._snackBar.open(`Error: ${ error.status } - ${ error.statusText }`,"Fechar",{
                //     verticalPosition: "bottom",
                //     horizontalPosition: "center",
                //     duration: 5000
                //   });
                console.log(error)

                // if (error.error !== undefined && error.error instanceof Array) {
                //     error.error.forEach(element => {
                //         this._snackBar.error(`Error: ${element.message}`,
                //             { nzDuration: 5000, nzPauseOnHover: true, nzAnimate: false }
                //         );
                //     });
                // } else {
                //     // Cria uma mensagem de erro
                //     // this._snackBar.error(`Error: ${error.status} - ${error.statusText}`,
                //     //     { nzDuration: 5000, nzPauseOnHover: true, nzAnimate: false }
                //     // );
                // }
                // if(error.error.Message.startsWith("Timeout")) {
                //     error.message = "Timeout";
                // }

                return throwError(error);
            })
        );
    }

    // private handle401(request: HttpRequest<any>, next: HttpHandler){
    //     //ROTINA QUE FAZ O REFRESHTOKEN
    //     return this.refreshTokenService.getRefreshToken(AccountUtil.get())
    //         .pipe(
    //             switchMap((newtoken: AccountModel) => {
    //                 //ADICIONO O NOVO TOKEN AO OBJETO
    //                 AccountUtil.set(newtoken);
    //                 //ADICIONO O NOVO TOKEN AO CABEÇALHO
    //                 request = this.addToken(request, newtoken.AccessToken);
    //                 return next.handle(request);
    //             }
    //         )
    //     );
    // }

    private addToken(request: HttpRequest<any>, token: String) {
        //AQUI TRATO A REQUISIÇÃO DE ACORDO COM OS PARÃMETROS DE CABEÇALHO ENVIADOS
        //PODE SER UMA REQUISIÇÃO PADRÃO DO SISTEMA, ONDE ADICIONO O HOST DO ENVIROMENT OU UM HOST CUSTOMIZADO 
        if (token) {
            if (request.headers.get("skipPcfHeaders")) {
                //CABEÇALHO E HOST CUSTOMIZADOS
                request = request.clone({
                    url: request.headers.get("skipPcfUrl") ? `${request.url}` : `${environment.apiEndpoint}${request.url}`,
                });
                return request;
            } else {
                //CABEÇALHO PADRÃO DAS APIS DO MV
                request = request.clone({
                    url: request.headers.get("skipPcfUrl") ? `${request.url}` : `${environment.apiEndpoint}${request.url}`,
                    setHeaders: {
                        Accept: 'application/json',
                        'Access-Control-Allow-Headers': '*',
                        'Content-Type': 'application/json',
                        Authorization: `Bearer ${token}`
                    },
                });
                return request;
            }
        } else {
            //PODE SER UMA CHAMADA DE LOGIN OU QUE NÃO NECESSITE DO TOKEN AINDA
            request = request.clone({
                url: request.headers.get("skipPcfUrl") ? `${request.url}` : `${environment.apiEndpoint}${request.url}`,
            });

            return request;
        }
    }
}
