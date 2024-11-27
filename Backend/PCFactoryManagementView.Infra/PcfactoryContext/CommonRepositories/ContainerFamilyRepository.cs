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
    public class ContainerFamilyRepository : IContainerFamilyRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public ContainerFamilyRepository(PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<ContainerFamilyQueryResult> GetAllContainerFamily()
        {
            _log.LogInformation("ContainerFamilyRepository: GetAllContainerFamily");
            var qry = $@"
                Select
                A.IDPackagingFamily AS 'ContainerFamilyId',
                A.CODE AS 'ContainerFamilyCode'
                FROM TBLPackagingFamily A 
                ORDER BY A.Code";

            return _context.Connection.Query<ContainerFamilyQueryResult>(qry).ToList();
        }

        public List<ContainerFamilyQueryResult> GetContainerFamilyByCode(string code)
        {
            _log.LogInformation("ContainerFamilyRepository: GetContainerFamilyByCode");
            var count = "500";
            var qry = $@"Select
                A.IDPackagingFamily AS 'ContainerFamilyId',
                A.CODE AS 'ContainerFamilyCode'
                FROM TBLPackagingFamily A
                WHERE A.CODE LIKE '{code}%'";

            return _context.Connection.Query<ContainerFamilyQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }

        public List<ContainerFamilyQueryResult> GetPageContainerFamily(int pPage, int pSize)
        {
            _log.LogInformation("ContainerFamilyRepository: GetPageContainerFamily");

            var qry = $@"
                Select
                A.IDPackagingFamily AS 'ContainerFamilyId',
                A.CODE AS 'ContainerFamilyCode'
                FROM TBLPackagingFamily A 
                ORDER BY A.Code";

            return _context.Connection.Query<ContainerFamilyQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }
    }
}
