using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface ILotHandler
    {
        List<LotQueryResult> GetAllLot();
        List<LotQueryResult> GetLotByCode(string code);
        List<LotQueryResult> GetPageLot(int pPage, int pSize);
    }

    public class LotHandler : ILotHandler
    {

        private ILoggerManager _log;
        private readonly ILotRepository _LotRepository;

        public LotHandler(ILotRepository LotRepository,
            ILoggerManager log)
        {
            _LotRepository = LotRepository;
            _log = log;
        }

        public List<LotQueryResult> GetAllLot()
        {
            _log.LogInformation("LotHandler: GetAllLot");
            return _LotRepository.GetAllLot();
        }

        public List<LotQueryResult> GetLotByCode(string code)
        {
            _log.LogInformation("LotHandler: GetLotByCode");
            return _LotRepository.GetLotByCode(code);
        }

        public List<LotQueryResult> GetPageLot(int pPage, int pSize)
        {
            _log.LogInformation("LotHandler: GetAllLot");
            return _LotRepository.GetPageLot(pPage, pSize);
        }
    }
}
