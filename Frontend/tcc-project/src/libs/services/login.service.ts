import { ILogin, IInputLogin, PCFUserInformation } from './../models/user.interface';
import { Observable } from 'rxjs';
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { TokenUtil } from 'src/libs/utils/Token.util';
import { environment } from 'src/environments/environment';


@Injectable({
  providedIn: 'root'
})
export class LoginService {
  constructor(private http: HttpClient) { }

  public postLoginService(params: IInputLogin): Observable<ILogin> {
    return this.http.post<ILogin>('user/v1/login', params);
  }

  public postAdLoginService(params: IInputLogin): Observable<ILogin> {
    return this.http.post<ILogin>('user/v1/adlogin', params);
  }

  public getPCFToken(params: IInputLogin): Observable<any> {
    const headers = new HttpHeaders().set('skipPcfUrl', 'true').set('skipPcfHeaders', 'true');
    return this.http.post<any>(environment.pcfEndPoint + 'api/Login/SafeLogin?user=' + TokenUtil.encrypt(params.user) + '&password=' + TokenUtil.encrypt(params.password), {}, { headers: headers });
  }
}
