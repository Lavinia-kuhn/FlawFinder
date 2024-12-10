import { Injectable } from '@angular/core'
import { HttpClient } from '@angular/common/http';
import { IReport} from 'src/libs/models/report.interface';
import { Observable } from 'rxjs';
import { TokenUtil } from '../utils/Token.util';

@Injectable({
  providedIn: 'root'
})

export class ReportService {
  constructor(private http: HttpClient) { }


  public getReport(): Observable<any> {
    return this.http.get<IReport>('report/v1/table');
  }
}