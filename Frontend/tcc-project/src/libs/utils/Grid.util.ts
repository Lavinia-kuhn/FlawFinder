import { TranslateService } from "@ngx-translate/core";
import * as moment from "moment";
import { UserPreferencesUtil } from "./UserPreferences.util";

export class GridUtil {
  constructor(private translate: TranslateService,) {
  }

  decimalToHex(number) {
    var intnumber = number - 0;
    var red, green, blue;
    var template = "#000000";

    red = (intnumber & 0x0000ff) << 16;
    green = intnumber & 0x00ff00;
    blue = (intnumber & 0xff0000) >>> 16;
    intnumber = red | green | blue;
    var HTMLcolor = intnumber.toString(16);

    HTMLcolor = template.substring(0, 7 - HTMLcolor.length) + HTMLcolor;

    return HTMLcolor;
  }

  sumGetter(params) {
    if (!params.values) return "0";

    var ValueSum = 0;
    params.values.forEach(function (value) {
      ValueSum += value != null && value != undefined ? parseFloat(value) : 0;
    });
    return ValueSum;
  }

  avgGetter(params) {
    if (!params.values) return "0";
    var sum = 0;
    params.values.forEach(value => {
      sum += value != null && value != undefined ? parseFloat(value) : 0;
    });
    return sum / params.values.length;
  }

  createValueObject(fieldName, runningTime, nPlanTime, wasteTime, noScheduleTime, productiveTime, planTime, scrapTime, reworkTime, productiveGrossTime, availableTime, loadTime, totalTime, oee, oe, teep, disponibilidade, utilizacao, performance, qualidade) {
    if (productiveTime == undefined)
      productiveTime = 0;
    return {
      fieldName: fieldName,
      runningTime: parseFloat(runningTime),
      nPlanTime: parseFloat(nPlanTime),
      planTime: parseFloat(planTime),
      wasteTime: parseFloat(wasteTime),
      noScheduleTime: parseFloat(noScheduleTime),
      productiveTime: parseFloat(productiveTime),
      scrapTime: parseFloat(scrapTime),
      reworkTime: parseFloat(reworkTime),
      productiveGrossTime: productiveGrossTime,
      availableTime: parseFloat(availableTime),
      loadTime: parseFloat(loadTime),
      totalTime: parseFloat(totalTime),
      oee: oee,
      oe: oe,
      teep: teep,
      disponibilidade: disponibilidade,
      utilizacao: utilizacao,
      performance: performance,
      qualidade: qualidade,
      toString: function () {

        switch (fieldName) {
          case "teep":
            return teep;
          case "oe":
            return oe;
          case "utilization":
            return utilizacao;
          case "oee":
            return oee;
          case "availability":
            return disponibilidade;
          case "performance":
            return performance;
          case "quality":
            return qualidade;
          case "avaliableTime":
            return availableTime;
          case "loadTime":
            return loadTime;
          case "totalTime":
            return totalTime;
          case "productiveGrossTime":
            return productiveGrossTime;
          default:
            return "";
        }
      },
    };
  }


