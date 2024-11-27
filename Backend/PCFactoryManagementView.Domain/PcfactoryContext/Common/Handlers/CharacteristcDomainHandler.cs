using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface ICharacteristicDomainHandler
    {
        List<CharacteristicDomainQueryResult> GetAllCharacteristicDomains();
        List<CharacteristicDomainQueryResult> getCharacteristicDomainByCode(string code);
        List<CharacteristicDomainQueryResult> GetCharacteristicDomainById(int id);
        List<CharacteristicDomainQueryResult> getPageCharacteristicDomain(int pPage, int pSize);
    }

    public class CharacteristcDomainHandler : ICharacteristicDomainHandler
    {
        private ILoggerManager _log;
        private readonly ICharacteristicDomainRepository _repository;
        public CharacteristcDomainHandler(ILoggerManager log, ICharacteristicDomainRepository repository)
        {
            _log = log;
            _repository = repository;
        }
        public List<CharacteristicDomainQueryResult> GetAllCharacteristicDomains()
        {
            _log.LogInformation("CharacteristcDomainHandler: GetAllCharacteristicDomains");
            return _repository.GetAllCharacteristicDomains();
        }
        public List<CharacteristicDomainQueryResult> getCharacteristicDomainByCode(string code)
        {
            _log.LogInformation("CharacteristcDomainHandler: getByCode");
            return _repository.getCharacteristicDomainByCode(code);
        }
        public List<CharacteristicDomainQueryResult> GetCharacteristicDomainById(int id)
        {
            _log.LogInformation("CharacteristcDomainHandler: GetCharacteristicDomainById");
            return _repository.GetCharacteristicDomainById(id);
        }
        public List<CharacteristicDomainQueryResult> getPageCharacteristicDomain(int pPage, int pSize)
        {
            _log.LogInformation("CharacteristcDomainHandler: getPage");
            return _repository.getPageCharacteristicDomain(pPage, pSize);
        }
    }
}
