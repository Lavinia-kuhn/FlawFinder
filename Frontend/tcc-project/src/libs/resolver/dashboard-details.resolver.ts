import { Injectable, inject } from '@angular/core';
import { Resolve, ActivatedRouteSnapshot, RouterStateSnapshot, ResolveFn } from '@angular/router';
import { Observable, map, of } from 'rxjs';
import { DashboardService } from '../services/dashboard.service';
import { DashboardDetails } from '../models/dashboard.interface';
import { DeviceDetectorService } from 'ngx-device-detector';
import { TokenUtil } from '../utils/Token.util';


@Injectable({
  providedIn: 'root'
})
export class DashboardDetailsResolver implements Resolve<Observable<DashboardDetails>> {
  constructor(
    private dashboardService: DashboardService,
    private deviceService: DeviceDetectorService
  ) { }

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<DashboardDetails> {
    const idDashboardHd = +route.queryParams['idDashboardHD'];
    const nameDashboard = route.queryParams['viewName'];
    const isEditable = route.queryParams['isEditable'];

    const idUser = TokenUtil.getLocalStorage().idUser ? TokenUtil.getLocalStorage().idUser : 1;

    if (idDashboardHd) {
      return this.dashboardService.GetDashboardDetails(Number(idDashboardHd)).pipe(
        map((dashboardData) => {
          return {
            data: dashboardData,
            name: nameDashboard,
            mobile: this.deviceService.isMobile(),
            isEditable: isEditable,
            idDashboardHd,
            idUser
          };
        })
      );
    } else {
      return of(null);
    }
  }
}


export const dashboardDetailsResolver: ResolveFn<DashboardDetails> = (
  route: ActivatedRouteSnapshot,
  state: RouterStateSnapshot
): Observable<DashboardDetails> | Promise<DashboardDetails> => {
  return inject(DashboardDetailsResolver).resolve(route, state);
}