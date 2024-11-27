using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface ICharacteristicDomainRepository
    {
        List<CharacteristicDomainQueryResult> GetAllCharacteristicDomains();
        List<CharacteristicDomainQueryResult> getPageCharacteristicDomain(int pPage, int pSize);
        List<CharacteristicDomainQueryResult> getCharacteristicDomainByCode(string code);
        List<CharacteristicDomainQueryResult> GetCharacteristicDomainById(int id);
    }
}
