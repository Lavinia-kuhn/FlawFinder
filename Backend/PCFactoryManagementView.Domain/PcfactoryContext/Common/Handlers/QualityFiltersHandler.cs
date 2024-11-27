using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands.Inputs;
using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IQualityFiltersHandler
    {
        string QualityFiltersComposition(QualityFiltersCommand filters, string tableAlias, ETableQualityName? table, bool flgAlarmEv = false);
        string CharacteristicSpecFiltersComposition(CharacteristicSpecFiltersCommand filters, string tableAlias, string wodetJoinAlias, string datesJoinAlias, string datesFieldName);
        string FormatedIds(List<int> ids);
    }
    public class QualityFiltersHandler : IQualityFiltersHandler
    {
        private ILoggerManager _log;

        public QualityFiltersHandler(ILoggerManager log)
        {
            _log = log;
        }

        public string FormatedIds(List<int> ids)
        {
            string concatId = "";

            foreach (var id in ids)
            {
                concatId += id + ",";
            }
            return concatId.Remove(concatId.Length - 1);
        }


        public string QualityFiltersComposition(QualityFiltersCommand filters, string tableAlias, ETableQualityName? eTable, bool flgAlarmEv)
        {
            _log.LogInformation("MovMetFiltersHandler: MovMetFiltersComposition");
            var result = "";

            if (filters == null)
            {
                return result;
            }

            result += (string.IsNullOrEmpty(filters.startDate) || string.IsNullOrEmpty(filters.endDate)) ?
                   "" :
                   " AND " + tableAlias + ".DtCreation BETWEEN '" + filters.startDate + " 00:00:00.000' AND '" + filters.endDate + " 23:59:59.999'";

            if (!string.IsNullOrEmpty(tableAlias))
                if (eTable != ETableQualityName.TBLINSPPPLANHD)
                {
                    result += (filters.lot == null || filters.lot[0] == 0 || filters.lot[0] == -1) ? "" : " AND " + tableAlias + ".IDLot IN (" + FormatedIds(filters.lot) + ")";

                    result += (filters.movUn == null || filters.movUn[0] == 0 || filters.movUn[0] == -1) ? "" : " AND " + tableAlias + ".IDMovUn IN (" + FormatedIds(filters.movUn) + ")";

                    result += (filters.charDomain == null || filters.charDomain[0] == 0 || filters.charDomain[0] == -1) ? "" : " AND " + tableAlias + ".IDCharacteristicDomain IN (" + FormatedIds(filters.charDomain) + ")";

                }

            result += (filters.product == null || filters.product[0] == 0 || filters.product[0] == -1) ? "" : " AND " + tableAlias + ".IDProduct IN (" + FormatedIds(filters.product) + ")";

            result += (filters.familyProduct == null || filters.familyProduct[0] == 0 || filters.familyProduct[0] == -1) ? "" : " AND " + tableAlias + ".IDProductFamily IN (" + FormatedIds(filters.familyProduct) + ")";
            
            result += (filters.typeProduct == null || filters.typeProduct[0] == 0 || filters.typeProduct[0] == -1) ? "" : " AND  PRODTYPE.IDProductType IN (" + FormatedIds(filters.typeProduct) + ")";

            result += (filters.resource == null || filters.resource == 0 || filters.resource == -1) ? "" : " AND " + tableAlias + (flgAlarmEv ? ".IDResourceRef = " : ".IDResource = ") + filters.resource + " ";

            result += (filters.wohd == null || filters.wohd == 0 || filters.wohd == -1) ? "" : " AND " + tableAlias + ".IDWOHD = " + filters.wohd + " ";

            result += (string.IsNullOrEmpty(filters.wodet)
            //|| (filters.wohd == null || filters.wohd == 0 || filters.wohd == -1)
            ) ? "" :
            " AND " + tableAlias + @$".IDWODET IN (SELECT IDWODET FROM TBLWODET WHERE
                --IDWOHD = {filters.wohd} AND                
                CODE = '{filters.wodet}') ";
            return result;
        }

        public string CharacteristicSpecFiltersComposition(CharacteristicSpecFiltersCommand filters, string tableAlias, string wodetJoinAlias, string datesJoinAlias, string datesFieldName)
        {
            _log.LogInformation("MovMetFiltersHandler: MovMetFiltersComposition");
            var result = "";

            if (filters == null)
            {
                return result;
            }

            if (!String.IsNullOrEmpty(datesJoinAlias) && !String.IsNullOrEmpty(datesFieldName))
                result += (string.IsNullOrEmpty(filters.StartDate) || string.IsNullOrEmpty(filters.EndDate)) ?
                    "" :
                    " AND " + datesJoinAlias + "." + datesFieldName + " BETWEEN '" + filters.StartDate + " 00:00:00.000' AND '" + filters.EndDate + " 23:59:59.999'";

            result += (filters.Product == null || filters.Product <= 0) ? "" : " AND " + tableAlias + ".IDProduct = " + filters.Product;

            result += (filters.Resource == null || filters.Resource <= 0) ? "" : " AND " + tableAlias + ".IDResource = " + filters.Resource;

            result += (filters.CharacteristicDomain == null || filters.CharacteristicDomain <= 0) ? "" : " AND " + tableAlias + ".IDCharacteristicDomain = " + filters.CharacteristicDomain;

            result += (filters.ProductFamily == null || filters.ProductFamily <= 0) ? "" : " AND " + tableAlias + ".IDProductFamily = " + filters.ProductFamily;

            result += (filters.ProductRaw == null || filters.ProductRaw <= 0) ? "" : " AND " + tableAlias + ".IDProductRaw = " + filters.ProductRaw;

            result += (filters.ProductAttribute == null || filters.ProductAttribute == "0" || filters.ProductAttribute == "-1") ? "" : " AND SPEC.IDProduct = " + filters.ProductAttribute.Split('.')[0] + " AND PRODATTR.IDAttribute = " + filters.ProductAttribute.Split('.')[1];

            result += (filters.Wohd == null || filters.Wohd <= 0) ? "" : " AND " + tableAlias + ".IDWOHD = " + filters.Wohd;

            result += String.IsNullOrEmpty(filters.Wodet) ? "" : " AND " + wodetJoinAlias + ".Code LIKE '%" + filters.Wodet + "%'";

            return result;
        }
    }
}
