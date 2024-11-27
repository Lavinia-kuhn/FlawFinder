using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Shared;
using System;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class ResourceController: ControllerBase
    {
        [HttpGet]
        [Route("v1/getAll")]
        public ActionResult<dynamic> GetAllResources(
            [FromServices] IResourceHandler _handler,
            [FromServices] ILoggerManager _log
        )
            {
                    _log.LogInformation("ResourceController: Resource/V1/getAll");
                    return Ok(_handler.GetAll());
            }

        [HttpGet]
        [Route("v1/getPage")]
        public ActionResult<dynamic> GetPageResources(
           int pPage,
           int pSize,
           [FromServices] IResourceHandler _handler,
           [FromServices] ILoggerManager _log
       )
        {
                _log.LogInformation("ResourceController: Resource/V1/getPage");
                return Ok(_handler.GetPage(pPage,pSize));
        }

        [HttpGet]
        [Route("v1/getByCode")]
        public ActionResult<dynamic> GetByCode(
            string code,
            [FromServices] IResourceHandler _handler,
            [FromServices] ILoggerManager _log
        )
        {
                _log.LogInformation("ResourceController: Resource/V1/getByCode");
                return Ok(_handler.GetByCode(code));
        }

        [HttpGet]
        [Route("v1/getByIdManagerGrp")]
        public ActionResult<dynamic> GetByIdManagerGrp(
            int idManagerGrp,
            [FromServices] IResourceHandler _handler,
            [FromServices] ILoggerManager _log
        )
        {
                _log.LogInformation("ResourceController: Resource/V1/getByIdManagerGrp");
                return Ok(_handler.GetByIdManagerGrp(idManagerGrp));
        }

    }
}