  indicatorsValueGetter(params) {
    if (!params.node.group) {
      var productiveGrossTime = parseFloat(params.data.productiveTime) + parseFloat(params.data.scrapTime) + parseFloat(params.data.reworkTime);
      var availableTime = params.data.runningTime + params.data.nPlanTime;
      var loadTime = availableTime + params.data.wasteTime + params.data.planTime;
      var totalTime = loadTime + params.data.noScheduleTime;

      var oee = (params.data.runningTime + params.data.nPlanTime) == 0 ? 0 : (params.data.productiveTime / (params.data.runningTime + params.data.nPlanTime)) * 100;
      var oe = (params.data.runningTime + params.data.nPlanTime + params.data.wasteTime + params.data.planTime) == 0 ? 0 : (params.data.productiveTime / (params.data.runningTime + params.data.nPlanTime + params.data.wasteTime + params.data.planTime)) * 100;
      var teep = (params.data.runningTime + params.data.nPlanTime + params.data.wasteTime + params.data.planTime + params.data.noScheduleTimes) == 0 ? 0 : (params.data.productiveTime / (params.data.runningTime + params.data.nPlanTime + params.data.wasteTime + params.data.planTime + params.data.noScheduleTime)) * 100;
      var disponibilidade = (params.data.runningTime + params.data.nPlanTime) == 0 ? 0 : (params.data.runningTime / (params.data.runningTime + params.data.nPlanTime)) * 100;
      var utilizacao = (params.data.runningTime + params.data.nPlanTime + params.data.wasteTime + params.data.planTime) == 0 ? 0 : (params.data.runningTime / (params.data.runningTime + params.data.nPlanTime + params.data.wasteTime + params.data.planTime)) * 100;
      var performance = params.data.runningTime == 0 ? 0 : ((productiveGrossTime) / params.data.runningTime) * 100;
      var qualidade = (productiveGrossTime) == 0 ? 0 : (params.data.productiveTime / (productiveGrossTime)) * 100;

      return this.createValueObject(
        params.colDef.field,
        parseFloat(params.data.runningTime),
        parseFloat(params.data.nPlanTime),
        parseFloat(params.data.planTime),
        parseFloat(params.data.wasteTime),
        parseFloat(params.data.noScheduleTime),
        parseFloat(params.data.productiveTime),
        parseFloat(params.data.scrapTime),
        parseFloat(params.data.reworkTime),
        (productiveGrossTime),
        parseFloat(availableTime),
        parseFloat(loadTime),
        parseFloat(totalTime),
        (oee),
        (oe),
        (teep),
        (disponibilidade),
        (utilizacao),
        (performance),
        (qualidade),
      ).toString();
    }
    return "0";
  }

  indicatorsAggFunc(params) {
    var RunningTimeSum = 0;
    var NPlanTimeSum = 0;
    var WasteTimeSum = 0;
    var NoScheduleTimeSum = 0;
    var ProductiveTimeSum = 0;
    var PlanTimeSum = 0;
    var ScrapTimeSum = 0;
    var ReworkTimeSum = 0;
    var fieldName = params.colDef.field;
    var productiveGrossTime = 0;
    var availableTime = 0;
    var loadTime = 0;
    var totalTime = 0;

    var productiveGrossTimeSum = 0;
    var availableTimeSum = 0;
    var loadTimeSum = 0;
    var totalTimeSum = 0;

    var oeeSum = 0;
    var oeSum = 0;
    var teepSum = 0;
    var disponibilidadeSum = 0;
    var utilizacaoSum = 0;
    var performanceSum = 0;
    var qualidadeSum = 0;

    params.rowNode.childrenAfterFilter.forEach(function (value) {
      var agg = value.data ? value.data : value.aggData;

      if (agg.runningTime) { RunningTimeSum += parseFloat(agg.runningTime); }
      if (agg.nPlanTime) { NPlanTimeSum += parseFloat(agg.nPlanTime); }
      if (agg.wasteTime) { WasteTimeSum += parseFloat(agg.wasteTime); }
      if (agg.noScheduleTime) { NoScheduleTimeSum += parseFloat(agg.noScheduleTime); }
      if (agg.productiveTime) { ProductiveTimeSum += parseFloat(agg.productiveTime); }
      if (agg.planTime) { PlanTimeSum += parseFloat(agg.planTime); }
      if (agg.ScrapTime) { ScrapTimeSum += parseFloat(agg.ScrapTime); }
      if (agg.ReworkTime) { ReworkTimeSum += parseFloat(agg.ReworkTime); }
      if (agg.scrapTime) { ScrapTimeSum += parseFloat(agg.scrapTime); }
      if (agg.reworkTime) { ReworkTimeSum += parseFloat(agg.reworkTime); }

      if (agg) {
        productiveGrossTime = parseFloat(agg.productiveTime) + parseFloat(agg.scrapTime) + parseFloat(agg.reworkTime);
        availableTime = parseFloat(agg.runningTime) + parseFloat(agg.nPlanTime);
        loadTime = availableTime + parseFloat(agg.wasteTime) + parseFloat(agg.planTime);
        totalTime = loadTime + parseFloat(agg.noScheduleTime);

        productiveGrossTimeSum += productiveGrossTime;
        availableTimeSum += availableTime;
        loadTimeSum += loadTime;
        totalTimeSum += totalTime;
      }
    });

    var oeeSum = (RunningTimeSum + NPlanTimeSum) == 0 ? 0 : (ProductiveTimeSum / (RunningTimeSum + NPlanTimeSum)) * 100;
    var oeSum = (RunningTimeSum + NPlanTimeSum + WasteTimeSum + PlanTimeSum) == 0 ? 0 : (ProductiveTimeSum / (RunningTimeSum + NPlanTimeSum + WasteTimeSum + PlanTimeSum)) * 100;
    var teepSum = (RunningTimeSum + NPlanTimeSum + WasteTimeSum + PlanTimeSum + NoScheduleTimeSum) == 0 ? 0 : (ProductiveTimeSum / (RunningTimeSum + NPlanTimeSum + WasteTimeSum + PlanTimeSum + NoScheduleTimeSum)) * 100;
    var disponibilidadeSum = (RunningTimeSum + NPlanTimeSum) == 0 ? 0 : (RunningTimeSum / (RunningTimeSum + NPlanTimeSum)) * 100;
    var utilizacaoSum = (RunningTimeSum + NPlanTimeSum + WasteTimeSum + PlanTimeSum) == 0 ? 0 : (RunningTimeSum / (RunningTimeSum + NPlanTimeSum + WasteTimeSum + PlanTimeSum)) * 100;
    var performanceSum = RunningTimeSum == 0 ? 0 : ((productiveGrossTimeSum) / RunningTimeSum) * 100;
    var qualidadeSum = (productiveGrossTimeSum) == 0 ? 0 : (ProductiveTimeSum / (productiveGrossTimeSum)) * 100;

    return this.createValueObject(fieldName, RunningTimeSum, NPlanTimeSum, WasteTimeSum, NoScheduleTimeSum, ProductiveTimeSum, PlanTimeSum, ScrapTimeSum, ReworkTimeSum, productiveGrossTimeSum, availableTimeSum, loadTimeSum, totalTimeSum, oeeSum, oeSum, teepSum, disponibilidadeSum, utilizacaoSum, performanceSum, qualidadeSum).toString();
  }

