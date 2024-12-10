import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { DragDropModule } from '@angular/cdk/drag-drop';


import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { IconsProviderModule } from 'src/libs/icons-provider.module';

import { TranslateLoader, TranslateModule } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { HttpClient, HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';

import { FormsModule } from '@angular/forms';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

import { NotificationsFacade } from 'src/libs/facade/notifications.facade';

import { PpiComponentsModule } from 'src/app/ppi-components.module';
import { PpiSidebarNavComponent } from 'src/app/ppi-components/sidebar-nav/sidebar-nav.component';
import { UserMenuComponent } from 'src/app/ppi-components/user-menu/user-menu.component';
import { HttpRequestInterceptor } from 'src/libs/interceptor/http-interceptor';
import { TranslateService } from 'src/libs/services/translate.service';
import { UserService } from 'src/libs/services/user.service';
import { LocationStrategy, HashLocationStrategy } from '@angular/common';
import { LoginComponent } from './pages/login/login.component';
import { SSOComponent } from './pages/sso/sso.component';
import { LoginService } from './../libs/services/login.service';
import { BasicGuard } from 'src/libs/guard/basic.guard';

import { APP_INITIALIZER } from '@angular/core';
import { AppConfig } from '../libs/services/appConfig.service';
import { PpiReportComponentsModule } from './ppi-report-components.module';
import { SharedModule } from './shared/shared.module';
import { DirectivesModule } from './directives/swiper.module';
import { AngularFireModule } from '@angular/fire/compat'
import { AngularFirestoreModule } from '@angular/fire/compat/firestore'
import { environment } from 'src/environments/environment';


export function initializeApp(appConfig: AppConfig) {
  return () => appConfig.load();
}
@NgModule({
  declarations: [
    AppComponent,
    PpiSidebarNavComponent,
    UserMenuComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useClass: (TranslateService),
        //useFactory: HttpLoaderFactory,
        deps: [HttpClient],
      },
      defaultLanguage: 'pt'
    }),
    IconsProviderModule,
    FormsModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    PpiComponentsModule,
    PpiReportComponentsModule,
    DragDropModule,
    SharedModule,
    DirectivesModule,
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFirestoreModule.enablePersistence()
  ],
  providers: [
    NotificationsFacade,
    LoginService,
    LoginComponent,
    SSOComponent,
    BasicGuard,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: HttpRequestInterceptor,
      multi: true
    },
    UserService,
    { provide: LocationStrategy, useClass: HashLocationStrategy },
    AppConfig,
    {
      provide: APP_INITIALIZER,
      useFactory: initializeApp,
      deps: [AppConfig],
      multi: true
    }
  ],
  bootstrap: [AppComponent],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }

export function HttpLoaderFactory(http: HttpClient) {
  return new TranslateHttpLoader(http);
}
