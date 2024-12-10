import { TokenUtil } from 'src/libs/utils/Token.util';
import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { Router } from '@angular/router';
import { NzMessageService } from 'ng-zorro-antd/message';

@Component({
  selector: 'app-user-menu',
  templateUrl: './user-menu.component.html',
  styleUrls: ['./user-menu.component.less'],
})
export class UserMenuComponent implements OnInit {
  userLog: string;

  constructor(
    private router: Router,
    public translate: TranslateService,
    private message: NzMessageService
  ) {
    translate.setDefaultLang('pt');
  }

  ngOnInit(): void {
    var user = TokenUtil.getLocalStorage();
    if(user != null && user.name){
      this.userLog = user.name;
    }
  }

  copyText() {
    const tempElement = document.createElement('textarea');
    document.body.appendChild(tempElement);
    tempElement.select();
    document.execCommand('copy');
    document.body.removeChild(tempElement);
    this.message.create('success', 'Texto copiado!', {nzDuration: 500});
  }

  isLogout() {
    TokenUtil.clearLocalStorage();
    this.router.navigate(['/login'])
  }
}