  timeHoursFormatter(params) {
    var d = moment.duration(params.value, 'seconds');
    var hour = (Math.floor(d.asHours()) > 0 ? ((Math.floor(d.asHours()) < 10 ? "0" : "") + Math.floor(d.asHours())) : "0000");
    var min = (Math.floor(d.minutes()) > 0 ? ((Math.floor(d.minutes()) < 10 ? "0" : "") + Math.floor(d.minutes())) : "00");
    var sec = (Math.floor(d.seconds()) > 0 ? ((Math.floor(d.seconds()) < 10 ? "0" : "") + Math.floor(d.seconds())) : "00");

    return hour + ":" + min + ":" + sec;
  }

  timeHoursDaysFormatter(params) {
    var d = moment.duration(params.value, 'seconds');
    var day = (Math.floor(d.asDays()) > 0 ? ((Math.floor(d.asDays()) < 10 ? "0" : "") + Math.floor(d.asDays())) : "000");
    var hour;
    var trueHour;

    if ((params.value / 3600) > 24) {
      trueHour = ((params.value / 3600) / 24).toString();
      var trueHour = trueHour.split(".");
      if (trueHour.length == 2) {
        var asHours = (parseFloat("0." + trueHour[1].toString()) * 24);
        hour = (Math.floor(asHours) > 0 ? ((Math.floor(asHours) < 10 ? "0" : "") + Math.floor(asHours)) : "00");
      }
      else {
        hour = "00";
      }
    } else if ((params.value / 3600) == 24) {
      hour = "00";
    } else {
      hour = (Math.floor(d.asHours()) > 0 ? ((Math.floor(d.asHours()) < 10 ? "0" : "") + Math.floor(d.asHours())) : "00");
    }
    var min = (Math.floor(d.minutes()) > 0 ? ((Math.floor(d.minutes()) < 10 ? "0" : "") + Math.floor(d.minutes())) : "00");
    var sec = (Math.floor(d.seconds()) > 0 ? ((Math.floor(d.seconds()) < 10 ? "0" : "") + Math.floor(d.seconds())) : "00");

    return day + "d " + hour + ":" + min + ":" + sec;
  }

