import { CommonModule } from "@angular/common";
import { NgModule } from '@angular/core';

import { TranslateLoader, TranslateModule } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { HttpClient, HttpClientModule } from '@angular/common/http';

import { SSORoutingModule } from './sso-routing.module';
import { SSOComponent } from './sso.component';

import { HTTP_INTERCEPTORS } from "@angular/common/http";
import { HttpRequestInterceptor } from "src/libs/interceptor/http-interceptor";
import { TranslateService } from "src/libs/services/translate.service";

@NgModule({
  imports: [
    CommonModule,
    HttpClientModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        //useFactory: HttpLoaderFactory,
        useClass: (TranslateService),
        deps: [HttpClient]
      }
    }),
    SSORoutingModule,
  ],
  declarations: [
    SSOComponent,
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: HttpRequestInterceptor,
      multi: true
    }
  ],
  exports: [SSOComponent]
})
export class SSOModule { }

export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http);
}