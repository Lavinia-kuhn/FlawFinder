using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class SankeyData
    {
        public string source { get; set; }
        public string target { get; set; }
        public decimal value { get; set; }
        public string color { get; set; }
        public string drillDownType { get; set; }
        public string drillDownUrl { get; set; }
        public string drillDownTitle { get; set; }
        public List<DrillDownKey> drilldownKeys { get; set; }
        public List<ITooltipValues> tooltips { get; set; }

        //CONSTRUTOR SIMPLIFICADO
        public SankeyData(string _source, string _target, decimal _value)
        {
            source = _source;
            target = _target;
            value = _value;
        }

        //CONSTRUTOR COM ADICAO DE DRILLDOWN
        public SankeyData(string _source, string _target, decimal _value, string _drillDownType, string _drillDownUrl, string _drillDownTitle, List<DrillDownKey> _drilldownKeys)
        {
            source = _source;
            target = _target;
            value = _value;
            drillDownType = _drillDownType;
            drillDownUrl = _drillDownUrl;
            drillDownTitle = _drillDownTitle;
            drilldownKeys = _drilldownKeys;
        }

        //CONSTRUTOR COM ADICAO DE TOOLTIP
        public SankeyData(string _source, string _target, decimal _value, List<ITooltipValues> _tooltips)
        {
            source = _source;
            target = _target;
            value = _value;
            tooltips = _tooltips;
        }

        //CONSTRUTOR COM ADICAO DE TOOLTIP E DRILLDOWN
        public SankeyData(string _source, string _target, decimal _value, string _drillDownType, string _drillDownUrl, string _drillDownTitle, List<DrillDownKey> _drilldownKeys, List<ITooltipValues> _tooltips)
        {
            source = _source;
            target = _target;
            value = _value;
            drillDownType = _drillDownType;
            drillDownUrl = _drillDownUrl;
            drillDownTitle = _drillDownTitle;
            drilldownKeys = _drilldownKeys;
            tooltips = _tooltips;
        }

        //CONSTRUTOR COM ADICAO DE CORES
        public SankeyData(string _source, string _target, decimal _value, string _color)
        {
            source = _source;
            target = _target;
            value = _value;
            color = _color;
        }

        //CONSTRUTOR COM ADICAO DE DRILLDOWN E CORES
        public SankeyData(string _source, string _target, decimal _value, string _color, string _drillDownType, string _drillDownUrl, string _drillDownTitle, List<DrillDownKey> _drilldownKeys)
        {
            source = _source;
            target = _target;
            value = _value;
            color = _color;
            drillDownType = _drillDownType;
            drillDownUrl = _drillDownUrl;
            drillDownTitle = _drillDownTitle;
            drilldownKeys = _drilldownKeys;
        }

        //CONSTRUTOR COM ADICAO DE TOOLTIP E CORES
        public SankeyData(string _source, string _target, decimal _value, string _color, List<ITooltipValues> _tooltips)
        {
            source = _source;
            target = _target;
            value = _value;
            color = _color;
            tooltips = _tooltips;
        }

        //CONSTRUTOR COM ADICAO DE TOOLTIP, DRILLDOWN E CORES
        public SankeyData(string _source, string _target, decimal _value, string _color, string _drillDownType, string _drillDownUrl, string _drillDownTitle, List<DrillDownKey> _drilldownKeys, List<ITooltipValues> _tooltips)
        {
            source = _source;
            target = _target;
            value = _value;
            color = _color;
            drillDownType = _drillDownType;
            drillDownUrl = _drillDownUrl;
            drillDownTitle = _drillDownTitle;
            drilldownKeys = _drilldownKeys;
            tooltips = _tooltips;
        }
    }
}
