import { BasicGuard } from 'src/libs/guard/basic.guard';
import { Routes } from '@angular/router';

// const path: string = 'src/app/pages/'

export const ReportsRoutes: Routes = [
  { path: 'report/oee/:reportCode', canActivate: [BasicGuard], loadChildren: () => import('src/app/pages/report/report.module').then(m => m.ReportModule) },
];

export const MainRoutes: Routes = [
  { path: '', pathMatch: 'full', redirectTo: '/map', data: { name: 'VIEW_GLOBAL_HOME', code: '', icon: 'home' } },
  { path: 'sso/:user/:password', loadChildren: () => import('src/app/pages/sso/sso.module').then(m => m.SSOModule)},
  { path: 'report', pathMatch: 'full', redirectTo: '/report/oee/G0001', data: { name: 'VIEW_GLOBAL_REPORT', code: 'report', showInMenu: false, icon: 'reports' } },
  { path: 'dashboard', canActivate: [BasicGuard], loadChildren: () => import('src/app/pages/dashboard/dashboard.module').then(m => m.DashboardModule), data: { name: 'VIEW_OEEDASHBOARD', code: 'viewdashboardtable', showInMenu: true, icon: 'dashboard' } },
  { path: 'login', loadChildren: () => import('src/app/pages/login/login.module').then(m => m.LoginModule), data: { name: 'Login', code: 'login', showInMenu: false, icon: null } },
  { path: '404', loadChildren: () => import('src/app/pages/404/404.module').then(m => m.NotFoundModule), data: { name: '404', code: '404', showInMenu: false, icon: null } },
  { path: '**', pathMatch: 'full', redirectTo: '/404', data: { name: 'All', code: 'all' } },
];

export const SidebarRoutes: Routes = [
  { path: 'map', canActivate: [BasicGuard], loadChildren: () => import('src/app/pages/report/report.module').then(m => m.ReportModule), data: { name: 'VIEW_GLOBAL_REPORT', code: 'map', icon: 'production' } },
  
]