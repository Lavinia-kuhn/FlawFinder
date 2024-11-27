using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IAddressHandler
    {
        List<AddressQueryResult> GetAllAddress(); 
        List<AddressQueryResult> GetPageAddress(int pPage, int pSize);
        List<SelectData> GetAllAddressToSelect();

        List<AddressQueryResult> GetAddressByCode(string code);
        List<AddressQueryResult> GetAddressByIdWarehouses(List<int> warehouseIds);
    }

    public class AddressHandler : IAddressHandler
    {

        private ILoggerManager _log;
        private readonly IAddressRepository _addressRepository;

        public AddressHandler(IAddressRepository addressRepository,
            ILoggerManager log)
        {
            _addressRepository = addressRepository;
            _log = log;
        }

        public List<AddressQueryResult> GetAllAddress()
        {
            _log.LogInformation("AddressHandler: GetAllAddress");
            return _addressRepository.GetAllAddress();
        }

        public List<AddressQueryResult> GetAddressByCode(string code)
        {
            _log.LogInformation("AddressHandler: GetAddressByCode");
            return _addressRepository.GetAddressByCode(code);
        }

        public List<AddressQueryResult> GetAddressByIdWarehouses(List<int> warehouseIds)
        {
            _log.LogInformation("AddressHandler: GetAddressByIdWarehouse");
            return _addressRepository.GetAddressByIdWarehouses(warehouseIds);
        }

        public List<SelectData> GetAllAddressToSelect()
        {
            _log.LogInformation("AddressHandler: GetAllAddressToSelect");
            return _addressRepository.GetAllAddressToSelect();
        }

        public List<AddressQueryResult> GetPageAddress(int pPage, int pSize)
        {
            _log.LogInformation("AddressHandler: GetPageAddress");
            return _addressRepository.GetPageAddress(pPage,pSize);
        }
    }
}

