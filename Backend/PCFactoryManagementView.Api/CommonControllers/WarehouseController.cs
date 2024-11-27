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
    public class WarehouseController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllWarehouse(
            [FromServices] IWarehouseHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("WarehouseController: Warehouse/V1/GetAllWarehouse");
                return Ok(_handler.GetAllWarehouse());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPagelWarehouse(
            int pPage,
            int pSize,
            [FromServices] IWarehouseHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("WarehouseController: Warehouse/V1/GetPagelWarehouse");
                return Ok(_handler.GetPageWarehouse(pPage, pSize));
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetWarehouseByCode(
            String code,
            [FromServices] IWarehouseHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("WarehouseController: Warehouse/V1/GetWarehouseByCode");
                return Ok(_handler.GetWarehouseByCode(code));
        }
    }
}
