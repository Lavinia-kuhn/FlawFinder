import { CarouselConfig } from 'src/libs/models/carrossel.interface';
import { Injectable } from '@angular/core';
import { IFilterRow, IFilterSelect } from 'src/libs/models/filters.interface';
import { GridsterItemPref } from 'src/libs/models/gridsterItemComponentWithPrefs.interface';
import { GridsterUtil } from 'src/libs/utils/Gridster.util';
import { UserPreferencesUtil } from 'src/libs/utils/UserPreferences.util';
import * as ITabs from 'src/libs/models/tab-elements.interface';
import { CardCarouselService } from './cardCarrossel.service';
import { Observable, catchError, firstValueFrom, of, switchMap } from 'rxjs';
import { DashboardService } from '../dashboard.service';
import { TokenUtil } from 'src/libs/utils/Token.util';

@Injectable({
  providedIn: 'root',
})
export class CardService {
  public cardLabel: string;
  public lastID: number = 0;

  constructor(private _cardCarouselService: CardCarouselService, private dashboardService: DashboardService) { }

  processDashboardScreenChanges(cards: any[], filterRows: any[], filters: ITabs.IMultiFilter, isMobile: boolean): Observable<any> {
    let updatedDashboard: GridsterItemPref[] = [];

    let isGridsterConfig: boolean = false;
    const dataLocal = GridsterUtil.getLocalStorage();
    cards.forEach((element, i) => {
      element['cols'] && element['rows'] && element['gridsterConfig'] ? (isGridsterConfig = false) : (isGridsterConfig = true);
      const isCarrossel = element.cardType.includes('carousel');
      const carrosselConfig = isCarrossel ? new CarouselConfig() : null;
      if (element.visible && element.filters) {
        element.filters.forEach((filterRow) => {
          if (
            filterRows.findIndex(
              (filter) =>
                // filter.label.includes(filterRow.label.split('.')[1]) && // Validar pq existe essa condição no IF
                filter.label.includes(filterRow.label) &&
                filter.filterId == filterRow.filterId
            ) == -1
          ) {
            filterRows.push(filterRow);
          }
        });

        var filterDisabled = true;
        if (element.filters.length > 0) filterDisabled = false;
        const localCard = dataLocal.find(card => card.cardName === element.cardName);
        if (localCard) {
          localCard.visible = true;
          localCard.gridsterConfig.x = element.x ? element.x : 0;
          localCard.gridsterConfig.y = element.y ? element.y : 0;
        }
        this.cardLabel = element.cardName;
        this.adjustLayoutForCard(element);
        updatedDashboard.push({
          id: i,
          label: element.cardName,
          disabledFilterRow: filterDisabled,
          visible: element.visible,
          order: element.order ? element.order : i,
          cols: isGridsterConfig ? (element.gridsterConfig.cols ? element.gridsterConfig.cols : 1) : (element.cols ? element.cols : 1),
          rows: isGridsterConfig ? (!isMobile && element.gridsterConfig.rows ? element.gridsterConfig.rows : 1) : (!isMobile && element.rows ? element.rows : 1),
          copyCard: element.isDuplicatedCard ? element.isDuplicatedCard : false,
          forAll: element.forAll ? element.forAll : false,
          prefsGrid: element.gridsterPref != undefined && element.gridsterPref != "" ? JSON.parse(element.gridsterPref)?.gridsterPref || JSON.parse(element.gridsterPref)?.gridsterPref == "" ? JSON.parse(element.gridsterPref)?.gridsterPref : JSON.parse(element.gridsterPref) : element.gridsterPref,
          filter: filterRows.filter((filter) => {
            return filter.filterId === ''
              ? []
              : filter.filterId == element.cardName;
          }),
          y: isGridsterConfig ? (element.gridsterConfig.y ? element.gridsterConfig.y : 0) : (element.y ? element.y : 0),
          x: isGridsterConfig ? (element.gridsterConfig.x ? element.gridsterConfig.x : 0) : (element.x ? element.x : 0),
          pillar: element.pillar,
          isPrefCard: element.isPreferenceCard,
          widget: element.cardType ? element.cardType : '',
          width: element.width,
          height: element.height,
          chartUrl: element.cardUrl,
          carrossel: isCarrossel ? true : false,
          carouselConfig: carrosselConfig,
          custom: element.fieldType === 'custom' ? true : false,
          resizeEnabled: isGridsterConfig ? (element.gridsterConfig.resizeEnabled == false ? false : true) : true,
        });
      }
    });

    updatedDashboard.forEach(element => {
      if (dataLocal.find(card => card.cardName === element.label)) {
        let obj = dataLocal.find(card => card.cardName === element.label);
        if (obj && obj.gridsterConfig) {
          obj.gridsterConfig.chartUrl = element.chartUrl;
          obj.gridsterConfig.cols = element.cols;
          obj.gridsterConfig.rows = element.rows;
          obj.gridsterConfig.x = element.x;
          obj.gridsterConfig.y = element.y;
          obj.gridsterConfig.fieldType = element.fieldType;
          obj.gridsterConfig.height = element.height;
          obj.gridsterConfig.width = element.width;
          obj.gridsterConfig.idPref = element.idPref;
          obj.gridsterConfig.isPrefCard = element.isPreferenceCard;
          obj.gridsterConfig.pillar = element.pillar;
          obj.gridsterConfig.visible = element.visible;
          obj.gridsterConfig.widget = element.widget;

          dataLocal[dataLocal.findIndex(card => card.cardName === element.label)].gridsterConfig = obj.gridsterConfig;
        }
      }
    });

    GridsterUtil.setLocalStorage(dataLocal);
    updatedDashboard.forEach(item => {
      if (item.label === 'OE Hora a Hora' || item.label === 'OEE Hora a Hora') {
        const userIndicatorPref = UserPreferencesUtil.getLocalStorage().find(
          (x) => x.code === 'INDICATORS'
        )?.value;
        if (userIndicatorPref === 'PCFACINDICATORS') {
          item.label = item.label === 'OE Hora a Hora' ? 'OEE Hora a Hora' : 'Produtividade Hora a Hora';
        }
      }

    });

    return of({
      updatedDashboard: updatedDashboard,
      updatedFilterRows: filterRows,
      updatedAllFilters: filterRows
    });
  }

