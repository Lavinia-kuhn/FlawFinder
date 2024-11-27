using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IXmlFieldsRepository
    {
        List<XmlColumnsCommand> GetXmlSchemaHD(string searchTbl);
    }
}
