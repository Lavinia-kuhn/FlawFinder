import { Component, OnInit, AfterViewInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { TranslateService } from '@ngx-translate/core';
import { UserService } from 'src/libs/services/user.service';
import { ReportService } from 'src/libs/services/report.service';
import { NzMessageService } from 'ng-zorro-antd/message';


@Component({
  selector: 'app-report',
  templateUrl: './report.component.html',
  styleUrls: ['./report.component.less'],
})
export class ReportComponent implements OnInit, AfterViewInit {

  columnDefs = [
    {
      headerName: 'Cód. Bug',
      field: 'bugCode',
      sortable: true,
      filter: true,
      maxWidth: 200,
    },
    {
      headerName: 'Motivo',
      field: 'name',
      sortable: true,
      filter: true,
      flex: 2,
    },
    {
      headerName: 'Data',
      field: 'date',
      sortable: true,
      filter: true,
      maxWidth: 200,
    },
  ];

  rowData = [];

  defaultColDef = {
    resizable: true,
  };


  private gridApi: any;

  constructor(
    public route: ActivatedRoute,
    private router: Router,
    private _userService: UserService,
    private _reportService: ReportService,
    private message: NzMessageService,
    private translate: TranslateService
  ) {
    translate.setDefaultLang('pt');


    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);

  }


  ngOnInit(): void {
    this._reportService.getReport().subscribe((data: any) => {
      this.rowData = data;
    });
  }

  onGridReady(params: any) {
    this.gridApi = params.api;

    setTimeout(() => {
      this.gridApi.sizeColumnsToFit();
    }, 500);

  }

  onGridDataRead

  ngAfterViewInit() {
    window.addEventListener('resize', () => this.gridApi?.sizeColumnsToFit());
  }

}
