import { Component, ChangeDetectionStrategy, ElementRef, Renderer2 } from '@angular/core';
import { SidebarRoutes } from 'src/libs/routes-helper';
import { UserService } from 'src/libs/services/user.service';
import { TranslateService } from '@ngx-translate/core';
import { NzMessageService } from 'ng-zorro-antd/message';
import { environment } from 'src/environments/environment';

import { TokenUtil } from 'src/libs/utils/Token.util';
import { Router, NavigationExtras } from '@angular/router';
import { firstValueFrom } from 'rxjs';
import { DashboardService } from 'src/libs/services/dashboard.service';

@Component({
  selector: 'app-sidebar-nav',
  templateUrl: './sidebar-nav.component.html',
  styleUrls: ['./sidebar-nav.component.less'],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class PpiSidebarNavComponent {
  public isCollapsed: boolean = true;
  public sidebarRoutes: Object = SidebarRoutes;
  public menuMode: string = 'vertical';

  public selectMenu: any;
  public alert: boolean = true;
  public isSuggestionVisible: boolean;

  constructor(
    private _el: ElementRef,
    private _userService: UserService,
    private router: Router,
    public translate: TranslateService,
    private message: NzMessageService,
    private _dashboardService: DashboardService,
    private renderer: Renderer2
  ) {
    translate.setDefaultLang('pt');
  }


  public toggleMenu = () => {
    this.isCollapsed = !this.isCollapsed;
    this.menuMode = this.isCollapsed ? 'vertical' : 'inline';
    if (this.isCollapsed) {
      this.renderer.removeClass(document.body, 'locked');
    } else {
      this.renderer.addClass(document.body, 'locked');
    }
  };

  goToRelease() {
    this.router.navigate(['/release']);
  }

  async goToDashboard() {
    this.router.navigate(['/dashboard']);

  }

  async goToReport() {
    this.router.navigate(['/report']);

  }

  openSuggestionBox() {
    this.isSuggestionVisible = true;
  }

  closeSuggestionBox() {
    this.isSuggestionVisible = false;
  }

  goToHelp() {
    window.open(environment.pcfEndPoint + "pcfui/doc/html/INDEX.HTML?managementview.html", "_blank");
  }

  public closeSidebar() {
    this.isCollapsed = true;
    this.renderer.removeClass(document.body, 'locked');
  }



  loadPath(name: string, path: string) {
    let navigation: NavigationExtras = {};

    if (name !== null) {
      navigation = {
        queryParams: {
          quickAccessName: name
        }
      }
    }

    this.router.navigate([path], navigation);
  }


}
