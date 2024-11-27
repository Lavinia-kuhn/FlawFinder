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
    public class ProductTypeController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllProductTypes(
            [FromServices] IProductTypeHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ProductTypeController: ProductType/V1/getAll");
                return Ok(_handler.GetAllProductTypes());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageProductTypes(
            int pPage,
            int pSize,
            [FromServices] IProductTypeHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ProductTypeController: ProductType/V1/getPage");
                return Ok(_handler.GetPageProductTypes(pPage, pSize));
        }


        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetProductTypeByCode(
            string code,
            [FromServices] IProductTypeHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ProductTypeController: ProductType/V1/getByCode");
                return Ok(_handler.GetProductTypeByCode(code));
        }

        [HttpGet]
        [Route("v1/getByFamily")]
        public ActionResult<dynamic> GetProductTypeByFamily(
            List<int> codes,
            [FromServices] IProductTypeHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ProductTypeController: ProductType/V1/getByFamily");
                return Ok(_handler.getProductTypeByIdProductFamily(codes));
        }

    }
}
