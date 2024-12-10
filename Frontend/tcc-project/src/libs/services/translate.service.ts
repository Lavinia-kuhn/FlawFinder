import { Injectable, Inject, Injector, } from '@angular/core';
import { TranslateLoader } from '@ngx-translate/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TranslateService implements TranslateLoader {
   
  constructor(private http: HttpClient) { 
  }

  getTranslation(lang: string): Observable<any> {
    const apiAddress = `../../assets/i18n/${lang}.json`;
    const headers = new HttpHeaders().set('skipPcfUrl', 'true').set('skipPcfHeaders', 'true');
    return Observable.create(observer => {
      this.http.get(apiAddress, { headers: headers }).subscribe((res: Response) => {
        observer.next(res);
        observer.complete();
      },
      error => {
          //  failed to retrieve from api, switch to local
          this.http.get('../../assets/i18n/en.json', { headers: headers }).subscribe((res: Response) => {
            observer.next(res);
            observer.complete();
          });
        }
      );
    });
  }
}