  numberFormatter(params) {
    if (!params.value || params.value === 0)
      return (0).toString();

    const decimalSeparator: string = UserPreferencesUtil.getLocalStorage().find((i) => i.code === 'DECIMALSEPARATOR').value === 'COMMA' ? ',' : '.';
    const decimalNumber = (Math.round(params.value * 100) / 100).toString().replace(".", decimalSeparator);
    const formattedNumber = thousandSeparatorFormatter(decimalNumber, 0, decimalSeparator);

    return formattedNumber;
  }

  decimal2Formatter(params) {
    if (!params.value || params.value === 0)
      return (0).toString();

    const decimalPlaces = 2;
    const decimalSeparator: string = UserPreferencesUtil.getLocalStorage().find((i) => i.code === 'DECIMALSEPARATOR').value === 'COMMA' ? ',' : '.';
    const decimalNumber = parseFloat(params.value).toFixed(decimalPlaces).toString().replace(".", decimalSeparator);
    const formattedNumber = thousandSeparatorFormatter(decimalNumber, decimalPlaces, decimalSeparator);

    return formattedNumber;
  }

  decimal4Formatter(params) {
    if (!params.value || params.value === 0)
      return (0).toString();

    const decimalPlaces = 4;
    const decimalSeparator: string = UserPreferencesUtil.getLocalStorage().find((i) => i.code === 'DECIMALSEPARATOR').value === 'COMMA' ? ',' : '.';
    const decimalNumber = parseFloat(params.value).toFixed(decimalPlaces).toString().replace(".", decimalSeparator);
    const formattedNumber = thousandSeparatorFormatter(decimalNumber, decimalPlaces, decimalSeparator);

    return formattedNumber;
  }

  decimalPref(pref, params) {
    if (!params.value || params.value === 0)
      return (0).toString();

    const decimalSeparator: string = UserPreferencesUtil.getLocalStorage().find((i) => i.code === 'DECIMALSEPARATOR').value === 'COMMA' ? ',' : '.';
    const decimalNumber = parseFloat(params.value).toFixed(pref).toString().replace(".", decimalSeparator);
    const formattedNumber = thousandSeparatorFormatter(decimalNumber, pref, decimalSeparator);

    return formattedNumber;
  }

  teepFormatter(params) {
    if (!params.value || params.value === 0)
      return '0%';

    const decimalSeparator: string = UserPreferencesUtil.getLocalStorage().find((i) => i.code === 'DECIMALSEPARATOR').value === 'COMMA' ? ',' : '.';
    const decimalTeep = Math.round(params.value / 100).toString().replace('.', decimalSeparator);
    const formattedTeep = thousandSeparatorFormatter(decimalTeep, 0, decimalSeparator) + "%";

    return formattedTeep;
  }

  intFormatter(params) {
    if (!params.value || params.value === 0) return (0).toString();
    return '' + parseInt(params.value);
  }

  dateFormatter(params) {
    if (!params.value || params.value === 0 || params.value === '0001-01-01T00:00:00') return '';
    return moment(params.value).locale(navigator.language).format("L")
  }

  dayFormatter(params) {
    if (!params.value || params.value === 0) return '';
    return moment.duration(params.value).asDays().toFixed(2);
  }

  andonLinkFormatter(params) {
    if (!params.value || params.value === 0) return '';

    var link = params.value;
    return '<a style ="color:#144772;" href="' + link + '" target="_blank" rel="noopener">' + link + '</a>'
  }

