export class ChartsUtil{

    public static deepEquals(x, y) {
        if (x === y) {      
          return true; 
        } else if (!(x instanceof Object) || !(y instanceof Object)) {
          return false; 
        } else if (x.constructor !== y.constructor) {
               return false;
        } else {
          for (const p in x) {
            if (!x.hasOwnProperty(p)) {
              continue; 
            }
            if (!y.hasOwnProperty(p)) {
              return false;
            }
            if (x[p] === y[p]) {
              continue; 
            }
            if (typeof (x[p]) !== 'object') {
              return false; 
            }
            if (!this.deepEquals(x[p], y[p])) {
              return false;
            }
          }
          for (const p in y) {
            if (y.hasOwnProperty(p) && !x.hasOwnProperty(p)) {
              return false;
            }
          }      
          return true;
        }
      }

      public decimalSeparator(value, separator){
      if(typeof value == 'number'){
        if(separator == 'COMMA'){
          return value.toString().replace('.', ',');
        } else {
          return value.toString().replace(',', '.');
        }
      }
      return value;
    }

    decimalNumberFormatter(value){
      return parseFloat(value.toString().replace(',', "."));
    }
}