import { LoginService } from 'src/libs/services/login.service';
import { Component, AfterViewInit } from '@angular/core';
import { MainRoutes } from 'src/libs/routes-helper';
import { isMobile } from 'src/libs/helpers';
import { TranslateService } from '@ngx-translate/core';
import { LicenseManager } from 'ag-grid-enterprise';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { AppConfig } from 'src/libs/services/appConfig.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.less'],
  host: {
    '(window:resize)': 'onResize($event)',
  },
})
export class AppComponent {
  isMobile: boolean = isMobile();
  menuItems: Object = MainRoutes.filter((item) => item.data?.showInMenu === true);

  public guid: string;

  constructor(
    private translate: TranslateService,
    private _loginService: LoginService,
    public router: Router,
    private route: ActivatedRoute
  ) {

    const isMobileMode = window.innerWidth <= 1024;
    const andon = MainRoutes.find(item => item.path === 'andon');
    if (isMobileMode) {
      andon.data.showInMenu = false;
    }
 
    translate.setDefaultLang('pt');
    this.router.events.subscribe((url: any) => (router.url));


    LicenseManager.setLicenseKey(
      'CompanyName=PPI - MULTITASK SISTEMAS E AUTOMACAO SA,LicensedApplication=PC-Factory,LicenseType=SingleApplication,LicensedConcurrentDeveloperCount=1,LicensedProductionInstancesCount=0,AssetReference=AG-023402,ExpiryDate=26_February_2023_[v2]_MTY3NzM2OTYwMDAwMA==16313b0b5ef4c96ac394c31d03a25b55'
    );
  }

  ngOnInit(): void {
    environment.apiEndpoint = AppConfig.settings.apiServer.url;
    environment.pcfEndPoint = AppConfig.settings.pcfServer.url

    this.route.params.subscribe((params: Params) => {
      params.guid;
    });

    this.guid = this.route.snapshot.params['guid'];

    // Acessando e home e já logado encaminha para mapa
    var splitURL = location.href.split('/#/');
    if (splitURL[splitURL.length - 1] === '') {
      this.router.navigate(['/login']);
    }

    if (location.href.includes('andonscreen')) {
      var guidLink = location.href.split('andonscreen/')[1]
      // this._andonService.getAndonByGuid(guidLink).subscribe((data) => {
      //   this.guid = data.andonHD.link;
      // });
    }

    Object.keys(this.menuItems).forEach(index => {
      this.translate.get('GLOBAL.' + this.menuItems[index].data.name).subscribe((res: string) => {
        this.menuItems[index].data.name = res.includes('GLOBAL.') ? this.menuItems[index].data.name : res;
      });
    });
  }

  onResize(event) {
    setTimeout(() => {
      this.isMobile = isMobile(event.target.innerWidth);
    }, 250);
  }
}