  andonPeriodFilterFormatter(params) {
    switch (params?.value) {
      case 1: return this.translate.instant("GLOBAL.VIEW_GLOBAL_SHIFT_1");
      case 2: return this.translate.instant("GLOBAL.VIEW_GLOBAL_SHIFT_2");
      case 3: return this.translate.instant("GLOBAL.VIEW_GLOBAL_SHIFT_3");
      case 4: return this.translate.instant("GLOBAL.VIEW_GLOBAL_SHIFT_4");
      case 5: return this.translate.instant("GLOBAL.VIEW_GLOBAL_SHIFT_5");
      case 6: return this.translate.instant("GLOBAL.VIEW_GLOBAL_SHIFT_6");

      case 110: return this.translate.instant("GLOBAL.VIEW_GLOBAL_TODAY");
      case 120: return this.translate.instant("GLOBAL.VIEW_GLOBAL_PREVIOUS_DAY");

      case 130: return this.translate.instant("GLOBAL.VIEW_GLOBAL_ACTUALMONTH");
      case 140: return this.translate.instant("GLOBAL.VIEW_GLOBAL_LASTMONTH");

      case 150: return this.translate.instant("GLOBAL.VIEW_GLOBAL_PREVIOUS_MONTH");
      
      default: return this.translate.instant("GLOBAL.VIEW_GLOBAL_TODAY");
    }
  }

  datetimeHoursFormatter(params) {
    if (!params.value || params.value === 0 || params.value === '0001-01-01T00:00:00') return '';
    return moment(params.value).locale(navigator.language).format("L LTS")
  }

  situationApprovalFormatter(params) {
    if (params.value != null) {
      if (params.value === 0) return '\u{274C}';
      if (params.value === 1) return '\u{2705}';
      if (params.value === 3) return '';
    }
    return '' + parseInt(params.value);
  }

  statusFlgValidatedFormatter(params) {
    if (params.value != null) {
      if (params.value === 0) return '\u{26A0}';
      if (params.value === 1) return '\u{2705}';
      if (params.value === 2) return '\u{274C}';
      if (params.value === 3) return '\u{2705}' + ' 100%';
    }
    return '' + parseInt(params.value);
  }

  percentPref(pref, params) {
    if (!params.value || params.value === 0)
      return (0).toString();

    const decimalSeparator: string = UserPreferencesUtil.getLocalStorage().find((i) => i.code === 'DECIMALSEPARATOR').value === 'COMMA' ? ',' : '.';
    const decimalNumber = parseFloat(params.value).toFixed(pref).toString().replace(".", decimalSeparator);
    const formattedNumber = thousandSeparatorFormatter(decimalNumber, pref, decimalSeparator);

    return formattedNumber;
  }

  tempPref(pref, params) {
    if (!params.value || params.value == 0 || params.value === '0001-01-01T00:00:00')
      return '';

    const decimalSeparator: string = UserPreferencesUtil.getLocalStorage().find((i) => i.code === 'DECIMALSEPARATOR').value === 'COMMA' ? ',' : '.';

    if (typeof params.value == 'string') {
      var op = params.value.split("(")

      if (pref == "2") {
        //CASO A HORA VENHA COM PORCENTAGEM
        if (op.length >= 2) {
          const decimalHour = moment.duration(op[0].trim()).asHours().toFixed(2).replace('.', decimalSeparator);
          const formattedHour = thousandSeparatorFormatter(decimalHour, 2, decimalSeparator) + " (" + op[1];

          return formattedHour;
        } else {
          return moment.duration(op[0]).asHours().toFixed(2);
        }
      } else {
        if (op.length >= 2) {
          var formatDate = moment(op[0].trim()).locale(navigator.language).format("L LTS") + " (" + op[1];
          if (formatDate.includes("Invalid date") || params.colDef.valueFormatterColumn == "tempFormatter")
            return params.value;
          return formatDate;
        } else {
          var formatDate = moment(op[0].trim()).locale(navigator.language).format("L LTS");
          if (formatDate.includes("Invalid date") || params.colDef.valueFormatterColumn == "tempFormatter")
            return params.value;
          return formatDate;
        }
      }
    } else {
      if (pref == 1) {
        const horas: number = Math.floor(params.value / 3600);
        const minutos: number = Math.floor((params.value % 3600) / 60);
        const segundos: number = params.value % 60;

        return `${horas.toString()}:${minutos.toString().padStart(2, '0')}:${segundos.toString().padStart(2, '0')}`;
      } else {
        const horas: number = params.value / 3600;

        return thousandSeparatorFormatter(horas.toFixed(2).toString().padStart(2, '0').replace('.', decimalSeparator), 2, decimalSeparator);
      }
    }
  }

