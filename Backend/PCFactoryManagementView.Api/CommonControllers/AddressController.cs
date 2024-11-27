using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class AddressController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllAddress(
            [FromServices] IAddressHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("AddressController: Address/v1/getAllAddress");
                return Ok(_handler.GetAllAddress());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageAddress(
            int pPage,
            int pSize,
            [FromServices] IAddressHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("AddressController: Address/v1/getPageAddress");
                return Ok(_handler.GetPageAddress(pPage, pSize));
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetAddressByCode(
            String code,
            [FromServices] IAddressHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("AddressController: Address/v1/getAddressbyCode");
                return Ok(_handler.GetAddressByCode(code));
        }

        [HttpGet]
        [Route("v1/getByIdWarehouses")]
        public ActionResult<dynamic> GetAddressByIdWarehouses(
            List<int> warehouseIds,
           [FromServices] IAddressHandler _handler,
           [FromServices] ILoggerManager _log
           )
        {
                _log.LogInformation("AddressController: Address/V1/getByIdWarehouses");
                return Ok(_handler.GetAddressByIdWarehouses(warehouseIds));
        }
    }
}
