export interface IDashboard {
    idDashboardHD: number;
    viewName: string;
    dtCreation: Date;
    idUserCreation: number,
    userCreation: string,
    dtLastUpdate: Date,
    idUserLastUpdate: number;
    userLastUpdate: string;
    savedForMore: boolean;
    dets: IDashboardDet[];
    viewFilters?: string;
    viewPreference?: string;
    mainView?: boolean;
}

export interface IDashboardDet {
    idDashboardDet: number;
    idDashboardHD: number;
    idCard: number;
    cardName: string;
    cardType: string;
    cardUrl: string;
    filtersJson: string;
    pillar: string;
    isPreferenceCard: boolean;
    isDuplicatedCard: boolean;
    idPref: number;
    isCustomCard: boolean;
    // idCardFather: number;
    savedForMore: boolean;
    gridsterPref: string;
    gridsterConfig: GridsterConfig;
    visible: boolean;
}

export class GridsterConfig {
    visible: boolean = false;
    cols: number = 1;
    rows: number = 1;
    idCard: number = 0;
    widget: string = '';
    height: number = 0;
    width: number = 0;
    chartUrl: string = '';
    x: number = 0;
    y: number = 0;
    idLastEditUser: number = 0;
    idPref: number = 0;
    idPrefOrigin: number = 0;
    isPrefCard: boolean = false;
    pillar: string = '';
    fieldType: string = '';
    gridsterPref: string = '';
}
export class DashboardDetails {
    data: IDashboardDet[];
    name: string = "";
    mobile: boolean = false;
    isEditable: boolean = false;
    idDashboardHd: number = 0;
    idUser: number = 1;
}

export class CardCommand {
    iDCard: number;
    cardName: string;
    cardType: string;
    cardUrl: string;
    height: number;
    width: number;
    filtersJson: string;
    pillar: string;
    isCustomCard: boolean;
    isDuplicatedCard: boolean;
    flgPreference: number;
    // idCardFather: number;
    savedForMore: boolean;
    visible: boolean;
    dtCreation: Date;
    idUserCreation: number;
    idPref: number;
}

export class ReportCardCommand {
    card: CardCommand;
    prefsCard: any;
}