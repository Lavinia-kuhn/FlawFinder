export interface IUserPPI {
  id: number,
  name: string
}

export interface IUserCode {
  userId: number,
  userCode: string
}

export interface ILogin {
  idUser: number,
  code: string,
  email: string,
  name: string,
  pcfToken: string,
  pcfExpirationDate: string;
  token: string,
  language: string,
  userGroups: any[],
  userRoles: any[],
  idDefaultAdmin: number,
  prefs: any[]
}

export interface IInputLogin {
  user: string,
  password: string
}

export class UserLogin {
  user: string;
  password: string;
}

export interface IUserSetting {
  idPref: number;
  code: string;
  value: string;
  flgExist: boolean;
}


export class PreferencesCommand {
  idUser: number;
  preferences: IUserSetting[];
}
export class CardsPreferencesCommand {
  idUser: number;
  cardName: string;
  configuration: {
    position: number;
    visible: boolean;
    size: number;
    height: number;
    parameters: ICardParameters[];
  }
}

export class AndonPreferencesCommand {
  Xml: {};
  XmlField: string;
  IDAndonHd: number;
  Code: string;
  Link: string;
  GridsterConfig: string;
  GridPageTime: number;
  ChangePageTime: number;
  RefreshContentTime: number;
  IDResourceMapHD: number;
  idAddressMapHd: number;
  ShiftConfig: number;
  FlgEnable: number;
  DtCreation: string;
  IDUserLastUpdate: number;
  DtLastUpdate: string;

}

export class CardsPreferencesCommands {
  idUser: number;
  cardName: string;
  configuration: {
    position: number;
    visible: boolean;
    size: number;
    height: number;
    parameters: ICardParameters[];
    idLastEditUser: number;
  }

}

export interface ICardParameters {
  paramName: string;
  paramValue: string;
}

export interface PCFUserInformation {
  userName: string;
  userCode: string;
  idUser: number;
  idLanguage: number;
  openKeyBoard: number;
  companyName: string;
  callback: URL;
  refreshToken: string;
  accessToken: string;
  accessTokenIssueDateUtc?: Date;
  accessTokenExpirationUtc?: Date;
  scope: Set<string>;
  isAdAuthentication: boolean;
  expirationPwdDays: number;
  idAlarmList: number[];
}
