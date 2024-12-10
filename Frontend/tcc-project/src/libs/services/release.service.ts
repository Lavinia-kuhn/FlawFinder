import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class ReleaseService {

    constructor(private http: HttpClient) {
    }

    getRelease(): Observable<any> {
        const apiAddress = '../../assets/release/releaseNotes.json';
        const headers = new HttpHeaders().set('skipPcfUrl', 'true').set('skipPcfHeaders', 'true');
        return Observable.create(observer => {
            this.http.get(apiAddress, { headers: headers }).subscribe((res: Response) => {
                observer.next(res);
                observer.complete();
            },
                error => {
                    //  failed to retrieve from api, switch to local
                    this.http.get('../../assets/release/releaseNotes.json', { headers: headers }).subscribe((res: Response) => {
                        observer.next(res);
                        observer.complete();
                    });
                }
            );
        });
    }
}
