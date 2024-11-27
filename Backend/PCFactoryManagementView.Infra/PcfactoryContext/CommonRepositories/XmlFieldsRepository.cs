using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class XmlFieldsRepository : IXmlFieldsRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public XmlFieldsRepository(PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<XmlColumnsCommand> GetXmlSchemaHD(string searchTbl)
        {
            var qry = 
$@"
SELECT
	HD.TableName,
	DET.Name,
	DET.Code,
	Det.Label,
	Det.Hidden,
	DET.Type
FROM TBLXmlSchemaHD HD
	INNER JOIN TBLXmlSchemaDet DET 
		ON DET.IDXmlSchemaHD = HD.IDXmlSchemaHD
WHERE TableName = '{searchTbl}' 
";

            return _context.Connection.Query<XmlColumnsCommand>(qry).ToList();
        }


    }
}
