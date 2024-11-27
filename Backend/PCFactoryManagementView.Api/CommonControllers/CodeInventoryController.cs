using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class CodeInventoryController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllCodeInventory(
            [FromServices] ICodeInventoryHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeInventoryController: CodeInventory/v1/getAllCodeInventory");
                return Ok(_handler.GetAllCodeInventory());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageCodeInventory(
            int pPage,
            int pSize,
            [FromServices] ICodeInventoryHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeInventoryController: CodeInventory/v1/getPageCodeInventory");
                return Ok(_handler.GetPageCodeInventory(pPage, pSize));
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetCodeInventoryByCode(
            String code,
            [FromServices] ICodeInventoryHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("CodeInventoryController: CodeInventory/v1/getCodeInventorybyCode");
                return Ok(_handler.GetCodeInventoryByCode(code));
        }

    }
}
