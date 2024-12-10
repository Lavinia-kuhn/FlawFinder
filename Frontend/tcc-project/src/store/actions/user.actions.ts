import { Action } from '@ngrx/store'
import { IUserPPI } from 'src/libs/models/user.interface'

export enum EUserActions {
  GetCurrent = '[USER] Get current'
}

export class GetCurrent implements Action {
  public readonly type = EUserActions.GetCurrent
  constructor(public payload: IUserPPI) {}
}

export type UserActions = GetCurrent