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
    public class MovTypeController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllMovType(
            [FromServices] IMovTypeHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("MovTypeController: MovType/V1/getAll");
                return Ok(_handler.GetAllMovType());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageMovType(
            int pPage,
            int pSize,
            [FromServices] IMovTypeHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("MovTypeController: MovType/V1/getPage");
                return Ok(_handler.GetPageMovType(pPage,pSize));
        }


        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetMovTypeByCode(
            String code,
            [FromServices] IMovTypeHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("MovTypeController: MovType/V1/getByCode");
                return Ok(_handler.GetMovTypeByCode(code));
        }
    }
}