  processAndonScreenChanges(cards: any[], filterRows: any[], isAndonScreen: boolean): any {
    let updatedDashboard = [];

    if (isAndonScreen) {
      cards.forEach((element, i) => {
        const isCarrossel = element.class !== "empty-card" ? element.cardType.includes('carousel') : false;
        const carrosselConfig = isCarrossel ? new CarouselConfig() : null;
        if (element.visible) {

          updatedDashboard.push({
            id: i,
            label: element.cardName,
            visible: element.visible,
            order: element.order ? element.order : i,
            cols: element.gridsterConfig?.cols ? element.gridsterConfig.cols : 1,
            copyCard: element.isDuplicatedCard ? element.isDuplicatedCard : false,
            forAll: element.forAll ? element.forAll : false,
            prefsGrid: element.prefsGrid,
            filter: filterRows.filter((filter) => {
              return filter.filterId === ''
                ? []
                : filter.filterId == element.cardName;
            }),
            rows: element.gridsterConfig?.rows ? element.gridsterConfig.rows : 1,
            y: element.gridsterConfig?.y ? element.gridsterConfig.y : undefined,
            pillar: element.pillar,
            isPrefCard: element.isPreferenceCard,
            x: element.gridsterConfig?.x ? element.gridsterConfig.x : undefined,
            widget: element.cardType ? element.cardType : '',
            width: element.width,
            height: element.height,
            chartUrl: element.cardUrl,
            carrossel: isCarrossel ? true : false,
            carouselConfig: carrosselConfig,
            custom: element.gridsterConfig?.fieldType === 'custom' ? true : false,
            resizeEnabled: isCarrossel ? false : true,
            class: element.class
          });
        }
      });
    }

    return {
      updatedDashboard: updatedDashboard
    };
  }

  processSelectedMapChanges(dashboard: any[], selectedMap: any, filters: any, visibleGridster: any): any {
    const chartSwitchActions = [];
    let updates = {
      filtersCard: {},
      filterRowsUpdates: []
    };

    dashboard.forEach((element) => {
      if (element.visible && element.label != '') {
        const filterType = element.widget == 'addressbalance' ? 'movMatFilters' : 'oeeFilters';
        updates.filtersCard[element.label] = filters[filterType];
        if (element.widget !== 'map' && !element.carrossel) {
          if (element.widget == 'addressbalance') {
            chartSwitchActions.push({
              chartUrl: element.chartUrl,
              widget: element.cardType ? element.cardType : '',
              label: element.label,
              pillar: element.pillar,
              isPrefCard: element.isPrefCard,
            });
          }

          if (
            filters.oeeFilters.filterRows == null ||
            filters.oeeFilters.filterRows == undefined ||
            filters.oeeFilters.filterRows?.filter(
              (row) => row.filterId == filters.oeeFilters.tabTitle
            )?.length < 1
          ) {
            const foundElement = visibleGridster.data.find(el => el.label == element.label);
            if (foundElement) {
              updates.filterRowsUpdates.push({
                label: element.label,
                filterRows: foundElement.filters.filterRows
              });
            }
          }
        }
      }
    });

    return { chartSwitchActions, updates };
  }


