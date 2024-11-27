using System;
using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Shared;

namespace PCFactoryManagementView.Api.CommonControllers
{
    /// <summary>
    /// Endpoints da Home
    /// </summary>
    [Route("[controller]")]
    public class HomeController : ControllerBase
    {
 
        /// <summary>
        /// Buscar a Home
        /// </summary>
        [HttpGet]
        [Route("v1")]
        public ActionResult<string> Get([FromServices] ILoggerManager _log)
        {
                _log.LogInformation("Controller: Home/V1");
                var version = "0.0.0.1";
                return Ok(version);
        }

        /// <summary>
        /// Buscar a geracao do Guid
        /// </summary>
        [HttpGet]
        [Route("v1/Guid")]
        public ActionResult<string> GuidGen([FromServices] ILoggerManager _log)
        {
                _log.LogInformation("Controller: Home/v1/Guid");
                Guid g = Guid.NewGuid();
                return Ok(g.ToString());
        }


    }
}
