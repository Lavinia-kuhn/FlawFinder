import { CommonModule } from "@angular/common";
import { NgModule } from '@angular/core';
import { AgGridModule } from 'ag-grid-angular-legacy';


import { DashboardRoutingModule } from './dashboard-routing.module';

import { DashboardComponent } from './dashboard.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { PpiComponentsModule } from 'src/app/ppi-components.module';

import { NzModalModule } from 'ng-zorro-antd/modal';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzSelectModule } from 'ng-zorro-antd/select';
import { NzInputNumberModule } from 'ng-zorro-antd/input-number';
import { NzCheckboxModule } from 'ng-zorro-antd/checkbox';
import { NzGridModule } from 'ng-zorro-antd/grid';
import { NzDropDownModule } from 'ng-zorro-antd/dropdown';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzInputModule } from 'ng-zorro-antd/input';
import { NzMessageModule } from 'ng-zorro-antd/message';
import { TranslateLoader, TranslateModule } from "@ngx-translate/core";
import { TranslateService } from "src/libs/services/translate.service";
import { HttpClient } from "@angular/common/http";
import { TranslateHttpLoader } from "@ngx-translate/http-loader";

import { NzPopoverModule } from 'ng-zorro-antd/popover';


@NgModule({
  imports: [
  	CommonModule,
    DashboardRoutingModule,
    AgGridModule.withComponents([]),
    NzMessageModule,
    PpiComponentsModule,
    NzModalModule,
    NzFormModule,
    NzSelectModule,
    FormsModule,
    ReactiveFormsModule,
    NzInputNumberModule,
    NzCheckboxModule,
    NzGridModule,
    NzDropDownModule,
    NzButtonModule,
    NzPopoverModule,
    NzIconModule,
    NzInputModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        //useFactory: HttpLoaderFactory,
        useClass: (TranslateService),
        deps: [HttpClient]
      }
    }),
  ],
  declarations: [DashboardComponent],
  exports: [DashboardComponent]
})
export class DashboardModule { }

export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http);
}
