export interface IReportChartSelect {
  type: string, 
  label: string 
}

export interface IReport {
	id: string,
  name: string,
  submenu: IReport[],
  advancedFilter: boolean,
  reportMenuSlug: string,
  reportMenuLabel: string,
  tabs: [IReportTab],
  product: boolean,
  link: string
}

export interface IReportChart {
  type: string,
  chartUrl: string,
  customChartProperties: string,
	ganttData: [],
	paretoData: [],
	columnsData: [],
	chartData: [],
	select: [IReportChartSelect]
}

export interface IReportFilterItem {
  label: string,
  value: string
}

export interface IReportTab {
	id: string,
  title: string,
  breadcrumb: [],
  showBreadcrumb: boolean,
  mainChart: IReportChart,
  preference: string,
  filterRow: string,
}

export interface IPrefsCard {
  preferences: any,
  preferencePivot: any,
}

export interface IDeletePreferences {
  idPref: number,
  idUser: number,
  idDefaultAdm: number
}

export interface IDeletePreferencesCard {
  idPref: number,
  idUser: number,
  idDefaultAdm: number,
  label: string
}
export interface IReportPreferencesCard {
	preferences: string,
  idUser: number,
  urlCode: string,
}
export interface ISelectItem {
	value: string,
  label: string
}