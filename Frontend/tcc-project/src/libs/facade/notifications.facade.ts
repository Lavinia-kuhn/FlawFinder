import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

import * as api from './constants.facade';

import * as INotification from 'src/libs/models/notifications.interface';

@Injectable()
export class NotificationsFacade {
  constructor(private _http: HttpClient) {}

  getAllNotifications() {
    return this._http.get<INotification.INotificationPPI[]>(
      api.apiUrl(api.endPoints.NOTIFICATIONS)
    );
  }

  putNotificationsStatus(notificationID: number, notification: any) {
    return this._http.put<INotification.INotificationPPI>(
      api.apiUrl(api.endPoints.NOTIFICATIONS, notificationID),
      notification
    );

  }
}
