import { ActionReducerMap } from '@ngrx/store'
import { routerReducer } from '@ngrx/router-store'

import { IAppState } from 'src/store/state/app.state'
import { userReducer } from './user.reducer'

export const appReducer: ActionReducerMap<IAppState, any> = {
  router: routerReducer,
  user: userReducer
}