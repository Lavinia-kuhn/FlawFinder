import { TranslateService } from '@ngx-translate/core';
import { IReport } from './../../../libs/models/report.interface';
import { Component, OnInit, ElementRef } from '@angular/core';
import { ReportService } from 'src/libs/services/report.service';
import { isMobile } from './../../../libs/helpers';
import { Router } from '@angular/router';

@Component({
  selector: 'app-submenu',
  templateUrl: './submenu.component.html',
  styleUrls: ['./submenu.component.less'],
})
export class PpiSubmenuComponent implements OnInit {
  isDropdownVisible: boolean;
  reports: IReport[];
  reportMenuItems: IReport[];
  isMobile: boolean = isMobile();
  public selectMenu: IReport;

  public alert: boolean = true;

  constructor(
    private _reportService: ReportService,
    private _el: ElementRef,
    public router: Router,
    public translate: TranslateService
  ) {
    translate.setDefaultLang('pt');
    
    this.router.events.subscribe((url: any) => router.url);

  }

  onResize(event) {
    this.isMobile = isMobile();
  }

  ngOnInit(): void {}
    
}

