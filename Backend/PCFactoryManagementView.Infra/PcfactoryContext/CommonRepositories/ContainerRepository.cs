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
    public class ContainerRepository : IContainerRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public ContainerRepository(PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<ContainerQueryResult> GetAllContainer()
        {
            _log.LogInformation("ContainerRepository: GetAllContainer");
            var qry = $@"
                Select
                A.IDPackagingHD AS 'ContainerId',
                A.CODE AS 'ContainerCode'
                FROM TBLPackagingHD A 
                ORDER BY A.Code";

            return _context.Connection.Query<ContainerQueryResult>(qry).ToList();
        }

        public List<ContainerQueryResult> GetContainerByCode(string code)
        {
            _log.LogInformation("ContainerRepository: GetContainerByCode");
            var count = "500";
            var qry = $@"Select
                A.IDPackagingHD AS 'ContainerId',
                A.CODE AS 'ContainerCode'
                FROM TBLPackagingHD A
                WHERE A.CODE LIKE '{code}%'";

            return _context.Connection.Query<ContainerQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }

        public List<ContainerQueryResult> GetPageContainer(int pPage, int pSize)
        {
            _log.LogInformation("ContainerRepository: GetPageContainer");

            var qry = $@"
                Select
                A.IDPackagingHD AS 'ContainerId',
                A.CODE AS 'ContainerCode'
                FROM TBLPackagingHD A 
                ORDER BY A.Code";

            return _context.Connection.Query<ContainerQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }
    }
}
