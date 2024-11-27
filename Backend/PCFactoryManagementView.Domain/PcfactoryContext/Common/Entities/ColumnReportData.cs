using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class ColumnReportData : BaseReportData
    {
        public ColumnReportData(
            string x,
            double y,
            string stacked,
            string drillDownType,
            string drillDownUrl,
            string drillDownTitle,
            List<DrillDownKey> drillDownKeys,
            EValueType valueType = EValueType.Decimal)
        {
            Type = x;
            Value = y;
            ValueType = valueType;
            Resource = stacked;
            DrillDownType = drillDownType;
            DrillDownUrl = drillDownUrl;
            DrillDownTitle = drillDownTitle;
            DrillDownKeys.AddRange(drillDownKeys);

        }

        public ColumnReportData(
           string x,
           double y,
           string stacked,
           string drillDownType,
           string drillDownUrl,
           string drillDownTitle,
           EValueType valueType = EValueType.Decimal)
        {
            Type = x;
            Value = y;
            ValueType = valueType;
            Resource = stacked;
            DrillDownType = drillDownType;
            DrillDownUrl = drillDownUrl;
            DrillDownTitle = drillDownTitle;
        }


        public ColumnReportData(
            string x,
            double y,
            string stacked,
            string drillDownType,
            string drillDownUrl,
            string drillDownTitle,
            List<DrillDownKey> drillDownKey,
            string name,
            EValueType valueType = EValueType.Decimal)
        {
            Type = x;
            Value = y;
            ValueType = valueType;
            Resource = stacked;
            DrillDownType = drillDownType;
            DrillDownUrl = drillDownUrl;
            DrillDownTitle = drillDownTitle;
            DrillDownKeys.AddRange(drillDownKey);
            Name = name;

        }

        public ColumnReportData(
            string x,
            double y,
            string stacked,
            EValueType valueType = EValueType.Decimal)
        {
            Type = x;
            Value = y;
            ValueType = valueType;
            Resource = stacked;
        }

        public ColumnReportData(
            string x,
            double y,
            EValueType valueType = EValueType.Decimal)
        {
            Type = x;
            Value = y;
            ValueType = valueType;

        }
        public ColumnReportData(
            string x,
            double y,
            List<ITooltipValues> tooltips)
        {
            Type = x;
            Value = y;
            Tooltips = tooltips;
        }

        public string Type { get; private set; }
        public double Value { get; private set; }
        public EValueType ValueType { get; private set; }
        public string Resource { get; private set; }
        public string GoalField { get; private set; }
        public bool ShowGoal { get; private set; }
        public bool ShowErrorLine { get; set; }
        public string Name { get; set; }
        public List<ITooltipValues> Tooltips { get; set; } = new List<ITooltipValues>();

        public void SetColor(string color)
        {
            Color = color;
        }

        public void SetGoalField(string goalField)
        {
            GoalField = goalField;
        }

        public void SetShowGoalField(double actualValue)
        {
            ShowGoal = (Value > actualValue);
        }
    }
}
