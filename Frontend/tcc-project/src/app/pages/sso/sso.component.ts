import { IssueService } from 'src/libs/services/issue.service';
import { OnInit, Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { TranslateService } from '@ngx-translate/core';
import { NzMessageService } from 'ng-zorro-antd/message';
import { LoginService } from 'src/libs/services/login.service';
import { TokenUtil } from 'src/libs/utils/Token.util';

@Component({
  selector: 'app-sso',
  templateUrl: './sso.component.html'
})

export class SSOComponent implements OnInit {
    
    public user: string;
    public password: string;

    constructor(
        private loginService: LoginService,
        private router: Router,
        private route: ActivatedRoute,
        private message: NzMessageService,
        private issueService: IssueService,
        private translate: TranslateService
      ) {
        this.user = this.route.snapshot.paramMap.get('user')
        this.password = this.route.snapshot.paramMap.get('password')
      }
    ngOnInit(): void {
      if(this.user && this.password){
        let obj = { user: atob(this.user), password: atob(this.password) }
        this.message.create('loading', this.translate.instant("Carregando usuário..."), { nzDuration: 0 });
        this.loginService.postLoginService(obj).subscribe((data) => {
          if(!data.token){
            this.router.navigate(['/login']);
          } else {
            TokenUtil.setLocalStorage(data);
            
            this.issueService.bugsFromJira();
            localStorage.removeItem('url');
            localStorage.setItem("user", atob(this.user));
            localStorage.setItem("password", atob(this.password));
            localStorage.setItem("rememberme", 'true');
            this.router.navigate(['/dashboard']);
            this.message.remove();
            this.message.success(this.translate.instant('Usuário carregado!'), { nzDuration: 0 });
            setTimeout(() => {
              location.reload();
            }, 2000);
          }
        });
      } else {
        this.router.navigate(['/login']);
      }
    }
}