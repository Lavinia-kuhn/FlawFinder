import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-404',
  templateUrl: './404.component.html',
  styleUrls: ['./404.component.less']
})
export class NotFoundComponent implements OnInit {

  constructor(private translate: TranslateService) { 
    translate.setDefaultLang('pt');
  }

  NotFoundPage = this.translate.instant('GLOBAL.VIEW_GLOBAL_NOTFOUNDPAGES')
  DevelopItem = this.translate.instant('GLOBAL.VIEW_GLOBAL_DEVELOPITEM')

  ngOnInit() {
  }

}
