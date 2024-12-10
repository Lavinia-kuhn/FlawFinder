import { NgModule } from '@angular/core';

import { NzSpaceModule } from 'ng-zorro-antd/space';
import { NzTabsModule } from 'ng-zorro-antd/tabs';
import { NzModalModule } from 'ng-zorro-antd/modal';
import { NzCheckboxModule } from 'ng-zorro-antd/checkbox';
import { NzDropDownModule } from 'ng-zorro-antd/dropdown';
import { NzMessageModule } from 'ng-zorro-antd/message';
import { NzGridModule } from 'ng-zorro-antd/grid';
import { NzProgressModule } from 'ng-zorro-antd/progress';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzInputModule } from 'ng-zorro-antd/input';
import { NzSpinModule } from 'ng-zorro-antd/spin';
import { NzSelectModule } from 'ng-zorro-antd/select';
import { NzAlertModule } from 'ng-zorro-antd/alert';
import { NzCollapseModule } from 'ng-zorro-antd/collapse';
import { NzCardModule } from 'ng-zorro-antd/card';
import { NzCarouselModule } from 'ng-zorro-antd/carousel';
import { NzDividerModule } from 'ng-zorro-antd/divider';
import { NzPopoverModule } from 'ng-zorro-antd/popover';
import { NzStatisticModule } from 'ng-zorro-antd/statistic';
import { NzMenuModule } from 'ng-zorro-antd/menu';
import { NzPopconfirmModule } from 'ng-zorro-antd/popconfirm';
import { NzDrawerModule } from 'ng-zorro-antd/drawer';
import { NzSwitchModule } from 'ng-zorro-antd/switch';
import { NzToolTipModule } from 'ng-zorro-antd/tooltip';
import { NzBadgeModule } from 'ng-zorro-antd/badge';
import { NzTagModule } from 'ng-zorro-antd/tag';
import { NzPaginationModule } from 'ng-zorro-antd/pagination';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzRadioModule } from 'ng-zorro-antd/radio';
import { NzAutocompleteModule } from 'ng-zorro-antd/auto-complete';

import { MatSelectModule } from '@angular/material/select';
import { MatButtonModule } from '@angular/material/button';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatGridListModule } from '@angular/material/grid-list';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatBadgeModule } from '@angular/material/badge';

//import { SwiperModule } from 'swiper/angular';
import { TimelineModule } from 'primeng/timeline';
import { CardModule } from 'primeng/card';
import { GridsterModule } from 'angular-gridster2';
import { NzListModule } from 'ng-zorro-antd/list';
import { MatCardModule } from '@angular/material/card';
import { ScrollingModule } from '@angular/cdk/scrolling';
import { InfiniteScrollModule } from 'ngx-infinite-scroll';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzLayoutModule } from 'ng-zorro-antd/layout';
import { NzQRCodeModule } from 'ng-zorro-antd/qr-code';
import { CarouselModule } from 'ngx-owl-carousel-o';
import { DeviceDetectorService } from 'ngx-device-detector';




@NgModule({
  exports: [
    NzTabsModule,
    NzModalModule,
    NzCheckboxModule,
    NzDropDownModule,
    NzMessageModule,
    NzGridModule,
    NzProgressModule,
    NzSelectModule,
    NzSpinModule,
    NzTagModule,
    NzIconModule,
    NzButtonModule,
    NzInputModule,
    NzAlertModule,
    NzCollapseModule,
    NzToolTipModule,
    NzBadgeModule,
    NzRadioModule,
    NzCardModule,
    NzCarouselModule,
    NzDividerModule,
    NzPaginationModule,
    NzPopoverModule,
    NzStatisticModule,
    NzSpaceModule,
    NzSwitchModule,
    NzMenuModule,
    NzPopconfirmModule,
    NzDrawerModule,
    MatGridListModule,
    MatFormFieldModule,
    MatIconModule,
    MatSelectModule,
    MatButtonModule,
    MatCheckboxModule,
    MatInputModule,
    MatBadgeModule,
    //  SwiperModule,
    TimelineModule,
    CardModule,
    GridsterModule,
    NzListModule,
    MatCardModule,
    ScrollingModule,
    InfiniteScrollModule,
    MatSnackBarModule,
    NzAutocompleteModule,
    NzFormModule,
    NzLayoutModule,
    CarouselModule,
    NzQRCodeModule

  ],
  providers: [
  ],

})
export class SharedModule { }