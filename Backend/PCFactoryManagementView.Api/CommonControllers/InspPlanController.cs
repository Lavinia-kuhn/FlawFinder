using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Shared;
using System;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class InspPlanController : ControllerBase
    {

        [HttpGet]
        [Route("v1/getByType/{idInspectionPlanType}")]
        public ActionResult<dynamic> GetByType(
            int idInspectionPlanType,
            [FromServices] IInspPlanHandler _handler,
            [FromServices] ILoggerManager _log
        )
        {
                _log.LogInformation("InspPlanController: InspPlan/V1/getAll");
                return Ok(_handler.GetByType(idInspectionPlanType));
        }

        [HttpGet]
        [Route("v1/getAllType")]
        public ActionResult<dynamic> GetAllType(
           [FromServices] IInspPlanHandler _handler,
           [FromServices] ILoggerManager _log
       )
        {
                _log.LogInformation("InspPlanController: InspPlan/V1/getAll");
                return Ok(_handler.GetAllType());
        }
    }
}
