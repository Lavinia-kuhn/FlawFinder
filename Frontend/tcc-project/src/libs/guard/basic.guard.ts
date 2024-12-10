import { TokenUtil } from 'src/libs/utils/Token.util';
import { ActivatedRouteSnapshot, CanActivate, Router } from '@angular/router';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { catchError, map } from 'rxjs/operators';


@Injectable({
  providedIn: 'root'
})
export class BasicGuard implements CanActivate {

  constructor(private route: Router,
    private httpClient: HttpClient) {
  }

  canActivate(route: ActivatedRouteSnapshot): Observable<boolean> {
    const user = TokenUtil.getLocalStorage();
    const localVersion = TokenUtil.getVersionInLocalStorage();
    console.log(localVersion)
    if (!user || !user.token || !localVersion) {
      this.route.navigate(['/login']);
      return of(false);
    }

    return this.httpClient.get('Authorization/v1').pipe(
      map(res => {
        if (!res)
          this.route.navigate(['/login']);

        return (res) ? true : false;
      }),
      catchError((err) => {
        this.route.navigate(['/login']);
        return of(false);
      })
    );
  }
}
