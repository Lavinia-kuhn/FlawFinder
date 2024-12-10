using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Exceptions
{
    class ProductOrLotException : Exception
    {
        public ProductOrLotException(): base("ProductOrLot")
        {

        }
    }
}