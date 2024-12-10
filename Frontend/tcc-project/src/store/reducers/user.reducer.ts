import { EUserActions, UserActions } from 'src/store/actions/user.actions'
import { initialUserState, IUserState } from 'src/store/state/user.state'

export const userReducer = (
  state = initialUserState,
  action: UserActions
): IUserState => {
  switch (action.type) {
    case EUserActions.GetCurrent: {
      return {
        ...state,
        user: action.payload
      }
    }
    default:
      return state
  }
}