  async duplicateCardAndUpdateDashboard(originalCardName: string, newCardName: string, dashboard: GridsterItemPref[]): Promise<void> {
    const data = GridsterUtil.getLocalStorage();
    await this.duplicateCardInLocalStorage(originalCardName, newCardName);
    const originalCardIndex = dashboard.findIndex(card => card.label === originalCardName);
    if (originalCardIndex === -1) {
      throw new Error('Original card not found in the dashboard');
    }

    const newCard = JSON.parse(JSON.stringify(dashboard[originalCardIndex]));

    newCard.label = newCardName;
    newCard.visible = true;
    newCard.copyCard = true;
    newCard.id = !this.lastID || this.lastID === 0 ? data.length + 1 : this.lastID;
    newCard.order = !this.lastID || this.lastID === 0 ? data.length + 1 : this.lastID;

    if (newCard.filters && newCard.filters.length > 0) {
      newCard.filters.forEach((filter: { filterId: string; }) => { filter.filterId = newCardName; });
    }

    if (newCard.prefsGrid) {
      newCard.prefsGrid.label = newCardName;
    }

    this.adjustLayoutForCard(newCard);

    dashboard.push(newCard);
  }

  private async duplicateCardInLocalStorage(originalCardName: string, newCardName: string): Promise<void> {
    const data = GridsterUtil.getLocalStorage();
    let index = data.findIndex(card => card.cardName === originalCardName);
    if (index === -1) {
      throw new Error('Original card not found in localStorage');
    }

    if (data.findIndex(card => card.cardName === newCardName) !== -1) {
      throw new Error('A card with the new name already exists');
    }
    
    let newCard = JSON.parse(JSON.stringify(data[index]));

    newCard.cardName = newCardName;
    newCard.visible = true;
    newCard.copyCard = true;
    newCard.isCustomCard = true;
    newCard.isDuplicatedCard = true;
    newCard.gridsterConfig = data.find(card => card.cardName === originalCardName)?.gridsterConfig;
    newCard.gridsterPref = data.find(card => card.cardName === originalCardName)?.gridsterPref;
    newCard.idUserCreation = TokenUtil.getLocalStorage().idUser;
    newCard.flgPreference = data.find(card => card.cardName === originalCardName)?.isPreferenceCard ? 1 : 0;

    if (newCard.gridsterPref && newCard.gridsterPref != '') {
      let gridsterPref = JSON.parse(newCard.gridsterPref);
      gridsterPref.label = newCardName;
      newCard.gridsterPref = JSON.stringify(gridsterPref);
    }

    if (newCard.filters && newCard.filters.length > 0) {
      newCard.filters.forEach((filter: { filterId: string; }) => { filter.filterId = newCardName; });
    }
    
    this.lastID = await firstValueFrom(this.dashboardService.PostLastDuplicatedCard(newCard));

    newCard.idCard = !this.lastID || this.lastID === 0 ? data.length + 1 : this.lastID;

    if (newCard.gridsterConfig) {
      newCard.gridsterConfig.idCard = newCard.idCard;
    }

    data.push(newCard);
    GridsterUtil.setLocalStorage(data);
  }

  private adjustLayoutForCard(card: GridsterItemPref): void {

    if (['INDICATORCARD2X2', 'INDICATORCARD3X2', 'INDICATORCARD8X3', 'TIMELINE', 'MAP', 'ADDRESSBALANCE', 'INDICATORCARD8X3DET', 'STORAGETASKS', 'SUMMARIZEDOEE'].includes(card.cardName)) {
      card.gridsterConfig.cols = 3;
      card.gridsterConfig.rows = card.cardName === 'SUMMARIZEDOEE' ? 1 : 2;
      card.gridsterConfig.resizeEnabled = false;
    }
  }
}
