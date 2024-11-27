using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class AddressGroupController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllAddressGroup(
            [FromServices] IAddressGroupHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("AddressGroupController: AddressGroup/v1/getAllAddressGroup");
                return Ok(_handler.GetAllAddressGroup());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageAddressGroup(
            int pPage,
            int pSize,
            [FromServices] IAddressGroupHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("AddressGroupController: AddressGroup/v1/getPageAddressGroup");
                return Ok(_handler.GetPageAddressGroup(pPage, pSize));
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetAddressGroupByCode(
            String code,
            [FromServices] IAddressGroupHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("AddressGroupController: AddressGroup/v1/getAddressGroupbyCode");
                return Ok(_handler.GetAddressGroupByCode(code));
        }

    }
}
