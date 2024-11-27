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
    public class ProductController : ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllAddress(
            [FromServices] IProductHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ProductController: Product/V1/getAll");
                return Ok(_handler.GetAllProducts());
        }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageProducts(
            int pPage,
            int pSize,
            [FromServices] IProductHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ProductController: Product/V1/getPage");
                return Ok(_handler.GetPageProducts(pPage,pSize));
        }

        [HttpGet]
        [Route("v1/getIntegrationPage")]
        public ActionResult<dynamic> GetIntegrationPageProducts(
            int pPage,
            int pSize,
            [FromServices] IProductHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
            try
            {
                _log.LogInformation("ProductController: Product/V1/getPage");
                return Ok(_handler.GetIntegrationPageProducts(pPage, pSize));
            }
            catch (Exception ex)
            {
                _log.Error("ProductController: Product/V1/getPage ", ex);
                return BadRequest(ex);
            }
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetProductbyCode(
            string code,
            [FromServices] IProductHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ProductController: Product/V1/getByCode");
                return Ok(_handler.GetProductByCode(code));
        }

        [HttpGet]
        [Route("v1/getById")]
        public ActionResult<dynamic> GetProductbyId(
            int id,
            [FromServices] IProductHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
            _log.LogInformation("ProductController: Product/V1/getById");
            return Ok(_handler.GetProductByID(id));
        }

        [HttpGet]
        [Route("v1/getPageByFamillyeType")]
        public ActionResult<dynamic> GetProductsByFamilyeType(
            List<int> productFIds,
            List<int> productTIds,
            [FromServices] IProductHandler _handler,
            [FromServices] ILoggerManager _log
            )
        {
                _log.LogInformation("ProductController: Product/V1/getPageByFamillyeType");
                return Ok(_handler.GetProductsByFamilyeType(productFIds, productTIds));
        }

        [HttpPost]
        [Route("v1/getByIds")]
        public ActionResult<dynamic> GetAddressByIdWarehouses(
            List<int> productFIds,
           [FromServices] IProductHandler _handler,
           [FromServices] ILoggerManager _log
           )
        {
                _log.LogInformation("Controller: Product/V1/getByIdProductF");
                return Ok(_handler.GetProductbyIdProductFamily(productFIds));
        }
    }
}
