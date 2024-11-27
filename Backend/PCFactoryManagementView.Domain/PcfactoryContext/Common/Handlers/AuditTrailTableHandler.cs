using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IAuditTrailTableHandler
    {
        List<AuditTrailTableQueryResult> GetAllCodeTable(); 
        List<AuditTrailTableQueryResult> GetPageCodeTable(int pPage, int pSize);
        List<AuditTrailTableQueryResult> GetCodeTableByCode(string code);
    }

    public class AuditTrailTableHandler : IAuditTrailTableHandler
    {

        private ILoggerManager _log;
        private readonly IAuditTrailTableRepository _AuditTrailTableRepository;

        public AuditTrailTableHandler(IAuditTrailTableRepository AuditTrailTableRepository,
            ILoggerManager log)
        {
            _AuditTrailTableRepository = AuditTrailTableRepository;
            _log = log;
        }

        public List<AuditTrailTableQueryResult> GetAllCodeTable()
        {
            _log.LogInformation("AuditTrailTableHandler: GetAllCodeTable");
            return _AuditTrailTableRepository.GetAllCodeTable();
        }

        public List<AuditTrailTableQueryResult> GetCodeTableByCode(string code)
        {
            _log.LogInformation("AuditTrailTableHandler: GetCodeTableByCode");
            return _AuditTrailTableRepository.GetCodeTableByCode(code);
        }

        public List<AuditTrailTableQueryResult> GetPageCodeTable(int pPage, int pSize)
        {
            _log.LogInformation("AuditTrailTableHandler: GetPageCodeTable");
            return _AuditTrailTableRepository.GetPageCodeTable(pPage,pSize);
        }
    }
}

