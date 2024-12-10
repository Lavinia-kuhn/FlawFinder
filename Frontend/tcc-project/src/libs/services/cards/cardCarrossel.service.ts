import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse } from '@angular/common/http';
import { BehaviorSubject, Observable, catchError, delay, retryWhen, take, tap, throwError, timeout } from 'rxjs';
import { CarouselConfig } from 'src/libs/models/carrossel.interface';
import { ChartsService } from '../charts.service';

@Injectable({
    providedIn: 'root'
})
export class CardCarouselService {

    private chartDataSubject = new BehaviorSubject<any>(null);
    chartData$ = this.chartDataSubject.asObservable();

    private searchingSubject = new BehaviorSubject<boolean>(false);
    searching$ = this.searchingSubject.asObservable();


    constructor(
        private http: HttpClient,
        private _chartsService: ChartsService,) { }

    //CONFIGURAÇÃO DO CARROSEL PARA O CARD

    public getOeeHourByHour(filters: any, url: string): Observable<CarouselConfig> {
        return this.http.post<CarouselConfig>(`G0020/V1/OeHourly`, filters);
    }

    public getAddressBalance(filters: any, url: string): Observable<CarouselConfig> {
        return this.http.post<CarouselConfig>(`MovDashboard/v1/addressBalanceCarrousel`, filters);
    }

    public getHourlyQuality(filters: any, url: string): Observable<CarouselConfig> {
        return this.http.post<CarouselConfig>(`G0020/V1/CarouselQualityHourly`, filters);
    }

    public getHourlyPerformance(filters: any, url: string): Observable<CarouselConfig> {
        return this.http.post<CarouselConfig>(`G0020/V1/CarouselPerformanceHourly`, filters);
    }

    public getOeeMobile(filters: any, url: string): Observable<CarouselConfig> {
        return this.http.post<CarouselConfig>(`IndicatorsProd/V1/CarouselRadial`, filters);
    }

    public getEfficiencyChart(filters: any, url: string): Observable<CarouselConfig> {
        return this.http.post<CarouselConfig>(`PredictedProd/V1/CarouselPredictedProdGraphic`, filters);
    }

    public getIndicatorCard8x3(filters: any, url: string): Observable<CarouselConfig> {
        return this.http.post<CarouselConfig>(`IndicatorsProd/V1/CarouselIndicatorsProd`, filters);
    }
    public getIndicatorCard8x3Det(filters: any, url: string): Observable<CarouselConfig> {
        return this.http.post<CarouselConfig>(`IndicatorsProd/V1/CarouselIndicatorsProdDet`, filters);
    }

    public getIndicatorCard3x2(filters: any, url: string): Observable<CarouselConfig> {
        return this.http.post<CarouselConfig>(`IndicatorsProd/V1/CarouselIndicatorsProd`, filters);
    }

    public getIndicatorCard2x2(filters: any, url: string): Observable<CarouselConfig> {
        return this.http.post<CarouselConfig>(`IndicatorsProd/V1/CarouselIndicatorsProd`, filters);
    }

    public getIndicatorCard(filters: any, url: string): Observable<CarouselConfig> {
        return this.http.post<CarouselConfig>(`IndicatorsProd/V1/CarouselIndicatorsProd`, filters);
    }

    public getEfficiencyCard(filters: any, url: string): Observable<CarouselConfig> {
        return this.http.post<CarouselConfig>(`PredictedProd/V1/CarouselPredictedProdCard`, filters);
    }

    //CHAMADAS API CARROSEL

    chartSwitchFromCarosel(
        url: string,
        chartType: string,
        chartName: string,
        filters: any
    ): Observable<any> {
        this.searchingSubject.next(true);
        switch (chartType.toLowerCase()) {
            case 'donut':
                return this.retryWithDelay(() => this._chartsService.getDonutsChartService(url, filters), chartName);
            case 'gantt':
                return this.retryWithDelay(() => this._chartsService.getGanttDataService(url, filters), chartName);
            case 'paretoduration':
                return this.retryWithDelay(() => this._chartsService.getParetoDurationDataService(url, filters), chartName);
            case 'pareto':
            case 'paretolines':
                return this.retryWithDelay(() => this._chartsService.getParetoDataService(url, filters), chartName);
            case 'table':
                return this.retryWithDelay(() => this._chartsService.getTableDataService(url, filters), chartName);
            case 'bar':
            case 'stackedbar':
            case 'stackedcolumn':
            case 'groupedcolumn':
            case 'column':
            case 'column-carousel':
            case 'groupedcolumn-carousel':
                return this.retryWithDelay(() => this._chartsService.getColumnsDataService(url, filters), chartName);
            case 'goalcolumns':
            case 'bullet':
                return this.retryWithDelay(() => this._chartsService.getGoalColumnsDataService(url, filters), chartName);
            case 'goalcolumnline-carousel':
                return this.retryWithDelay(() => this._chartsService.getGoalColumnLineDataService(url, filters), chartName);
            case 'addressbalance-carousel':
                return this.retryWithDelay(() => this._chartsService.getAddressBalanceDataService(url, filters), chartName);
            case 'columnsarea':
                return this.retryWithDelay(() => this._chartsService.getColumnsAreaDataService(url, filters), chartName);
            case 'line':
            case 'linearea':
                return this.retryWithDelay(() => this._chartsService.getLineAreaChartService(url, filters), chartName);
            case 'timeline':
            case 'timelines':
                return this.retryWithDelay(() => this._chartsService.getTimeLinesChartService(url, filters), chartName);
            case 'basiccard':
            case 'basiccard-carousel':
                return this.retryWithDelay(() => this._chartsService.getBasicCardDataService(url, filters), chartName);
            case 'temporalline':
                return this.retryWithDelay(() => this._chartsService.getTemporaLineDataService(url, filters), chartName);
            case 'indicatorscardswiper':
            case 'indicatorscard-carousel':
                return this.retryWithDelay(() => this._chartsService.getIndicatosCardSwiperDataService(url, filters), chartName);
            case 'indicatorscardone':
            case 'indicatorscardfour':
            case 'indicatorscardfour-carousel':
            case 'indicatorscardswiper-carousel':
            case 'indicatorscardcustombed':
            case 'indicatorscardv2':
            case 'indicatorscardv2-carousel':
            case 'indicatorscarddetails':
            case 'indicatorscarddetails-carousel':
            case 'addressbalance':
            case 'indicatorscard':
            case 'indicatorscardone-carousel':
                return this.retryWithDelay(() => this._chartsService.getIndicatosCardDataService(url, filters), chartName);
            default:
                console.error('chartType não reconhecido:', chartType);
                return throwError(new Error('chartType não reconhecido'));
        }
    }

    private retryWithDelay(fn: () => Observable<any>, chartName: string): Observable<any> {
        return fn().pipe(
            retryWhen(errors =>
                errors.pipe(
                    delay(30000),
                    take(3)
                )
            ),
            catchError(this.handleError(chartName))
        );
    }

    private processChartData(chartName: string) {
        return (data: any) => {
            this.chartDataSubject.next({ [chartName]: data });
            this.searchingSubject.next(false);
        };
    }

    private handleError(chartName: string) {
        return (error: HttpErrorResponse) => {
            if (error.status === 500) {
                console.error(`Internal Server Error: ${error.status} - ${error.message}. Retrying...`);
                //      return throwError(error);
            } else {
                console.error('Error fetching chart data for', chartName, error);
                this.searchingSubject.next(false);
                //   return throwError(error);
            }
            return throwError(error);
        };
    }
}