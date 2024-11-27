using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;
using System.Collections.Generic;
using PCFactoryManagementView.Shared;

namespace PCFactoryManagementView.Api.CommonControllers
{

    /// <summary>
    /// Endpoint para traducao
    /// </summary>
    [Route("[controller]")]
    public class TranslationController : ControllerBase
    {

        /// <summary>
        /// Buscar a ligua para traducao
        /// </summary>
        /// <param name="lang">Linguagem</param>
        /// <param name="_handler">Manipulador da traducao</param>
        /// <param name="_log">Log</param>
        /// <response code="200">Traducao pela linguagem escolhida</response>
        [Route("V1")]
        [AllowAnonymous]
        [HttpGet]
        public ActionResult<Dictionary<string, object>> GetTranslationsByLang(
            string lang,
            [FromServices] ITranslationHandler _handler,
            [FromServices] ILoggerManager _log)
        {
                _log.LogInformation("Controller: Transalation/V1");
                return Ok(_handler.GetReportTranslationByLanguage(lang));
        }
    }
}
