import { CommonModule } from "@angular/common";
import { NgModule } from '@angular/core';

import { NotFoundRoutingModule } from './404-routing.module';

import { NotFoundComponent } from './404.component';

import {MatGridListModule} from '@angular/material/grid-list';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatIconModule} from '@angular/material/icon';

import { NzFormModule } from 'ng-zorro-antd/form';




@NgModule({
  imports: [
  	CommonModule,
  	NotFoundRoutingModule,
    MatFormFieldModule,
    MatGridListModule,
    MatIconModule,
    NzFormModule,
  ],
  declarations: [NotFoundComponent],
  exports: [NotFoundComponent]
})
export class NotFoundModule { }
