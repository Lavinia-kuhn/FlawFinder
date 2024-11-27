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
    public class ContainerFamilyController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllContainerFamily(
            [FromServices] IContainerFamilyHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ContainerFamilyController: ContainerFamily/V1/getAll");
                return Ok(_handler.GetAllContainerFamily());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageContainerFamily(
            int pPage,
            int pSize,
            [FromServices] IContainerFamilyHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ContainerFamilyController: ContainerFamily/V1/GetPageContainerFamily");
                return Ok(_handler.GetPageContainerFamily(pPage, pSize));
        }


        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetContainerFamilyByCode(
            string code,
            [FromServices] IContainerFamilyHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ContainerFamilyController: ContainerFamily/V1/getContainerFamilyByCode");
                return Ok(_handler.GetContainerFamilyByCode(code));
        }

    }
}
