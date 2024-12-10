import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { environment } from '../../environments/environment';
import { IAppConfig } from './../models/appConfig.interface';

@Injectable()
export class AppConfig {
    static settings: IAppConfig;
    constructor(private http: HttpClient) { }

    load() {
        const jsonFile = `../../assets/config/config.${environment.name}.json`;
        const headers = new HttpHeaders().set('skipPcfUrl', 'true').set('skipPcfHeaders', 'true');
        return new Promise<void>((resolve, reject) => {
            this.http.get(jsonFile, { headers: headers }).toPromise().then((response: any) => {
                AppConfig.settings = <IAppConfig>response;
                resolve();
            }).catch((response: any) => {
                reject(`Could not load file '${jsonFile}': ${JSON.stringify(response)}`);
            });
        });
    }
}