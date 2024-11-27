using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class AddressGroupRepository : IAddressGroupRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public AddressGroupRepository
        (
           PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<AddressGroupQueryResult> GetAllAddressGroup()
        {
            _log.LogInformation("AddressGroupRepository: GetAllAddressGroup");
            var qry = $@"
				SELECT 
                A.IDAddressGroup 'addressGroupId', 
                A.Code AS 'addressGroupCode', 
                A.Name AS 'addressGroupName'
                from TBLAddressGroup A
                ORDER BY A.Code ";

            return _context.Connection.Query<AddressGroupQueryResult>(qry).ToList();
        }

        public List<AddressGroupQueryResult> GetPageAddressGroup(int pPage, int pSize)
        {
            _log.LogInformation("AddressGroupRepository: GetAllAddressGroup");
            var qry = $@"
				SELECT 
                A.IDAddressGroup 'addressGroupId', 
                A.Code AS 'addressGroupCode', 
                A.Name AS 'addressGroupName'
                from TBLAddressGroup A
                ORDER BY A.Code";

            return _context.Connection.Query<AddressGroupQueryResult>(qry).Skip(pPage*pSize).Take(pSize).ToList();
        }

        public List<AddressGroupQueryResult> GetAddressGroupByCode(string code)
        {
            _log.LogInformation("AddressGroupRepository: GetAddressGroupByCode");
            var count = "100";
            var qry = $@"
                SELECT 
                A.IDAddressGroup 'addressGroupId', 
                A.Code AS 'addressGroupCode', 
                A.Name AS 'addressGroupName'
                from TBLAddressGroup A
                WHERE A.CODE LIKE '{code}%'
                ORDER BY A.Code
                ";

            return _context.Connection.Query<AddressGroupQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }
    }
}
