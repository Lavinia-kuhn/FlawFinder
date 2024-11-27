using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class CodeTaskController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllCodeTask(
            [FromServices] ICodeTaskHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeTaskController: CodeTask/v1/getAllCodeTask");
                return Ok(_handler.GetAllCodeTask());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageCodeTask(
            int pPage,
            int pSize,
            [FromServices] ICodeTaskHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeTaskController: CodeTask/v1/getPageCodeTask");
                return Ok(_handler.GetPageCodeTask(pPage, pSize));
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetCodeTaskByCode(
            String code,
            [FromServices] ICodeTaskHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeTaskController: CodeTask/v1/getCodeTaskbyCode");
                return Ok(_handler.GetCodeTaskByCode(code));
        }

    }
}
