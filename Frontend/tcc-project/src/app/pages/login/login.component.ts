import { Router } from '@angular/router';
import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { UntypedFormBuilder, UntypedFormGroup } from '@angular/forms';
import { LoginService } from 'src/libs/services/login.service';
import { TokenUtil } from 'src/libs/utils/Token.util';
import { ILogin, UserLogin } from 'src/libs/models/user.interface';
import { UserService } from 'src/libs/services/user.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { TranslateService } from '@ngx-translate/core';
import { NzMessageService } from 'ng-zorro-antd/message';
import { IssueService } from 'src/libs/services/issue.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.less'],
})
export class LoginComponent implements OnInit {


  @ViewChild('usuario') usuario: ElementRef;

  public loginForm: UntypedFormGroup;
  public tokenUser: ILogin;
  public preferencesUser: any;
  public isAdLogin: boolean = false;
  public waiting: boolean = false;
  public remember: boolean;
  public hide: boolean = true;

  constructor(
    private formBuilder: UntypedFormBuilder,
    private loginService: LoginService,
    private router: Router,
    private userService: UserService,
    private _snackBar: MatSnackBar,
    private translate: TranslateService,
    private message: NzMessageService,
    private _issueService: IssueService
  ) {
    translate.setDefaultLang('pt');

    this.userService.getPcfAuthenticateConfig().subscribe((data) => {
      this.isAdLogin = data;
    }, (error) => {
      this.isAdLogin = false;
    });
  }

  passwordError = false;
  togglePasswordVisibility(): void {
    this.hide = !this.hide
  }

  handleEnterAsSpace() {
    this.checkbox(this.remember ? true : false);
  }

  ngOnInit(): void {

    const isValidJson = (value) => {
      try {
        JSON.parse(value);
        return true;
      } catch (e) {
        return false;
      }
    };

    const rememberme = isValidJson(localStorage.rememberme) ? localStorage.rememberme : 'false';

    this.loginForm = this.formBuilder.group({
      user: [localStorage.user ? window.atob(localStorage.user) : ''],
      password: [localStorage.password ? window.atob(localStorage.password) : ''],
      remember: [JSON.parse(rememberme)]
    });

    localStorage.setItem("rememberme", rememberme);
    localStorage.setItem("user", localStorage.user || "");
    localStorage.setItem("password", localStorage.password || "");

    if (!JSON.parse(rememberme)) {
      localStorage.setItem("user", "");
      localStorage.setItem("password", "");
      this.loginForm = this.formBuilder.group({
        user: [],
        password: [],
        remember: [false]
      });
    } else {
      this.remember = true;
      this.loginForm = this.formBuilder.group({
        user: [window.atob(localStorage.user)],
        password: [window.atob(localStorage.password)],
        remember: [true]
      });
    }
  }


  checkbox(event: any) {
    //This pass an event to have true or false from Checkbox to remember at localStorage
  }

  getLogin() {
    const user = this.loginForm.get('user').value;
    const password = this.loginForm.get('password').value;

    if (user == "" || password == "") {
      this.showMessage('Preencha os campos!');
      return;
    }

    const obj = { user: user, password: password };
    this.waiting = true;
    if (!this.isAdLogin) {
      this.loginService.postLoginService(obj).subscribe((data) => {
        this.tokenUser = data;
        this.preferencesUser = data.prefs;
        TokenUtil.setLocalStorage(this.tokenUser)
        if (data.code && data.token.length > 0) {
          this._issueService.bugsFromJira().subscribe((data) => {}, (error) => {});
          this.router.navigate(['dashboard']);
          localStorage.setItem("user", window.btoa(user));
          localStorage.setItem("password", window.btoa(password));
          localStorage.setItem("rememberme", (this.remember ? "true" : "false"));
        } else if (!data.code) {
          this.message.create('error', this.translate.instant('GLOBAL.VIEW_GLOBAL_USERNAMEERROR'), { nzDuration: 2500 });
          this.loginForm.reset();
          this.usuario.nativeElement.focus();
        } else {
          this.message.create('error', this.translate.instant('GLOBAL.VIEW_GLOBAL_PASSWORDERROR'), { nzDuration: 2500 });
          this.passwordError = true;
        }
        this.waiting = false;
      }, (error) => {
        this.waiting = false;
        this.message.create('error', this.translate.instant('GLOBAL.VIEW_GLOBAL_USERNAME&PASSWORDERROR'), { nzDuration: 2500 });
      });
    } else {
      let userLogin = new UserLogin();
      userLogin.user = user;
      userLogin.password = password;
      this.userService.postPcfLogin(userLogin).subscribe((data) => {
        this.mvLogin();
        this.waiting = false;
      }
        , (error) => {
          this.message.create('error', this.translate.instant('GLOBAL.VIEW_GLOBAL_USERNAME&PASSWORDERROR'), { nzDuration: 2500 });
          this.waiting = false;
        })
    }
  }

  change() {
    this.passwordError = false;
  }

  mvLogin() {
    const user = this.loginForm.get('user').value;
    const password = this.loginForm.get('password').value;
    const obj = { user: user, password: password };
    this.loginService.postAdLoginService(obj).subscribe((data) => {
      this.tokenUser = data;
      this.preferencesUser = data.prefs;
      TokenUtil.setLocalStorage(this.tokenUser);
      if (data.code && data.token.length > 0) {
        this.router.navigate(['dashboard']);
      } else if (!data.code) {
        this.message.create('error', this.translate.instant('GLOBAL.VIEW_GLOBAL_USERNAMEERROR'), { nzDuration: 2500 });
        this.loginForm.reset();
        this.usuario.nativeElement.focus();
      } else {
        this.message.create('error', this.translate.instant('GLOBAL.VIEW_GLOBAL_PASSWORDERROR'), { nzDuration: 2500 });
        this.passwordError = true;
      }
      this.waiting = false;
    }, (error) => {
      this.waiting = false;
    });
  }

  showMessage(message: string) {
    this._snackBar.open(message, "OK", { duration: 3000 });
  }
}
