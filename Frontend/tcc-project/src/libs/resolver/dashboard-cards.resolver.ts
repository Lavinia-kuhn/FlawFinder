import { Injectable, inject } from '@angular/core';
import {
  Router, Resolve,
  RouterStateSnapshot,
  ActivatedRouteSnapshot,
  ResolveFn
} from '@angular/router';
import { Observable, map, of } from 'rxjs';
import { GridsterConfig, IDashboardDet } from '../models/dashboard.interface';
import { DashboardService } from '../services/dashboard.service';
import { TokenUtil } from '../utils/Token.util';

@Injectable({
  providedIn: 'root'
})
export class DashboardCardsResolver implements Resolve<IDashboardDet> {
  constructor(
    private dashboardService: DashboardService,
  ) { }

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<IDashboardDet> {
    const idUser = TokenUtil.getLocalStorage().idUser;
    const idUsrGroup = 1;
    const idDashboardHD = Number(route.queryParams['idDashboardHD']);
    return this.dashboardService.GetDashboardCards(idUser, idUsrGroup, idDashboardHD)
      .pipe(
        map(cards => cards.map(card => this.fillMissingDashboardDetFields(card)))
      );
  }

  private fillMissingDashboardDetFields(card: IDashboardDet): IDashboardDet {
    return {
      ...card,
      idDashboardDet: card.idDashboardDet || 0,
      idDashboardHD: card.idDashboardHD || 0,
      idCard: card.idCard || 0,
      cardName: card.cardName || '',
      cardType: card.cardType || '',
      cardUrl: card.cardUrl || '',
      filtersJson: card.filtersJson || '',
      pillar: card.pillar || '',
      isPreferenceCard: card.isCustomCard || false,
      isDuplicatedCard: card.isDuplicatedCard || false,
      idPref: card.idPref || 0,
      savedForMore: card.savedForMore || false,
      gridsterPref: card.gridsterPref || '',
      gridsterConfig: card.gridsterConfig || this.createDefaultGridsterConfig(),
      visible: card.visible || false
    };
  }

  private createDefaultGridsterConfig(): GridsterConfig {
    return new GridsterConfig();
  }
}




export const dashboardCardsResolver: ResolveFn<IDashboardDet> = (
  route: ActivatedRouteSnapshot,
  state: RouterStateSnapshot
): Observable<IDashboardDet> | Promise<IDashboardDet> => {
  return inject(DashboardCardsResolver).resolve(route, state);
}