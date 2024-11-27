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
    public class ProductFamilyController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllProductFamilies(
            [FromServices] IProductFamilyHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ProductFamilyController: ProductFamily/V1/getAll");
                return Ok(_handler.GetAllProductFamilies());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageProductFamilies(
            int pPage,
            int pSize,
            [FromServices] IProductFamilyHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ProductFamilyController: ProductFamily/V1/getPage");
                return Ok(_handler.GetPageProductFamilies(pPage, pSize));
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetProductFamilyByCode(
            String code,
            [FromServices] IProductFamilyHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ProductFamilyController: ProductFamily/V1/getByCode");
                return Ok(_handler.GetProductFamilyByCode(code));
        }
    }
}
