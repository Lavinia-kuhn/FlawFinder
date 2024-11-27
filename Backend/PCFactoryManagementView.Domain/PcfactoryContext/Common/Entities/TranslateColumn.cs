using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]  // Multiuse attribute.  
    class TranslateColumn : Attribute
    {
        public bool _translate { get; private set; }
        public TranslateColumn(bool translate)
        {
            _translate = translate;
        }
    }
}
   