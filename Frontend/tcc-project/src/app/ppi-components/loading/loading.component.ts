import { TranslateService } from '@ngx-translate/core';
import { Component, OnInit, Input } from '@angular/core';

@Component({
  selector: 'app-loading',
  templateUrl: './loading.component.html',
  styleUrls: ['./loading.component.less']
})
export class LoadingComponent implements OnInit {


  constructor(private translate: TranslateService) {
    translate.setDefaultLang('pt');
  }

  ngOnInit(): void {
  }

}


