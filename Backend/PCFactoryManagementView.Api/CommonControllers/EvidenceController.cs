using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Shared;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class EvidenceController : ControllerBase
    {
        [HttpGet]
        [Route("v1/GetEvidenceImagesByIdInspectionEvDet")]
        public ActionResult<EvidenceImagesQueryResult> GetEvidenceImagesByIdInspectionEvDet
        (
            [FromServices] IEvidenceHandler _handler,
            [FromServices] ILoggerManager _log,
            [FromQuery] int IDInspectionEvDet
        )
        {
            _log.LogInformation("EvidenceController: Evidence/v1/GetEvidenceImagesByIdInspectionEvDet");
            return Ok(_handler.GetEvidenceImagesByIdInspectionEvDet(IDInspectionEvDet).Result);
        }
    }
}