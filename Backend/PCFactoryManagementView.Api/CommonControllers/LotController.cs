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
    public class LotController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllLot(
            [FromServices] ILotHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("LotController: Lot/V1/getAll");
                return Ok(_handler.GetAllLot());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageLot(
            int pPage,
            int pSize,
            [FromServices] ILotHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("LotController: Lot/V1/GetPageLot");
                return Ok(_handler.GetPageLot(pPage, pSize));
        }


        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetLotByCode(
            string code,
            [FromServices] ILotHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("LotController: Lot/V1/getByCode");
                return Ok(_handler.GetLotByCode(code));
        }


    }
}
