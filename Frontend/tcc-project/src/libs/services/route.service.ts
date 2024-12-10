import { Observable } from 'rxjs';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { IRoute } from '../models/route.interface';

@Injectable({
  providedIn: 'root'
})

export class RouteService {

  constructor(private http: HttpClient) { }

  public getAll(): Observable<IRoute[]> {
    return this.http.get<IRoute[]>('Route/v1/getAll');
  }
  
  public getPage(pPage:number, pSize:number): Observable<IRoute[]> {
    return this.http.get<IRoute[]>('Route/v1/getPage?pPage=' + pPage + "&pSize="+pSize);
  }

  public getByCode(code): Observable<IRoute[]> {
    return this.http.get<IRoute[]>('Route/v1/getByCode?code='+code)
  }
}
