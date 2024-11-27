using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands;
using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IMovMatFiltersHandler
    {
        string MovMetFiltersComposition(MovMatFiltersCommand filters, string movMatAlias, string warehouseAlias, string productFAlias, ETableMovMatName eTable);
    }
    public class MovMatFiltersHandler : IMovMatFiltersHandler
    {
        private ILoggerManager _log;

        public MovMatFiltersHandler(ILoggerManager log)
        {
            _log = log;
        }

        public string MovMetFormatedIds(List<int> ids)
        {
            string concatId = "";
            string formatedId = "";
            foreach (var id in ids)
            {
                concatId += id + ",";
            }
            return formatedId = concatId.Remove(concatId.Length - 1);
        }

        public string MovMetFiltersComposition(MovMatFiltersCommand filters, string movMatAlias, string warehouseAlias, string productFAlias, ETableMovMatName eTable)
        {
            _log.LogInformation("MovMetFiltersHandler: MovMetFiltersComposition");
            var result = "";

            if (filters == null) { 
                return result;
            }

            if (!string.IsNullOrEmpty(warehouseAlias))
                result += (filters.warehouse == null || filters.warehouse.Count == 0) ? "" : " AND " + warehouseAlias + ".idWarehouse IN (" + this.MovMetFormatedIds(filters.warehouse) + ")";
            
            if (!string.IsNullOrEmpty(productFAlias))
                result += (filters.productFamily == null || filters.productFamily.Count == 0) ? "" : " AND " + productFAlias + ".idProductFamily IN (" + this.MovMetFormatedIds(filters.productFamily) + ")";

            if (!string.IsNullOrEmpty(movMatAlias))
                result += (filters.address == null || filters.address.Count == 0) ? "" : " AND " + movMatAlias + ".idAddress IN (" + this.MovMetFormatedIds(filters.address) + ")";
            result += (filters.product == null || filters.product.Count == 0) ? "" : " AND " + movMatAlias + ".idProduct IN (" + this.MovMetFormatedIds(filters.product) + ")";
            result += (filters.productType == null || filters.productType.Count == 0) ? "" : " AND PRODTYPE.idProductType IN (" + this.MovMetFormatedIds(filters.productType) + ")";
            result += (filters.lot == null || filters.lot.Count == 0) ? "" : " AND " + movMatAlias + ".idLot IN (" + this.MovMetFormatedIds(filters.lot) + ")";

            if (eTable == ETableMovMatName.TBLMOVEV)
            {
                if (!string.IsNullOrEmpty(movMatAlias))
                    result += (string.IsNullOrEmpty(filters.startDate) || string.IsNullOrEmpty(filters.endDate)) ?
                    "" : " AND " + movMatAlias + ".DTMOV BETWEEN '" + filters.startDate + "' AND '" + filters.endDate + " 23:59:00'";
                    result += (filters.movType == null || filters.movType.Count == 0) ? "" : " AND " + movMatAlias + ".idMovType IN (" + this.MovMetFormatedIds(filters.movType) + ")";
                    result += (filters.movUn == null || filters.movUn.Count == 0) ? "" : " AND " + movMatAlias + ".idMovUn IN (" + this.MovMetFormatedIds(filters.movUn) + ")";
            }
            else if (eTable == ETableMovMatName.TBLMOVUN)
            {
                result += (filters.movUn == null || filters.movUn.Count == 0) ? "" : " AND " + movMatAlias + ".idMovUn IN (" + this.MovMetFormatedIds(filters.movUn) + ")";
                result += (filters.movType == null || filters.movType.Count == 0) ? "" : " AND " + movMatAlias + ".idMovType IN (" + this.MovMetFormatedIds(filters.movType) + ")";
            }


            return result;
        }
    }
}
