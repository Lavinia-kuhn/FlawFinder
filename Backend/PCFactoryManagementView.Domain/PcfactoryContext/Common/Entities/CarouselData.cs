using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class CarouselData
    {
        public bool autoPlay { get; set; } = true;
        public List<CarouselItens> itens { get; set; }
        public int delay { get; set; } = 15000;
        public int Rows { get; set; } = 1;
        public int Columns { get; set; } = 1;
        public int CallSize { get; set; } = 10;
        public string url { get; set; }
    }

    public class CarouselItens
    {
        public int idItem { get; set; } 
        public string itemName { get; set; }
    }

}
