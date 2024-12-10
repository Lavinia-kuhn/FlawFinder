using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Shared;
using System;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class AuthorizationController: ControllerBase
    {
        [HttpGet]
        [Route("v1")]
        public ActionResult<bool> Get(
            [FromServices] ILoggerManager _log)
        {
                _log.LogInformation("Controller: Authorization/v1");
                return Ok(User.Identity.IsAuthenticated);
        }
    }
}
