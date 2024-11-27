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
    public class ContainerTypeController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllContainerType(
            [FromServices] IContainerTypeHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ContainerTypeController: ContainerType/V1/getAll");
                return Ok(_handler.GetAllContainerType());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageContainerType(
            int pPage,
            int pSize,
            [FromServices] IContainerTypeHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ContainerTypeController: ContainerType/V1/GetPageContainerType");
                return Ok(_handler.GetPageContainerType(pPage, pSize));
        }


        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetContainerTypeByCode(
            string code,
            [FromServices] IContainerTypeHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ContainerTypeController: ContainerType/V1/getContainerTypeByCode");
                return Ok(_handler.GetContainerTypeByCode(code));
        }

    }
}
