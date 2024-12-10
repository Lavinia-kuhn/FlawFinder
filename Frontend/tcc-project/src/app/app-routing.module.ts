import { CommonModule } from '@angular/common';
import { BasicGuard } from 'src/libs/guard/basic.guard';
import { NgModule } from '@angular/core';
import { RouterModule, CanActivate } from '@angular/router';

import { MainRoutes } from './../libs/routes-helper';
import { SidebarRoutes } from './../libs/routes-helper';
import { ReportsRoutes } from './../libs/routes-helper';

@NgModule({
  imports: [
    RouterModule.forChild(SidebarRoutes),
    RouterModule.forChild(ReportsRoutes),
    RouterModule.forRoot(MainRoutes)
  ],
  exports: [RouterModule]
})
export class AppRoutingModule { 
  CanActivate: [BasicGuard]
}