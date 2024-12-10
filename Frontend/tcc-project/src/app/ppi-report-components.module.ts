import { CommonModule } from '@angular/common';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
import { TranslateLoader, TranslateModule } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { IconsProviderModule } from 'src/libs/icons-provider.module';
import { LoadingComponent } from './ppi-components/loading/loading.component';
import { PpiSubmenuComponent } from './ppi-components/submenu/submenu.component';
import { SharedModule } from './shared/shared.module';
//import { PpiTreeviewOMComponent } from './ppi-components/treeview-om/treeview-om.component';


@NgModule({
    declarations: [
        PpiSubmenuComponent,
        LoadingComponent,
        LoadingComponent,
    ],
    imports: [
        CommonModule,
        HttpClientModule,
        FormsModule,
        TranslateModule.forRoot({
            loader: {
                provide: TranslateLoader,
                useFactory: HttpLoaderFactory,
                deps: [HttpClient],
            },
        }),
        RouterModule,
        IconsProviderModule,
        SharedModule,
    ],
    providers: [],
    exports: [
        PpiSubmenuComponent,
        LoadingComponent,
        LoadingComponent,
    ]
})
export class PpiReportComponentsModule { }

export function HttpLoaderFactory(http: HttpClient) {
    return new TranslateHttpLoader(http);
}