  decimalSpeed(prefs, fieldColumn, params) {
    if (!params.data || params.data === 0)
      return (0).toString();

    const decimalSeparator: string = UserPreferencesUtil.getLocalStorage().find((i) => i.code === 'DECIMALSEPARATOR').value === 'COMMA' ? ',' : '.';

    switch (params.data[fieldColumn]) {
      case '1':
        return thousandSeparatorFormatter(parseFloat(params.value).toFixed(prefs[0]).toString().replace('.', decimalSeparator), prefs[0], decimalSeparator);
      case '2':
        return thousandSeparatorFormatter(parseFloat(params.value).toFixed(prefs[1]).toString().replace('.', decimalSeparator), prefs[1], decimalSeparator);
      case '3':
        return thousandSeparatorFormatter(parseFloat(params.value).toFixed(prefs[2]).toString().replace('.', decimalSeparator), prefs[2], decimalSeparator);
      case '4':
        return thousandSeparatorFormatter(parseFloat(params.value).toFixed(prefs[3]).toString().replace('.', decimalSeparator), prefs[3], decimalSeparator);
      case '5':
        return thousandSeparatorFormatter(parseFloat(params.value).toFixed(prefs[4]).toString().replace('.', decimalSeparator), prefs[4], decimalSeparator);
      case '6':
        return thousandSeparatorFormatter(parseFloat(params.value).toFixed(prefs[5]).toString().replace('.', decimalSeparator), prefs[5], decimalSeparator);
      default:
        return 0
    }
  }

  indicatorsValues(pref, fieldColumn, params) {
    if (params && fieldColumn != null && params.data) {
      var label = params.data[fieldColumn]
      var translate = this.translate.instant(pref + '.' + label)
      if (!translate.includes(pref)) {
        return translate
      } else {
        return label
      }
    }
  }

  verifyFormat(params) {
    if (params.data) {
      if (params.data["format"]) {
        const decimalSeparator: string = UserPreferencesUtil.getLocalStorage().find((i) => i.code === 'DECIMALSEPARATOR').value === 'COMMA' ? ',' : '.';

        switch (params.data["format"].toLowerCase()) {
          case 'number':
            if (!params.value || params.value === 0 || params.value == null)
              return null;

            return thousandSeparatorFormatter(parseFloat(params.value).toFixed(2).toString().replace('.', decimalSeparator), 2, decimalSeparator) + " " + (!params.data["unit"] ? "" : params.data["unit"]);
          case 'time':
            var d = moment.duration(params.value, 'seconds');
            var hour = (Math.floor(d.asHours()) > 0 ? ((Math.floor(d.asHours()) < 10 ? "0" : "") + Math.floor(d.asHours())) : "0000");
            var min = (Math.floor(d.minutes()) > 0 ? ((Math.floor(d.minutes()) < 10 ? "0" : "") + Math.floor(d.minutes())) : "00");
            var sec = (Math.floor(d.seconds()) > 0 ? ((Math.floor(d.seconds()) < 10 ? "0" : "") + Math.floor(d.seconds())) : "00");
            if (hour == '0000' && sec == '00' && min == '00')
              return null

            return hour + ":" + min + ":" + sec;
          case 'indicator':
            if (!params.value || params.value === 0 || params.value == null)
              return null;

            if (typeof params.value === 'string') {

              const goal = thousandSeparatorFormatter(parseFloat(params.value.trim().split('|')[1].replace(',', decimalSeparator)).toFixed(2).toString().replace('.', decimalSeparator), 2, decimalSeparator);
              const indicator = thousandSeparatorFormatter(parseFloat(params.value.trim().split('|')[2].replace(',', decimalSeparator)).toFixed(2).toString().replace('.', decimalSeparator), 2, decimalSeparator);

              return '<b>' + indicator + '%</b> <span style="color : #000000">(' + goal + '%)</span>';

            } else {
              return thousandSeparatorFormatter(parseFloat(params.value).toFixed(2).toString().replace('.', decimalSeparator), 2, decimalSeparator) + "%";
            }
          case '':
            return params.value;
        }
      } else return params.value;
    }
  }

