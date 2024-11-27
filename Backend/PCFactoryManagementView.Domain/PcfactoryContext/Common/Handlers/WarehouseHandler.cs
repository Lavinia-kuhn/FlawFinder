using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IWarehouseHandler
    {
        List<WarehouseQueryResult> GetAllWarehouse();
        List<WarehouseQueryResult> GetPageWarehouse(int pPage, int pSize);
        List<WarehouseQueryResult> GetWarehouseByCode(string code);
    }

    public class WarehouseHandler : IWarehouseHandler
    {

        private ILoggerManager _log;
        private readonly IWarehouseRepository _wareHouseRepository;

        public WarehouseHandler(IWarehouseRepository wareHouseRepository,
            ILoggerManager log)
        {
            _wareHouseRepository = wareHouseRepository;
            _log = log;
        }

        public List<WarehouseQueryResult> GetAllWarehouse()
        {
            _log.LogInformation("WarehouseHandler: GetAllWareHouses");
            return _wareHouseRepository.GetAllWarehouses();
        }

        public List<WarehouseQueryResult> GetWarehouseByCode(string code)
        {
            _log.LogInformation("WarehouseHandler: GetWarehouseByCode");
            return _wareHouseRepository.GetWarehouseByCode(code);
        }

        public List<WarehouseQueryResult> GetPageWarehouse(int pPage, int pSize)
        {
            _log.LogInformation("WarehouseHandler: GetPageWarehouse");
            return _wareHouseRepository.GetPageWarehouses(pPage, pSize);
        }
    }
}
