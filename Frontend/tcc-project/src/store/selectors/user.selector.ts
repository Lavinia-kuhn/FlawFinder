import { createSelector } from '@ngrx/store'

import { IAppState } from 'src/store/state/app.state'
import { IUserState } from 'src/store/state/user.state'

const selectUser = (state: IAppState) => state.user

export const selectNotificationsList = createSelector(
  selectUser,
  (state: IUserState) => state.user
)