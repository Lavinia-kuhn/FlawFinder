import { FilterService } from 'src/libs/services/filters/filters.service';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject, Observable, catchError, tap, throwError } from 'rxjs';
import { ChartsService } from '../charts.service';

@Injectable({
    providedIn: 'root'
})
export class ChartSwitchService {

    private chartDataSubject = new BehaviorSubject<any>(null);
    chartData$ = this.chartDataSubject.asObservable();

    private searchingSubject = new BehaviorSubject<boolean>(false);
    searching$ = this.searchingSubject.asObservable();


    constructor(private http: HttpClient,
        private _filterService: FilterService,
        private _chartsService: ChartsService,) { }


    applyPeriodFilter(filters: any): any {
        Object.keys(filters).forEach(filterKey => {
            const filterGroup = filters[filterKey];
            if (filterGroup.startDate !== '' || filterGroup.endDate !== '') {
                const selectedQuickFilterDate = filterGroup.filterRows
                    ?.find(row => row.label.includes('PERIOD_FILTER'))
                    ?.options?.find(option => option.value == 'true');
                if (selectedQuickFilterDate) {
                    this._filterService.setFiltersCommon(filterGroup, selectedQuickFilterDate);
                }
            }
        });

        return filters;
    }

    chartSwitch(
        url: string,
        chartType: string,
        chartName: string,
        filters: any,
        pillar: string,
        isPrefCard: boolean,
        apiKeyValue?: string
    ): Observable<any> {
        this.searchingSubject.next(true);
        let tableFilter = this.determineTableFilter(filters, pillar, isPrefCard);
        if (isPrefCard) {
            tableFilter.tabTitle = chartName;
        } else {
            tableFilter.oeeFilters.tabTitle = chartName;
        }
        switch (chartType.toLowerCase()) {
            case 'donut':
                return this._chartsService.getDonutsChartService(url, tableFilter, apiKeyValue).pipe(
                    tap(this.processChartData(chartName)),
                    catchError(this.handleError(chartName))
                );
            case 'gantt':
                return this._chartsService.getGanttDataService(url, tableFilter, apiKeyValue).pipe(
                    tap(this.processChartData(chartName)),
                    catchError(this.handleError(chartName))
                );
            case 'paretoduration':
                return this._chartsService.getParetoDurationDataService(url, tableFilter, apiKeyValue).pipe(
                    tap(this.processChartData(chartName)),
                    catchError(this.handleError(chartName))
                );
            case 'pareto':
            case 'paretolines':
                return this._chartsService.getParetoDataService(url, tableFilter, apiKeyValue).pipe(
                    tap(this.processChartData(chartName)),
                    catchError(this.handleError(chartName))
                );
            case 'table':
                return this._chartsService.getTableDataService(url, tableFilter, apiKeyValue).pipe(
                    tap(this.processChartData(chartName)),
                    catchError(this.handleError(chartName))
                );
            case 'bar':
            case 'stackedbar':
            case 'stackedcolumn':
            case 'groupedcolumn':
            case 'column':
                return this._chartsService.getColumnsDataService(url, tableFilter, apiKeyValue).pipe(
                    tap(this.processChartData(chartName)),
                    catchError(this.handleError(chartName))
                );
            case 'goalcolumns':
            case 'bullet':
                return this._chartsService.getGoalColumnsDataService(url, tableFilter, apiKeyValue).pipe(
                    tap(this.processChartData(chartName)),
                    catchError(this.handleError(chartName))
                );
            case 'columnsArea':
                return this._chartsService.getColumnsAreaDataService(url, tableFilter, apiKeyValue).pipe(
                    tap(this.processChartData(chartName)),
                    catchError(this.handleError(chartName))
                );
            case 'line':
            case 'lineArea':
                return this._chartsService.getLineAreaChartService(url, tableFilter, apiKeyValue).pipe(
                    tap(this.processChartData(chartName)),
                    catchError(this.handleError(chartName))
                );
            case 'timelines':
                return this._chartsService.getTimeLinesChartService(url, tableFilter, apiKeyValue).pipe(
                    tap(this.processChartData(chartName)),
                    catchError(this.handleError(chartName))
                );
            case 'basiccard':
                return this._chartsService.getBasicCardDataService(url, tableFilter, apiKeyValue).pipe(
                    tap(this.processChartData(chartName)),
                    catchError(this.handleError(chartName))
                );
            case 'temporalline':
                return this._chartsService.getTemporaLineDataService(url, tableFilter, apiKeyValue).pipe(
                    tap(this.processChartData(chartName)),
                    catchError(this.handleError(chartName))
                );
            default:
                this.searchingSubject.next(false);
                return throwError(new Error(`Unsupported chart type: ${chartType}`));
        }
    }


    private determineTableFilter(filters: any, pillar: string, isPrefCard: boolean): any {
        if (isPrefCard) {
            switch (pillar) {
                case "production":
                    return filters.oeeFilters
                case "quality":
                    return filters.qualityFilters
                case "movmat":
                    return filters.movMatFilters
                case "manut":
                    return filters.maintenanceFilters
                case "log":
                    return filters.logFilters
            }
        } else {
            return filters
        }
    }

    private processChartData(chartName: string) {
        return (data: any) => {
            this.chartDataSubject.next({ [chartName]: data });
            this.searchingSubject.next(false);
        };
    }

    private handleError(chartName: string) {
        return (error: any) => {
            console.error('Error fetching chart data for', chartName, error);
            this.searchingSubject.next(false);
            return throwError(error);
        };
    }
}


