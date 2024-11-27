using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IAddressGroupHandler
    {
        List<AddressGroupQueryResult> GetAllAddressGroup(); 
        List<AddressGroupQueryResult> GetPageAddressGroup(int pPage, int pSize);
        //List<SelectData> GetAllAddressGroupToSelect();

        List<AddressGroupQueryResult> GetAddressGroupByCode(string code);
        //List<AddressGroupQueryResult> GetAddressGroupByIdWarehouses(List<int> warehouseIds);
    }

    public class AddressGroupHandler : IAddressGroupHandler
    {

        private ILoggerManager _log;
        private readonly IAddressGroupRepository _AddressGroupRepository;

        public AddressGroupHandler(IAddressGroupRepository AddressGroupRepository,
            ILoggerManager log)
        {
            _AddressGroupRepository = AddressGroupRepository;
            _log = log;
        }

        public List<AddressGroupQueryResult> GetAllAddressGroup()
        {
            _log.LogInformation("AddressGroupHandler: GetAllAddressGroup");
            return _AddressGroupRepository.GetAllAddressGroup();
        }

        public List<AddressGroupQueryResult> GetAddressGroupByCode(string code)
        {
            _log.LogInformation("AddressGroupHandler: GetAddressGroupByCode");
            return _AddressGroupRepository.GetAddressGroupByCode(code);
        }

        //public List<AddressGroupQueryResult> GetAddressGroupByIdWarehouses(List<int> warehouseIds)
        //{
        //    _log.LogInformation("AddressGroupHandler: GetAddressGroupByIdWarehouse");
        //    return _AddressGroupRepository.GetAddressGroupByIdWarehouses(warehouseIds);
        //}

        //public List<SelectData> GetAllAddressGroupToSelect()
        //{
        //    _log.LogInformation("AddressGroupHandler: GetAllAddressGroupToSelect");
        //    return _AddressGroupRepository.GetAllAddressGroupToSelect();
        //}

        public List<AddressGroupQueryResult> GetPageAddressGroup(int pPage, int pSize)
        {
            _log.LogInformation("AddressGroupHandler: GetPageAddressGroup");
            return _AddressGroupRepository.GetPageAddressGroup(pPage,pSize);
        }
    }
}

