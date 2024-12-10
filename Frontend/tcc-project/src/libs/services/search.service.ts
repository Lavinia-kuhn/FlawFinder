import { Observable } from 'rxjs';
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { ISearchResult } from '../models/search.interface';


@Injectable({
  providedIn: 'root'
})

export class SearchService {

  constructor(private http: HttpClient) { }

  public getAllByLang(lang: string, idUser: number): Observable<ISearchResult[]> {
    return this.http.get<ISearchResult[]>('menu/V1/GetAllPagesToSearchControl/'+ lang + '&' + idUser);
  }
}
