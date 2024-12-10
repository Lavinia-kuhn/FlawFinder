import { Pipe, PipeTransform } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import { UserPreferencesUtil } from 'src/libs/utils/UserPreferences.util';

@Pipe({ name: 'filterByCardType' })

export class FilterByCardTypePipe implements PipeTransform {

  constructor(private translate: TranslateService) {
    translate.setDefaultLang('pt');
    translate.use(UserPreferencesUtil.getDefaultLanguageByPref());
  }

  transform(listOfData: any[], searchCard: string, searchPillar: string): any[] {
    if (!searchCard && !searchPillar) {
      return listOfData;
    }
    
    return listOfData.filter(data => {
      const matchCard = !searchCard || this.translate.instant(data.cardName.toLowerCase()).includes(searchCard.toLowerCase());
      const matchPillar = !searchPillar || searchPillar.toLowerCase() === "customize" ?
        data.isCustomCard || data.isDuplicatedCard :
        data.pillar.toLowerCase() == searchPillar.toLowerCase() && !data.isCustomCard && !data.isDuplicatedCard;
      return matchCard && matchPillar;
    });
  }
}