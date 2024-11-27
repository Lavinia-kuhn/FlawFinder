using Dapper;
using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using PCFactoryManagementView.Shared;
using System;

namespace PCFactoryManagementView.Api.CommonControllers
{
    /// <summary>
    /// Endpoints das Turmas de Turno
    /// </summary>
    [Route("[controller]")]
    public class ShiftTeamController: ControllerBase
    {

        /// <summary>
        /// Buscar lista com id e nome da Turma de Turno onde FlgEnable é igual a 1
        /// </summary>
        /// <param name="_context">Contexto</param>
        /// <param name="_log">Log</param>
        /// <response code="200">Sucesso em buscar as Turmas de Turno</response>
        [HttpGet]
        [Route("v1")]
        public async Task<ActionResult<List<GetShiftTeamQueryResult>>> Get(
            [FromServices] PCFactoryManagementViewDataContext _context,
            [FromServices] ILoggerManager _log)
        {
                _log.LogInformation("Controller: ShiftTeam/v1");
                var result = await _context.Connection.
                    QueryAsync<GetShiftTeamQueryResult>("SELECT IdShiftTeam AS ID, Code + '-' +  Name AS Code FROM TBLShiftTeam WHERE FlgEnable = 1",
                    new { });

                return Ok(result.ToList());
        }
    }
}
