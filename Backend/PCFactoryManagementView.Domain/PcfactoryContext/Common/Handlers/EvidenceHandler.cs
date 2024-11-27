using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using System.Text;
using System.Collections;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IEvidenceHandler
    {
        Task<List<EvidenceImagesQueryResult>> GetEvidenceImagesByIdInspectionEvDet(int IDInspectionEvDet);
    }

    public class EvidenceHandler : IEvidenceHandler
    {
        private ILoggerManager _log;
        private readonly IEvidenceRepository _repository;
        
        public EvidenceHandler(
            IEvidenceRepository repository,
            ILoggerManager log
        )
        {
            _repository = repository;
            _log = log;
        }

        public async Task<List<EvidenceImagesQueryResult>> GetEvidenceImagesByIdInspectionEvDet(int IDInspectionEvDet)
        {
            _log.LogInformation("EvidenceHandler: GetEvidenceImagesByIdInspectionEvDet");

            IEnumerable<EvidenceImagesByteQueryResult> imageBytes = await _repository.GetEvidenceImagesByIdInspectionEvDet(IDInspectionEvDet);
            List<EvidenceImagesQueryResult> result = new List<EvidenceImagesQueryResult>(imageBytes.Count());

            foreach (var imageByte in imageBytes)
            {
                result.Add(new EvidenceImagesQueryResult
                {
                    EvidenceDataPreview = Encoding.Default.GetString(imageByte.EvidenceDataPreviewByte),
                    EvidenceDataMain = Encoding.Default.GetString(imageByte.EvidenceDataMainByte),
                    EvidenceExtension = imageByte.EvidenceExtension
                });
            }

            return result;
        }
    }
}
