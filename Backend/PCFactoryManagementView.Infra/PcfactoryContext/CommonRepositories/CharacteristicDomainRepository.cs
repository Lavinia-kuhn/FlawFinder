using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class CharacteristicDomainRepository : ICharacteristicDomainRepository
    {
        private ILoggerManager _log;
        private readonly PCFactoryManagementViewDataContext _context;

        public CharacteristicDomainRepository(ILoggerManager log, PCFactoryManagementViewDataContext context)
        {
            _log = log;
            _context = context;
        }

        public List<CharacteristicDomainQueryResult> GetAllCharacteristicDomains()
        {
            _log.LogInformation("CharacteristicDomainRepository: GetAll");
            var qry = $@"SELECT 
                IDCharacteristicDomain AS ID,
                Code, 
                [Name]
                FROM TBLCharacteristicDomain
                ORDER BY Code";

            return _context.Connection.Query<CharacteristicDomainQueryResult>(qry, new { }).ToList();
        }

        public List<CharacteristicDomainQueryResult> getPageCharacteristicDomain(int pPage, int pSize)
        {
            _log.LogInformation("CharacteristicDomainRepository: getPage");
            var qry = $@"SELECT 
                IDCharacteristicDomain AS ID,
                Code, 
                [Name]
                FROM TBLCharacteristicDomain
                ORDER BY Code";

            return _context.Connection.Query<CharacteristicDomainQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }


        public List<CharacteristicDomainQueryResult> getCharacteristicDomainByCode(string code)
        {
            _log.LogInformation("CharacteristicDomainRepository: getByCode");
            var qry = $@"SELECT 
                IDCharacteristicDomain AS ID,
                Code, 
                [Name]
                FROM TBLCharacteristicDomain
                WHERE CODE LIKE '{code}%'
                ORDER BY Code ";

            return _context.Connection.Query<CharacteristicDomainQueryResult>(qry, new { }).ToList();
        }

        public List<CharacteristicDomainQueryResult> GetCharacteristicDomainById(int id)
        {
            _log.LogInformation("CharacteristicDomainRepository: GetCharacteristicDomainById");
            var qry = $@"select 
                FROM TBLCharacteristicDomain 
                WHERE IDCharacteristicDomain= {id}
                ORDER BY Code ";

            return _context.Connection.Query<CharacteristicDomainQueryResult>(qry, new { }).ToList();
        }
    }
}
