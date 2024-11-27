using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]
    public class CellRendererProp : Attribute
    {
        public ECellRendererType _cellRenderer { get; set; }
        public string _imageEndpoint { get; set; }
        public CellRendererProp(ECellRendererType cellRendererType, string imageEndpoint = "")
        {
            this._cellRenderer = cellRendererType;
            this._imageEndpoint = imageEndpoint;
        }
    }
}