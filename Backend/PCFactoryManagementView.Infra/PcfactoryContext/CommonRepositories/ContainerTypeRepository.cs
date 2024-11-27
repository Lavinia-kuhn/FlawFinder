using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class ContainerTypeRepository : IContainerTypeRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public ContainerTypeRepository(PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<ContainerTypeQueryResult> GetAllContainerType()
        {
            _log.LogInformation("ContainerTypeRepository: GetAllContainerType");
            var qry = $@"
                Select
                A.IDPackagingType AS 'ContainerTypeId',
                A.CODE AS 'ContainerTypeCode'
                FROM TBLPackagingType A 
                ORDER BY A.Code";

            return _context.Connection.Query<ContainerTypeQueryResult>(qry).ToList();
        }

        public List<ContainerTypeQueryResult> GetContainerTypeByCode(string code)
        {
            _log.LogInformation("ContainerTypeRepository: GetContainerTypeByCode");
            var count = "500";
            var qry = $@"Select
                A.IDPackagingType AS 'ContainerTypeId',
                A.CODE AS 'ContainerTypeCode'
                FROM TBLPackagingType A
                WHERE A.CODE LIKE '{code}%'";

            return _context.Connection.Query<ContainerTypeQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }

        public List<ContainerTypeQueryResult> GetPageContainerType(int pPage, int pSize)
        {
            _log.LogInformation("ContainerTypeRepository: GetPageContainerType");

            var qry = $@"
                Select
                A.IDPackagingType AS 'ContainerTypeId',
                A.CODE AS 'ContainerTypeCode'
                FROM TBLPackagingType A 
                ORDER BY A.Code";

            return _context.Connection.Query<ContainerTypeQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }
    }
}
