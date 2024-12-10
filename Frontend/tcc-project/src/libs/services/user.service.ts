import { IUserSetting } from './../models/user.interface';
import { Injectable } from '@angular/core';
import * as IUser from 'src/libs/models/user.interface';

import { Observable } from 'rxjs';

import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { UserLogin } from 'src/libs/models/user.interface';


@Injectable({
  providedIn: 'root',
})
export class UserService {
  private _userIDForTesting = 1;


  constructor(private http: HttpClient) {
    //this._getInitialData(this._userIDForTesting);
  }

  postPcfLogin(user: UserLogin): Observable<any> {
    const apiAddress = environment.pcfEndPoint + `api/Login/LoginMV`;
    const headers = new HttpHeaders().set('skipPcfUrl', 'true').set('skipPcfHeaders', 'true');
    return this.http.post<any>(apiAddress, user,{ headers: headers });
  }

  getPcfAuthenticateConfig(): Observable<boolean> {
    return this.http.get<boolean>('user/v1/GetAuthenticationType');
  }

  getUserPref(idUser: number): Observable<IUserSetting[]> {
    return this.http.get<IUserSetting[]>('user/v1/GetPrefUser?idUser=' + idUser);
  }

  public getAll(): Observable<IUser.IUserCode[]> {
    return this.http.get<IUser.IUserCode[]>('User/v1/getAll');
  }
  public getPage(pPage:number, pSize:number): Observable<IUser.IUserCode[]> {
    return this.http.get<IUser.IUserCode[]>('User/v1/getPage?pPage=' + pPage + "&pSize="+pSize);
  }
  public getCode(code): Observable<IUser.IUserCode[]> {
    return this.http.get<IUser.IUserCode[]>('User/v1/getByCode?code='+code);
  }
}
