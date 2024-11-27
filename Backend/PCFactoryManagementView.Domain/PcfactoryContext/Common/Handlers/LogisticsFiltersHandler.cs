using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands;
using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface ILogisticsFiltersHandler
    {
        string LogisticsFiltersComposition(LogisticsFiltersCommand filters, string dateAlias = "", string originWHalias = "", string endWHalias = "", string originAdrGpalias = "", string endAdrGpalias = "", string endAdralias = "", string routealias = "");
    }
    public class LogisticsFiltersHandler : ILogisticsFiltersHandler
    {
        private ILoggerManager _log;

        public LogisticsFiltersHandler(ILoggerManager log)
        {
            _log = log;
        }

        public string LogisticsFormatedIds(List<int> ids)
        {
            string concatId = "";
            string formatedId = "";
            foreach (var id in ids)
            {
                concatId += id + ",";
            }
            return formatedId = concatId.Remove(concatId.Length - 1);
        }

        public string LogisticsFiltersComposition(LogisticsFiltersCommand filters, string dateAlias = "", string originWHalias = "", string endWHalias = "", string originAdrGpalias = "", string endAdrGpalias = "", string endAdralias = "", string routealias = "")
        {
            _log.LogInformation("LogisticsFiltersHandler: LogisticsFiltersComposition");
            var result = "";

            if (filters == null)
            {
                return result;
            }

            if(!string.IsNullOrEmpty(dateAlias))
            result += (string.IsNullOrEmpty(filters.startDate) || string.IsNullOrEmpty(filters.endDate)) ?
                 "" :
                 " AND " + dateAlias + " BETWEEN '" + filters.startDate + "' AND '" + filters.endDate + " 23:59:59'";

            if(!string.IsNullOrEmpty(originWHalias))
            result += (filters.originWarehouses == null || filters.originWarehouses.Count == 0) ? "" : " AND " + originWHalias +".IDWarehouse IN (" + this.LogisticsFormatedIds(filters.originWarehouses) + ")";

            if (!string.IsNullOrEmpty(endWHalias))
                result += (filters.endWarehouses == null || filters.endWarehouses.Count == 0) ? "" : " AND " + endWHalias + ".IDWarehouse IN (" + this.LogisticsFormatedIds(filters.endWarehouses) + ")";

            if (!string.IsNullOrEmpty(originAdrGpalias))
                result += (filters.originAddressGroup == null || filters.originAddressGroup.Count == 0) ? "" : " AND " + originAdrGpalias + ".IDAddressGroup IN (" + this.LogisticsFormatedIds(filters.originAddressGroup) + ")";

            if (!string.IsNullOrEmpty(endAdrGpalias))
                result += (filters.endAddressGroup == null || filters.endAddressGroup.Count == 0) ? "" : " AND " + endAdrGpalias + ".IDAddressGroup IN (" + this.LogisticsFormatedIds(filters.endAddressGroup) + ")";

            if (!string.IsNullOrEmpty(endAdralias))
                result += (filters.endAddresses == null || filters.endAddresses.Count == 0) ? "" : " AND " + endAdralias + ".IDAddress IN (" + this.LogisticsFormatedIds(filters.endAddresses) + ")";

            if (!string.IsNullOrEmpty(routealias))
                result += (filters.routes == null || filters.routes.Count == 0) ? "" : " AND " + routealias + ".idtransportroutehd IN (" + this.LogisticsFormatedIds(filters.routes) + ")";

            return result;
        }


    }
}
