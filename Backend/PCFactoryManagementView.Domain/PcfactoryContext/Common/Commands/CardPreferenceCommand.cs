using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands
{
    public class CardPreferenceCommand
    {
        public string CardName { get; set; }
        public CardConfig Configuration { get; set; }
        public int IdUser { get; set; }
    } 
}
