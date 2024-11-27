using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class AuditTrailTableController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllCodeTable(
            [FromServices] IAuditTrailTableHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
            try
            {
                _log.LogInformation("AuditTrailTableController: AuditTrailTable/v1/getAll");
                return Ok(_handler.GetAllCodeTable());
            }
            catch (Exception ex)
            {
                _log.Error("AuditTrailTableController: AuditTrailTable/v1/getAll", ex);
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageCodeTable(
            int pPage,
            int pSize,
            [FromServices] IAuditTrailTableHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
            try
            {
                _log.LogInformation("AuditTrailTableController: AuditTrailTable/v1/getPage");
                return Ok(_handler.GetPageCodeTable(pPage, pSize));
            }
            catch (Exception ex)
            {
                _log.Error("AuditTrailTableController: AuditTrailTable/v1/getPage", ex);
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetCodeTableByCode(
            String code,
            [FromServices] IAuditTrailTableHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
            try
            {
                _log.LogInformation("AuditTrailTableController: AuditTrailTable/v1/getByCode");
                return Ok(_handler.GetCodeTableByCode(code));
            }
            catch (Exception ex)
            {
                _log.Error("AuditTrailTableController: AuditTrailTable/v1/getByCode", ex);
                return BadRequest(ex);
            }
        }

    }
}