  decimalSeparator(prefs, params) {
    if (typeof params.value == 'number') {
      const decimalSeparator: string = UserPreferencesUtil.getLocalStorage().find((i) => i.code === 'DECIMALSEPARATOR').value === 'COMMA' ? ',' : '.';

      if (params.value.toString().includes("e"))
        return thousandSeparatorFormatter(params.value.toFixed(Number(params.value.toString().split("-")[1])).toString().replace(".", decimalSeparator), Number(params.value.toString().split("-")[1]), decimalSeparator);
      else
        return thousandSeparatorFormatter(params.value.toFixed(CountDecimalPlaces(params.value)).toString().replace(".", decimalSeparator), CountDecimalPlaces(params.value), decimalSeparator);
    }

    return params.value;
  }

  formatSpeed(params) {
    switch (params.value) {
      //un/s
      case '1':
        if (!params.value || params.value === 0) return '';
        params.value = 'un/s';
        return params.value;
      //un/min
      case '2':
        if (!params.value || params.value === 0) return '';
        params.value = 'un/min';
        return params.value;
      //un/h
      case '3':
        if (!params.value || params.value === 0) return '';
        params.value = 'un/h'
        return params.value;
      //s/un
      case '4':
        if (!params.value || params.value === 0) return '';
        params.value = 's/un';
        return params.value;
      //min/un
      case '5':
        if (!params.value || params.value === 0) return '';
        params.value = 'min/un';
        return params.value;
      //h/un
      case '6':
        if (!params.value || params.value === 0) return '';
        params.value = 'h/un';
        return params.value;

      default:
        return ''
    }
  }

  formatMonth(params) {
    if (params.value != undefined) params.value = this.translate.instant(params.value);
    return params.value;
  }

  translateEnums(reportCode, params) {

    if (params.value == null) {
      return ""
    }
    if (reportCode == undefined) {
      reportCode = "GLOBAL";
    }
    let headerIdentifier = (reportCode + '.' + params.value).toUpperCase();
    return this.translate.instant(headerIdentifier);
  }
}

function CountDecimalPlaces(num) {
  // Verificar se o número é um número de ponto flutuante válido
  if (!Number.isFinite(num) || Number.isInteger(num)) {
    return 0; // Para números inteiros ou valores não numéricos, consideramos 0 casas decimais.
  }

  // Converter o número para string e encontrar a posição do ponto decimal
  let stringNum = num.toString();
  let decimalPosition = stringNum.indexOf('.');

  // Se não houver ponto decimal, não há casas decimais
  if (decimalPosition === -1) {
    return 0;
  }

  // Calcular o número de casas decimais
  return stringNum.length - decimalPosition - 1;
}

export function thousandSeparatorFormatter(value: any, decimalPlaces: number, decimalSeparator: string): string {
  const thousandSeparatorPreference = UserPreferencesUtil.getLocalStorage().find(preference => preference.code === 'THOUSANDSEPARATOR');

  if (thousandSeparatorPreference.value === 'DISABLED')
    return value;

  if (parseFloat(value) >= 1000) {
    const thousandSeparator = thousandSeparatorPreference.value === 'COMMA' ? ',' : '.';
    value = value.includes(',') ? value.replace(',', '.') : value;
    const stringValue = parseFloat(value).toFixed(decimalPlaces).toString().replace('.', decimalSeparator);
    const [integerPart, decimalPart] = stringValue.split(decimalSeparator);
    const formattedIntegerPart = integerPart.replace(/\B(?=(\d{3})+(?!\d))/g, thousandSeparator);

    const formattedNumber = decimalPart ? formattedIntegerPart + decimalSeparator + decimalPart : formattedIntegerPart;

    return formattedNumber;
  } else {
    return value;
  }
}