import { Component } from '@angular/core';
import { ICellRendererAngularComp } from 'ag-grid-angular-legacy';
import { ICellRendererParams } from 'ag-grid-enterprise';

@Component({
  selector: 'app-main-view-dashboard',
  templateUrl: './main-view-dashboard.component.html',
  styles: []
})
export class MainViewDashboard implements ICellRendererAngularComp {
  
  public value: boolean = true;
  public checked: boolean = false;
  public disabled: boolean = false;

  agInit(params: ICellRendererParams): void {
    this.checked = params.data.mainView;
    // this.disabled = params.data.mainView;
  }
  
  refresh(params: ICellRendererParams): boolean {
    this.checked = params.data.mainView;
    // this.disabled = params.data.mainView;
    return this.checked;
  }
}