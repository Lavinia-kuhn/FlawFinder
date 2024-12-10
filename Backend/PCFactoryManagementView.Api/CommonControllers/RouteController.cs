using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class RouteController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllRoute(
            [FromServices] IRouteHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("RouteController: Route/v1/getAllRoute");
                return Ok(_handler.GetAllRoute());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageRoute(
            int pPage,
            int pSize,
            [FromServices] IRouteHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("RouteController: Route/v1/getPageRoute");
                return Ok(_handler.GetPageRoute(pPage, pSize));
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetRouteByCode(
            String code,
            [FromServices] IRouteHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("RouteController: Route/v1/getRoutebyCode");
                return Ok(_handler.GetRouteByCode(code));
        }
    }
}
