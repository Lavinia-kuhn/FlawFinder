using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;
using PCFactoryManagementView.Shared;

namespace PCFactoryManagementView.Api.CommonControllers
{
    /// <summary>
    /// Endpoints do Menu
    /// </summary>
    [Route("[controller]")]
    public class MenuController: ControllerBase
    {        
        /// <summary>
        /// Buscar o Menu de acordo com o usuario
        /// </summary>
        /// <param name="idUser">Id du usuario</param>
        /// <param name="_handler">Manipulador do Menu</param>
        [Route("V1")]
        [HttpGet]
        [AllowAnonymous]
        public ActionResult<List<MenusResult>> GetMenusByIdUser(
            int idUser,
            [FromServices] IMenuHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("Controller: Menu/V1");
                var result = _handler.GetMenusByIdUser(idUser);
                return Ok(result);
        }

        [Route("V1/GetAllPagesToSearchControl/{lang}&{idUser}")]
        [HttpGet]
        [AllowAnonymous]
        public ActionResult<List<MenusResult>> GetAllPagesToSearchControl(
            string lang,
            int idUser,
            [FromServices] IMenuHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("Controller: Menu/V1/GetAllPagesToSearchControl");
                var result = _handler.GetMenusSearchControl(lang, idUser);
                return Ok(result);
        }

    }
}
