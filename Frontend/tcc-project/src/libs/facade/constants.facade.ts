export const api = 'http://localhost:3000/'

export const endPoints = {
  FAVOURITES: 'userFavourites',
  QUICKACCESS: 'userQuickAccess',
  CARDS: 'userDashboardCards',
  NOTIFICATIONS: 'notifications'
}

export const apiUrl = (endpoint, id: number = null) => {
  let url = endpoint
  url = id ? url + '/' + id : url
  return url;
}