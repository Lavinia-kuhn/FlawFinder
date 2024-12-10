import { CommonModule } from "@angular/common";
import { NgModule } from '@angular/core';


import { LoginRoutingModule } from './login-routing.module';
import { LoginComponent } from './login.component';

import { TranslateLoader, TranslateModule } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { HttpClient } from '@angular/common/http';
import { TranslateService } from "src/libs/services/translate.service";

import { FormsModule, ReactiveFormsModule } from '@angular/forms';


import { NzLayoutModule } from "ng-zorro-antd/layout";
import { NzGridModule } from "ng-zorro-antd/grid";
import { SharedModule } from "src/app/shared/shared.module";
import { MatInputModule } from "@angular/material/input";
import { MatCardModule } from "@angular/material/card";
import { MatFormFieldModule } from "@angular/material/form-field";
import { MatButtonModule } from "@angular/material/button";
import { MatCheckboxModule } from "@angular/material/checkbox";
import { MatIconModule } from "@angular/material/icon";
import { MatSelectModule } from "@angular/material/select";

// import { NzGridModule, NzLayoutModule } from "ng-zorro-antd";


@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    LoginRoutingModule,
    MatInputModule,
    MatCardModule,
    MatFormFieldModule,
    MatButtonModule,
    MatCheckboxModule,
    MatIconModule,
    MatFormFieldModule,
    MatSelectModule,
    NzLayoutModule,
    NzGridModule,
    ReactiveFormsModule,
    SharedModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        //useFactory: HttpLoaderFactory,
        useClass: (TranslateService),
        deps: [HttpClient]
      }
    }),
  ],
  declarations: [LoginComponent],
  exports: [LoginComponent]
})
export class LoginModule { }

export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http);
}
