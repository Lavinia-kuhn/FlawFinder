using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IParamsHandler
    {
        ParamsQueryResult GetParamByParamName(string paramName);
    }

    public class ParamsHandler: IParamsHandler
    {
        private readonly IParamsRepository _repository;
        private ILoggerManager _log;

        public ParamsHandler(
            IParamsRepository repository,
            ILoggerManager log)
        {
            _repository = repository;
            _log = log;
        }

        public ParamsQueryResult GetParamByParamName(string paramName)
        {
            _log.LogInformation("ParamsHandler: GetParamByParamName");
            return _repository.GetParamByParamName(paramName);
        }
    }
}
