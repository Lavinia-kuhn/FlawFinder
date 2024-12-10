import { Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { NzMessageService } from 'ng-zorro-antd/message';
import { Area, DualAxes, Gauge, Pie, WordCloud } from '@antv/g2plot';
import { IssueService } from 'src/libs/services/issue.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.less'],
})

export class DashboardComponent implements OnInit {




  public windowHeight = window.innerHeight;
  visible: boolean = false;
  constructor(
    private translate: TranslateService,
    private _issueService: IssueService,
    private router: Router,
    private message: NzMessageService,
  ) {
    translate.setDefaultLang('pt');

    window.addEventListener('resize', this.updateWindowHeight);

  }

  bugcount: number = 0;

  ngOnInit() {

    this._issueService.getbugCount().subscribe((data: any) =>{
      this.bugcount = data;
    }

    )

    this._issueService.getPareto().subscribe((data: any) => {
      const dualAxes = new DualAxes('container', {
        data: [data, data],
        xField: 'grouper',
        yField: ['count', 'value'],
        geometryOptions: [
          {
            geometry: 'column',
          },
          {
            geometry: 'line',
            lineStyle: {
              lineWidth: 2,
            },
          },
        ],
        meta: {
          count: { alias: 'Ocorrências' }, // Traduz 'count' para 'Ocorrências'
          value: { alias: 'Porcentagem' }, // Traduz 'value' para 'Porcentagem'
        },
      });

      dualAxes.render();
    });


    this._issueService.getLine().subscribe((data: any) => {
      const area = new Area('container3', {
        data: data,
        padding: 'auto',
        xField: 'grouper',
        yField: 'value',
        xAxis: {
          tickCount: 5,
        },
        meta: {
          value: { alias: 'Ocorrências' }, // Traduz 'value' para 'Ocorrências'
        },
      });

      area.render();
    });


    this._issueService.getPie().subscribe((data: any) => {

      const piePlot = new Pie('container2', {
        appendPadding: 10,
        data: data,
        angleField: 'value',
        colorField: 'type',
        radius: 0.9,
        label: {
          type: 'inner',
          offset: '-30%',
          content: ({ percent }) => `${(percent * 100).toFixed(0)}%`,
          style: {
            fontSize: 14,
            textAlign: 'center',
          },
        },
        interactions: [{ type: 'element-active' }],
      });

      piePlot.render();
    });

  
    this._issueService.getPareto().subscribe((data: any) => {
      const dualAxes = new DualAxes('container1', {
        data: [data, data],
        xField: 'grouper',
        yField: ['count', 'value'],
        geometryOptions: [
          {
            geometry: 'column',
          },
          {
            geometry: 'line',
            lineStyle: {
              lineWidth: 2,
            },
          },
        ],
        meta: {
          count: { alias: 'Ocorrências' }, // Traduz 'count' para 'Ocorrências'
          value: { alias: 'Porcentagem' }, // Traduz 'value' para 'Porcentagem'
        },
      });

      dualAxes.render();
    });

  }

  updateWindowHeight() {
    this.windowHeight = window.innerHeight;
  }

  addHeightInGrid() {
    return {
      'height': this.windowHeight - 200 + "px",
      'width': "100%"
    }
  }




}
