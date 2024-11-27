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
    public class ContainerController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllContainer(
            [FromServices] IContainerHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ContainerController: Container/V1/getAll");
                return Ok(_handler.GetAllContainer());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageContainer(
            int pPage,
            int pSize,
            [FromServices] IContainerHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ContainerController: Container/V1/GetPageContainer");
                return Ok(_handler.GetPageContainer(pPage, pSize));
        }


        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetContainerByCode(
            string code,
            [FromServices] IContainerHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ContainerController: Container/V1/getContainerByCode");
                return Ok(_handler.GetContainerByCode(code));
        }
    }
}
