using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class MovUnController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllMovUn(
            [FromServices] IMovUnHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("MovUnController: MovUn/V1/getAll");
                return Ok(_handler.GetAllMovUn());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageMovUn(
            int pPage,
            int pSize,
            [FromServices] IMovUnHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("MovUnController: MovUn/V1/getPage");
                return Ok(_handler.GetPageMovUn(pPage, pSize));
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetMovUnByCode(
            string code,
            [FromServices] IMovUnHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("MovUnController: MovUn/V1/getByCode");
                return Ok(_handler.GetMovUnByCode(code));
        }
    }
}
