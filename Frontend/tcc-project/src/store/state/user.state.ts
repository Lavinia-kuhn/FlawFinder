import { IUserPPI } from 'src/libs/models/user.interface'

export interface IUserState {
  user: IUserPPI;
}

export const initialUserState: IUserState = {
  user: {
    id: 0,
    name: ''
  }
}