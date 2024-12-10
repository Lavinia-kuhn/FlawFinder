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
    public class IssueController : ControllerBase
    {
        /// <summary>
        /// Buscar Pareto de Motivos
        /// </summary>
        /// <param name="_handler">Manipulador do report</param>
        /// <returns>Retorna os reports com aquele codigo</returns>
        /// <response code="200">Sucesso ao buscar o report</response>
        /// <response code="400">Nao ha reports com este codigo</response>
        [HttpGet]
        [Route("v1/pareto")]
        public ActionResult<dynamic> Pareto(
            [FromServices] IIssueHandler _handler,
            [FromServices] ILoggerManager _log)
        {
            _log.LogInformation("Controller: Issue/V1/Pareto");
            return Ok(_handler.GetNoDetectionCausePareto());
        }

        /// <summary>
        /// Buscar crescimento de motivos
        /// </summary>
        /// <param name="_handler">Manipulador do report</param>
        /// <returns>Retorna os reports com aquele codigo</returns>
        /// <response code="200">Sucesso ao buscar o report</response>
        /// <response code="400">Nao ha reports com este codigo</response>
        [HttpGet]
        [Route("v1/line")]
        public ActionResult<dynamic> Line(
            [FromServices] IIssueHandler _handler,
            [FromServices] ILoggerManager _log)
        {
            _log.LogInformation("Controller: Issue/V1/Line");
            return Ok(_handler.GetNoDetectionIncrease());
        }

        /// <summary>
        /// Buscar todos os motivos
        /// </summary>
        /// <param name="_handler">Manipulador do report</param>
        /// <returns>Retorna os reports com aquele codigo</returns>
        /// <response code="200">Sucesso ao buscar o report</response>
        /// <response code="400">Nao ha reports com este codigo</response>
        [HttpGet]
        [Route("v1/pie")]
        public ActionResult<dynamic> Pie(
            [FromServices] IIssueHandler _handler,
            [FromServices] ILoggerManager _log)
        {
            _log.LogInformation("Controller: Issue/V1/pie");
            return Ok(_handler.GetAllNoDetection());
        }

        /// <summary>
        /// Buscar todos os motivos
        /// </summary>
        /// <param name="_handler">Manipulador do report</param>
        /// <returns>Retorna os reports com aquele codigo</returns>
        /// <response code="200">Sucesso ao buscar o report</response>
        /// <response code="400">Nao ha reports com este codigo</response>
        [HttpGet]
        [Route("v1/bugcount")]
        public ActionResult<dynamic> BugCount(
            [FromServices] IIssueHandler _handler,
            [FromServices] ILoggerManager _log)
        {
            _log.LogInformation("Controller: Issue/V1/bugcount");
            return Ok(_handler.GetBugCount());
        }

        /// <summary>
        /// Buscar todos os motivos
        /// </summary>
        /// <param name="_handler">Manipulador do report</param>
        /// <returns>Retorna os reports com aquele codigo</returns>
        /// <response code="200">Sucesso ao buscar o report</response>
        /// <response code="400">Nao ha reports com este codigo</response>
        [HttpPost]
        [Route("v1/postbugs")]
        public ActionResult<dynamic> GetBugs(
            [FromServices] IIssueHandler _handler,
            [FromServices] ILoggerManager _log)
        {
            _log.LogInformation("Controller: Issue/V1/postbugs");
            return Ok(_handler.GetBugsFromJira());
        }


    }
}