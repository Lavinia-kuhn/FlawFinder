using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Shared;
using System;
using System.Security.Claims;

namespace PCFactoryManagementView.Api.CommonControllers
{

    /// <summary>
    /// Endpoints de Report
    /// </summary>
    [Route("[controller]")]
    public class ReportController: ControllerBase
    {
        /// <summary>
        /// Buscar report pelo codigo
        /// </summary>
        /// <param name="reportCode">Codigo do report</param>
        /// <param name="_handler">Manipulador do report</param>
        /// <returns>Retorna os reports com aquele codigo</returns>
        /// <response code="200">Sucesso ao buscar o report</response>
        /// <response code="400">Nao ha reports com este codigo</response>
        [HttpGet]
        [Route("v1/table")]
        public ActionResult<dynamic> Report(
            [FromServices] IReportHandler _handler,
            [FromServices] ILoggerManager _log)
        {
                _log.LogInformation("Controller: Report/V1");
                var reports = _handler.GetReport();
                return Ok(reports);
        }

       
    }
}