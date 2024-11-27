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
    public class CodeOperationController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllCodeOperation(
            [FromServices] ICodeOperationHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeOperationController: CodeOperation/V1/GetAllCodeOperation");
                return Ok(_handler.GetAllCodeOperation());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPagelCodeOperation(
            int pPage,
            int pSize,
            [FromServices] ICodeOperationHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeOperationController: CodeOperation/V1/GetPagelCodeOperation");
                return Ok(_handler.GetPageCodeOperation(pPage, pSize));
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetCodeOperationByCode(
            String code,
            [FromServices] ICodeOperationHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeOperationController: CodeOperation/V1/GetCodeOperationByCode");
                return Ok(_handler.GetCodeOperationByCode(code));
        }
    }
}
