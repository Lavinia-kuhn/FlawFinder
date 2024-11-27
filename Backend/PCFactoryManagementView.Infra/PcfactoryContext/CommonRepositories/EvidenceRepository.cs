using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;
using Dapper;
using System.Threading.Tasks;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class EvidenceRepository : IEvidenceRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public EvidenceRepository
        (
           PCFactoryManagementViewDataContext Context,
           ILoggerManager log
        )
        {
            _log = log;
            _context = Context;
        }

        public Task<IEnumerable<EvidenceImagesByteQueryResult>> GetEvidenceImagesByIdInspectionEvDet(int IDInspectionEvDet)
        {
            _log.LogInformation("EvidenceRepository: GetEvidenceImagesByIdInspectionEvDet");

            var query = "SELECT EvidenceDataMain AS EvidenceDataMainByte, EvidenceDataPreview AS EvidenceDataPreviewByte, EvidenceExtension FROM TBLInspectionEvDetEvidence WHERE IDInspectionEvDet = @IDInspectionEvDet";

            var queryResult = _context.Connection.QueryAsync<EvidenceImagesByteQueryResult>(query, new { IDInspectionEvDet = IDInspectionEvDet }, commandTimeout: 180);
            return queryResult;
        }
    }
}
