using Dapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PCFactoryManagementView.Api.Controllers
{

    /// <summary>
    /// Endpoints relacionados a usuario
    /// </summary>
    [Route("[controller]")]
    public class UserController: ControllerBase
    {
        /// <summary>
        /// Logar com usuario
        /// </summary>
        /// <param name="login">Comando de login do usuario</param>
        /// <param name="_handler">Manipulador do Usuario</param>
        /// <param name="_log">Gerenciador de historico</param>
        /// <response code="200">Usuario logado</response>
        /// <response code="400">Usuario ou senha invalidos</response>

        [HttpPost]
        [Route("v1/login")]
        [AllowAnonymous]
        public ActionResult<dynamic> Login(
            [FromBody] LoginCommand login,
            [FromServices] IUserHandler _handler,
            [FromServices] ILoggerManager _log)
        {
                _log.LogInformation("Controller: User/V1/login");
                var user = _handler.GetLogin(login);
                if (user != null && user.IdUser != 0)
                {
                    return Ok(user);
                }

                return BadRequest("Usuário ou senha inválida");
        }

        [HttpPost]
        [Route("v1/adlogin")]
        [AllowAnonymous]
        public ActionResult<dynamic> AdLogin(
            [FromBody] LoginCommand login,
            [FromServices] IUserHandler _handler,
            [FromServices] ILoggerManager _log)
        {
                _log.LogInformation("Controller: User/V1/adlogin");
                var user = _handler.GetAdLogin(login);
                if (user != null && user.IdUser != 0)
                {
                    return Ok(user);
                }

                return BadRequest("Usuário ou senha inválida");
        }

        [HttpPost]
        [Route("v1/loginPCF")]
        [AllowAnonymous]
        public async Task<ActionResult<dynamic>> GetPCFToken(
            [FromBody] PCFLoginCommand login,
            [FromServices] IUserHandler _handler,
            [FromServices] ILoggerManager _log)
        {
                _log.LogInformation("Controller: User/V1/GetPCFToken");
                var token = await _handler.GetPCFToken(login);
                return Ok(token);
        }

        [HttpGet]
        [Route("v1/GetAuthenticationType")]
        [AllowAnonymous]
        public ActionResult<bool> GetAuthenticationType(
            [FromServices] IUserHandler _handler,
            [FromServices] ILoggerManager _log)
        {
                _log.LogInformation("Controller: User/V1/GetAuthenticationType");
                var isAd = _handler.IsAdLogin();
                return Ok(isAd);
        }

        /// <summary>
        /// Buscar usuario da tabela TBLUser onde FlgEnable seja igual a 1
        /// </summary>
        /// <param name="_context">Contexto</param>
        /// <response code="200">Retorna a lista dos usuarios</response>
        /// <response code="400">Lista de usuarios nao encotradas</response>
        [HttpGet]
        [Route("v1")]
        [Authorize(Roles = "V0001")]
        public async Task<ActionResult<List<GetUserQueryResult>>> Get(
            [FromServices] PCFactoryManagementViewDataContext _context,
            [FromServices] ILoggerManager _log)
        {
                _log.LogInformation("Controller: User/V1");
                var result = await _context.Connection.
                    QueryAsync<GetUserQueryResult>("SELECT * FROM TBLUser WHERE FlgEnable = 1",
                    new { });

                return Ok(result.ToList());
        }

        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllCodeUser(
            [FromServices] IUserHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
            try
            {
                _log.LogInformation("UserController: User/v1/getAll");
                return Ok(_handler.GetAllCodeUser());
            }
            catch (Exception ex)
            {
                _log.Error("UserController: User/v1/getAll", ex);
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageCodeUser(
            int pPage,
            int pSize,
            [FromServices] IUserHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
            try
            {
                _log.LogInformation("UserController: User/v1/getPage");
                return Ok(_handler.GetPageCodeUser(pPage, pSize));
            }
            catch (Exception ex)
            {
                _log.Error("UserController: User/v1/getPage", ex);
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetCodeUserByCode(
            String code,
            [FromServices] IUserHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
            try
            {
                _log.LogInformation("UserController: User/v1/getByCode");
                return Ok(_handler.GetCodeUserByCode(code));
            }
            catch (Exception ex)
            {
                _log.Error("UserController: User/v1/getByCode", ex);
                return BadRequest(ex);
            }
        }

    }
}
