import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SSOComponent } from './sso.component';

const routes: Routes = [
  { path: '', component: SSOComponent },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SSORoutingModule { }
