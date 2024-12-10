import { Injectable } from '@angular/core';

interface prefGrid {
  label: string,
  subtitles: string[]
}

@Injectable({
  providedIn: 'root',
})

export class SubtitleService {
    private prefGrid: prefGrid[] = [];
  
    setInformacao(info: prefGrid) {
      this.prefGrid = this.prefGrid.filter(item => item.label !== info.label);
      this.prefGrid.push(info);
    }
  
    getInformacao(): prefGrid[] {
      return this.prefGrid;
    }
  }