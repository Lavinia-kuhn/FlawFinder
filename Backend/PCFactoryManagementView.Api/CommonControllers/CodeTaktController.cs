using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class CodeTaktController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllCodeTakt(
            [FromServices] ICodeTaktHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeTaktController: CodeTakt/v1/getAllCodeTakt");
                return Ok(_handler.GetAllCodeTakt());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageCodeTakt(
            int pPage,
            int pSize,
            [FromServices] ICodeTaktHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeTaktController: CodeTakt/v1/getPageCodeTakt");
                return Ok(_handler.GetPageCodeTakt(pPage, pSize));
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetCodeTaktByCode(
            String code,
            [FromServices] ICodeTaktHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeTaktController: CodeTakt/v1/getCodeTaktbyCode");
                return Ok(_handler.GetCodeTaktByCode(code));
        }

    }
}
