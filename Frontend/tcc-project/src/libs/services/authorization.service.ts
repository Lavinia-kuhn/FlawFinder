import { Observable } from 'rxjs';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { PCFUserInformation } from '../models/user.interface';

@Injectable({
  providedIn: 'root'
})

export class AuthorizationService {

  constructor(private http: HttpClient) { }

  public getAll(): Observable<boolean> {
    return this.http.get<boolean>('Authorization/v1');
  }
}
