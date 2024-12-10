export class ScrollingUtil{
  public static scroll(server, page, size, objetoUpdate, className, reportCode: string = ''):any
  {
      var aux:any;
      if(reportCode !== '' && reportCode == 'G0114')
      {
          server.getIntegrationPage(page, size).subscribe((data) =>{
              aux = data;
              if(aux !== undefined && aux.length > 0)
              {
                  return this.switchObject(objetoUpdate, aux, className);
              }
              else
              {
                  page = page - 1;
              }
          });
      } else {
          server.getPage(page, size).subscribe((data) =>{
              aux = data;
              if(aux !== undefined && aux.length > 0)
              {
                  return this.switchObject(objetoUpdate, aux, className);
              }
              else
              {
                  page = page - 1;
              }
          });
      }
  }

  public static switchObject(list, listAux, className)
  {
      switch(className)
      {
          case 'IWarehouse':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.warehouseCode === item.warehouseCode
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'IProduct':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.productCode === item.productCode
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'ILot':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.lotCode === item.lotCode
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'IMovUn':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.movUnCode === item.movUnCode
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'IAddress':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.addressCode === item.addressCode
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'IResource':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.code === item.code
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'IWorkOrder':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.code === item.code
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'ICharacteristicDomain':
            listAux.forEach(item =>{
                var result = list.find(i =>{
                    return i.code === item.code
                });
                if (result == undefined)
                {
                    list.push(item);
                }
            });
      break;

          case 'IProductFamily':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.productFamilyCode === item.productFamilyCode
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'IProductType':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.productTypeCode === item.productTypeCode
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'IMovType':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.movTypeCode === item.movTypeCode
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'IContainer':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.containerCode === item.containerCode
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'IContainerType':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.contTypeCode === item.contTypeCode
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'IContainerFamily':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.contFamilyCode === item.contFamilyCode
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'ICodeOrder':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.wohdCode === item.wohdCode
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'ICodeOperation':
              listAux.forEach(item =>{
                  var result = list.find(i =>{
                      return i.wodetCode === item.wodetCode
                  });
                  if (result == undefined)
                  {
                      list.push(item);
                  }
              });
          break;
          case 'ICodeAuditTrailTable':
            listAux.forEach(item =>{
                var result = list.find(i =>{
                    return i.tableCode === item.tableCode
                });
                if (result == undefined)
                {
                    list.push(item);
                }
            });
        break;
        case 'ICodeUser':
            listAux.forEach(item =>{
                var result = list.find(i =>{
                    return i.userCode === item.userCode
                });
                if (result == undefined)
                {
                    list.push(item);
                }
            });
        break;
      }
  }
}
