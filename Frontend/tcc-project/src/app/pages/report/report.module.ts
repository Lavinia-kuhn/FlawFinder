import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { ActiveReportsModule } from '@grapecity/activereports-angular';
import { FormsModule } from '@angular/forms';
import { TranslateLoader, TranslateModule } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { HttpClient, HttpClientModule } from '@angular/common/http';
import { ReportRoutingModule } from './report-routing.module';
import { ReportComponent } from './report.component';
import { NzSpinModule } from 'ng-zorro-antd/spin';
import { NzTabsModule } from 'ng-zorro-antd/tabs';
import { NzTreeModule } from 'ng-zorro-antd/tree';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzModalModule } from 'ng-zorro-antd/modal';
import { NzSelectModule } from 'ng-zorro-antd/select';
import { NzAlertModule } from 'ng-zorro-antd/alert';
import { NzDropDownModule } from 'ng-zorro-antd/dropdown';
import { NzCheckboxModule } from 'ng-zorro-antd/checkbox';
import { NzRadioModule } from 'ng-zorro-antd/radio';
import { NzMessageModule } from 'ng-zorro-antd/message';
import { NzInputModule } from 'ng-zorro-antd/input';
import { PpiComponentsModule } from 'src/app/ppi-components.module';
import { PpiReportComponentsModule } from 'src/app/ppi-report-components.module';
import { NzCollapseModule } from 'ng-zorro-antd/collapse';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzSwitchModule } from 'ng-zorro-antd/switch';
import { TranslateService } from 'src/libs/services/translate.service';
import { NzPopoverModule } from 'ng-zorro-antd/popover';
import { CarouselModule } from 'ngx-owl-carousel-o';
import { NzTableModule } from 'ng-zorro-antd/table';
import { AgGridModule } from 'ag-grid-angular-legacy';

@NgModule({
  imports: [
    HttpClientModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
      //  useFactory: HttpLoaderFactory,
        useClass: (TranslateService),
        deps: [HttpClient],
      },
    }),
    CommonModule,
    AgGridModule.withComponents([]),
    ReportRoutingModule,
    NzSpinModule,
    NzTabsModule,
    NzTreeModule,
    NzIconModule,
    PpiComponentsModule,
    NzDropDownModule,
    NzModalModule,
    NzSwitchModule,
    NzPopoverModule,
    NzAlertModule,
    NzDropDownModule,
    NzButtonModule,
    FormsModule,
    NzCheckboxModule,
    NzRadioModule,
    NzMessageModule,
    NzInputModule,
    NzSelectModule,
    ActiveReportsModule,
    NzCollapseModule,
    CarouselModule,
    PpiReportComponentsModule,
    NzTableModule
  ],
  declarations: [
    ReportComponent
  ],
  exports: [ReportComponent],
})
export class ReportModule {}

export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http);
}
