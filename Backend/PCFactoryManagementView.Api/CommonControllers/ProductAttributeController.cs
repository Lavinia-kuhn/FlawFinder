using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Shared;
using System;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class ProductAttributeController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllProductAttributes(
        [FromServices] IProductAttributeHandler _handler,
        [FromServices] ILoggerManager _log
        )
        {
                _log.LogInformation("ProductAttributeController: ProductAttribute/V1/getAll");
                return Ok(_handler.GetAllProductAttributes());
        }
        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetProductAttributeByCode(
            String code,
            [FromServices] IProductAttributeHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ProductAttributeController: ProductAttribute/V1/getByCode");
                return Ok(_handler.getProductAttributeByCode(code));
        }
        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageProductAttributes(
        int pPage,
        int pSize,
        [FromServices] IProductAttributeHandler _handler,
        [FromServices] ILoggerManager _log
        )
        {
                _log.LogInformation("ProductAttributeController: ProductAttribute/V1/getPage");
                return Ok(_handler.getPageProductAttribute(pPage, pSize));
        }
        [HttpPost]
        [Route("v1/getById")]
        public ActionResult<dynamic> GetProductAttributeById(
          string id,
         [FromServices] IProductAttributeHandler _handler,
         [FromServices] ILoggerManager _log
         )
        {
                _log.LogInformation("ProductAttributeController: ProductAttribute/V1/getById");
                return Ok(_handler.GetProductAttributeById(id));
        }
    }
}
