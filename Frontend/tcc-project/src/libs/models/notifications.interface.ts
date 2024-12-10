export interface INotificationPPI {
  description: string,
  id: number,
  machineId: number,
  reported: string,
  statusDescription: string,
  status: string,
  time: string,
  ackMap: boolean,
  ackGlobal: boolean,
  alarmCodeName: string,
  alarmTypeStr: string,
  alarmExecutionTime : string,
  alarmIcon : string,
  alarmId : number,
  idResource: number,
  idResourceMapHD : number,
  idAddressMapHD: number
}

export interface IAlarmNotification{
  alarmEvCode: string,
  alarmCodeName: string,
  alarmExecutionTime: string,
  resourceCode: string,
  resourceName: string,
  alarmType: number,
  dtTimeStamp: Date,
  alarmId: number
  idResourceMapHD: number,
  idAddressMapHD: number,
  idResource: number
}