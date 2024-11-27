using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class CardConfig
    {
        public CardConfig()
        {
            Parameters = new List<CardParams>();
            Height = ECardHeight.DEFAULT;
        }

        public bool Visible { get; set; }
        public ECardSize Size { get; set; }
        public ECardHeight Height { get; set; }
        public int Position { get; set; }
        public List<CardParams> Parameters { get; set; }
        public int idLastEditUser { get; set; }
    }

    public class CardParams
    {
        public string ParamName { get; set; }
        public string ParamValue { get; set; }
    }

    public class CardDeleteDuplicate
    {
        public int idPref { get; set; }
        public int idUser { get; set; }
        public int? idDefaultAdm { get; set; }
        public string label { get; set; }

    }
}
