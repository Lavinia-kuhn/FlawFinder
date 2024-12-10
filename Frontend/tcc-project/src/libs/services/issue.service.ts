import { Injectable } from '@angular/core'
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class IssueService {
  constructor(private http: HttpClient) { }

  public getPareto(): Observable<any> {
    return this.http.get<any>('issue/v1/pareto');
  }

  public getLine(): Observable<any> {
    return this.http.get<any>('issue/v1/line');
  }

  public getPie(): Observable<any> {
    return this.http.get<any>('issue/v1/pie');
  }
  public getbugCount(): Observable<any> {
    return this.http.get<any>('issue/v1/bugcount');
  }

  public bugsFromJira(): Observable<any>{
    return this.http.post<any>('issue/v1/postbugs', null);
  }

}