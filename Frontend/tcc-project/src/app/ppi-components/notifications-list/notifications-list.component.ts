import { TranslateService } from '@ngx-translate/core';
import { Component, OnInit, Input } from '@angular/core';
import { INotificationPPI } from 'src/libs/models/notifications.interface';

import { notificationInitialState } from 'src/libs/constants/notifications';
import { UserPreferencesUtil } from 'src/libs/utils/UserPreferences.util';

@Component({
  selector: 'app-notifications-list',
  templateUrl: './notifications-list.component.html',
  styleUrls: ['./notifications-list.component.less'],
})
export class PpiNotificationsListComponent implements OnInit {
  @Input() notification: INotificationPPI = notificationInitialState;

  constructor(
    public translate: TranslateService
  ) {
    translate.setDefaultLang('pt');
    translate.use(UserPreferencesUtil.getDefaultLanguageByPref());
  }

  ngOnInit(): void {}

}
