import { environment } from 'src/environments/environment';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { CardsPreferencesCommand, CardsPreferencesCommands } from '../models/user.interface';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { IDeletePreferencesCard } from '../models/report.interface';
import { CardCommand, IDashboard, IDashboardDet, ReportCardCommand } from '../models/dashboard.interface';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {

  constructor(private http: HttpClient) { }

  public GetAllDashboards(idUser: number, idsUsrGroup: number[]): Observable<any> {
    return this.http.get<any>(`Dashboard/V2/GetAllDashboards?idUser=${idUser}&idUsrGroup=${idsUsrGroup.join(',')}`);
  }

  public DeleteDashboards(idUser: number, idsUsrGroup: number[], idsDashHd: number[]): Observable<any> {
    return this.http.patch(`Dashboard/V2/DeleteDashboards?idUser=${idUser}&idsUsrGroup=${idsUsrGroup.join(',')}`, idsDashHd.slice(0, 2000));
  }

  public SaveDashboard(idGrpUsers: number[], dashboard: IDashboard): Observable<number> {
    const endpoint = 'Dashboard/V2/SaveNewDashboard';
    return this.http.post<number>(endpoint, dashboard, { params: { idGrpUsers: idGrpUsers.join(',') } });
  }

  public UpdateDashboard(dashboard: IDashboard, idsUsrGroup: number[]): Observable<any> {
    const endpoint = `Dashboard/V2/UpdDasboardDets?idsUsrGroup=${idsUsrGroup.join(',')}`;
    const headers = new HttpHeaders().set('Content-Type', 'application/json');
    return this.http.put<any>(endpoint, dashboard, { headers });
  }
  //MONTA O DASHBOARD.
  public GetDashboardDetails(idMvDashboardHD: number): Observable<any> {
    return this.http.get(`Dashboard/V2/GetDashboardDet?idDashHD=${idMvDashboardHD}`);
  }

  //LOJA CARDS
  public GetDashboardCards(idUser: number, idUsrGroup: number, idDashboardHD: number): Observable<any> {
    return this.http.get(`Dashboard/V2/GetAllCards?idUser=${idUser}&idUsrGroup=${idUsrGroup}&idDashHD=${idDashboardHD}`);
  }

  //MONTA OS FILTROS
  public getDashboardViewFilters(idDashboard: number, viewName: string = ""): Observable<any> {
    return this.http.get<any>('dashboard/v1/' + idDashboard + '&viewName=' + viewName + '/getViewFilters')
  }

  public enableCard(idCard: number): Observable<boolean> {
    return this.http.put<boolean>(`Dashboard/V2/EnableCard`, null, { params: { idCard: idCard.toString() } });
  }

  public disableCard(idCard: number): Observable<boolean> {
    return this.http.put<boolean>(`Dashboard/V2/DisableCard`, null, { params: { idCard: idCard.toString() } });
  }

  public deleteCard(idCard: number): Observable<boolean> {
    return this.http.delete<boolean>(`Dashboard/V2/DeleteCard`, { params: { idCard: idCard.toString() } });
  }

  public saveNewCard(idGrpUsers: number[], card: ReportCardCommand): Observable<boolean>{

    return this.http.post<boolean>('Dashboard/v2/SaveWithCard', card, { params: { idGrpUsers: idGrpUsers.join(',') } });
  }

  public GettAllAndonHD(): Observable<any> {
    const apiAddress = environment.pcfEndPoint + 'api/AndonHD/GetAll';
    const headers = new HttpHeaders().set('screencode', 'VIEWDASHBOARD').set('skipPcfUrl', 'true').set('skipPcfHeaders', 'true');
    return this.http.get<any>(apiAddress, { headers: headers });
  }

  public deletePreferenceCardService(params: any): Observable<IDeletePreferencesCard> {
    return this.http.post<IDeletePreferencesCard>('dashboard/v1/DeleteCardPreference', params);
  }


  public deleteDashboardView(id: any, idDashboard: any): Observable<any> {
    const url = `dashboard/v1/${id}/deleteView`;
    return this.http.delete(url, { params: { idDashboard: idDashboard, id: id } });
  }

  public updateMainView(idDashboardHD: number, idUser: number): Observable<any> {
    return this.http.put<any>(`dashboard/v2/updMainView`, null, { params: { idDashboardHD: idDashboardHD, idUser: idUser } });
  }

  public getMainView(idUser: number): Observable<any> {
    return this.http.get<any>(`dashboard/v2/getMainView`, { params: { idUser: idUser } });
  }

  public PostLastDuplicatedCard(newCard: CardCommand): Observable<number>{ return this.http.post<number>('Dashboard/v2/PostLastDuplicatedCard', newCard); }
}


