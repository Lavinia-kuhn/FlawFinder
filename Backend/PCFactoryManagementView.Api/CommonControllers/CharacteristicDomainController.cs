using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using PCFactoryManagementView.Shared;
using System;

namespace PCFactoryManagementView.Api.CommonControllers
{
    [Route("[controller]")]
    public class CharacteristicDomainController : ControllerBase
    {
        [HttpGet]
        [Route("V1/getAll")]
        public ActionResult<dynamic> GetAllCharacteristicDomains(
            [FromServices] ICharacteristicDomainHandler _handler,
            [FromServices] ILoggerManager _log
        )
        {
                _log.LogInformation("CharacteristicDomainController: CharacteristicDomain/V1/getAll");
                return Ok(_handler.GetAllCharacteristicDomains());
        }
        [HttpGet]
        [Route("V1/getPage")]
        public ActionResult<dynamic> GetPageCharacteristicDomains(
           int pPage,
           int pSize,
           [FromServices] ICharacteristicDomainHandler _handler,
           [FromServices] ILoggerManager _log
        )
        {
                _log.LogInformation("CharacteristicDomainController: CharacteristicDomain/V1/getPage");
                return Ok(_handler.getPageCharacteristicDomain(pPage, pSize));
        }
        [HttpGet]
        [Route("V1/getByCode")]
        public ActionResult<dynamic> GetByCode(
            string code,
            [FromServices] ICharacteristicDomainHandler _handler,
            [FromServices] ILoggerManager _log
        )
        {
                _log.LogInformation("CharacteristicDomainController: CharacteristicDomain/V1/getByCode");
                return Ok(_handler.getCharacteristicDomainByCode(code));
        }
        [HttpGet]
        [Route("V1/getById")]
        public ActionResult<dynamic> GetCharacteristicDomainById(
            int id,
           [FromServices] ICharacteristicDomainHandler _handler,
           [FromServices] ILoggerManager _log
           )
        {
                _log.LogInformation("CharacteristicDomainController: CharacteristicDomain/V1/getById");
                return Ok(_handler.GetCharacteristicDomainById(id));
        }
    }
}
