using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class CodeOrderController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllCodeOrder(
            [FromServices] ICodeOrderHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeOrderController: CodeOrder/V1/GetAllCodeOrder");
                return Ok(_handler.GetAllCodeOrder());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPagelCodeOrder(
            int pPage,
            int pSize,
            [FromServices] ICodeOrderHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeOrderController: CodeOrder/V1/GetPagelCodeOrder");
                return Ok(_handler.GetPageCodeOrder(pPage, pSize));
        }

        [HttpGet]
        [Route("v1/getIntegrationPage")]
        public ActionResult<dynamic> GetIntegrationPagelCodeOrder(
            int pPage,
            int pSize,
            [FromServices] ICodeOrderHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
            try
            {
                _log.LogInformation("CodeOrderController: CodeOrder/V1/GetPagelCodeOrder");
                return Ok(_handler.GetIntegrationPageCodeOrder(pPage, pSize));
            }
            catch (Exception ex)
            {
                _log.Error("CodeOrderController:  CodeOrder/V1/GetPagelCodeOrder ", ex);
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetCodeOrderByCode(
            String code,
            [FromServices] ICodeOrderHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeOrderController: CodeOrder/V1/GetCodeOrderByCode");
                return Ok(_handler.GetCodeOrderByCode(code));
        }
    }
}
