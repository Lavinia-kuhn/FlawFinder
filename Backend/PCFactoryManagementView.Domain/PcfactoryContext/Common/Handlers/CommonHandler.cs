using AspNetCore.ServiceRegistration.Dynamic;
using log4net.Filter;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface ICommonHandler
    {
        public List<DateStartEnd> GetWeeksInPeriod(DateTime startDate, DateTime endDate, string lang);
        public List<DateStartEnd> GetMonthsInPeriod(DateTime startDate, DateTime endDate, string lang);
        public List<DateStartEnd> GetQuartersInPeriod(DateTime startDate, DateTime endDate, string lang);
        public List<DateStartEnd> GetDaysInPeriod(DateTime startDate, DateTime endDate, string lang);
        public List<GetSumTimesQueryResult> GetSumTimes(List<BaseTimesQueryResult> times);
        public double RoundTo(double value, int decimals);
        public bool IsNumeric(string value);
        public int Compare(string s1, string s2);
        public string FormatedIds(List<int> ids);
        public string GetFormatTime(double seconds);
        public string ToCamelCase(string str);
        public void ChangeIndex<T>(List<T> list, T Object, int newIndex);
        public string GetFormattedCodeInput(string Value);
        public Object GetFormattedPeriodFilter(Object Filters);
    }

    public class CommonHandler : ICommonHandler
    {

        private readonly ITranslationChartHandler _translateChartHandler;
        private ILoggerManager _log;

        public CommonHandler(
            ITranslationChartHandler translationChart,
            ILoggerManager log
            )
        {
            _translateChartHandler = translationChart;
            _log = log;
        }
        public List<DateStartEnd> GetQuartersInPeriod(DateTime startDate, DateTime endDate, string lang)
        {
            DateTime x = endDate;
            DateTime y = startDate;
            double duration = x.Subtract(y).TotalDays;

            DateTime start = startDate;
            DateTime end = endDate;

            bool firstExec = true;
            bool monthChange = false;

            var quarters = new List<DateStartEnd>();

            if (startDate == endDate)
            {
                duration += 1;
            }

            for (var i = 0; i < duration; i++)
            {
                DateTime currentDay = start;

                int currQuarter = (currentDay.Month - 1) / 3 + 1;
                DateTime dtFirstDay = new DateTime(currentDay.Year, 3 * currQuarter - 2, 1);
                var lastQuarter = 3 * currQuarter + 1;
                var dtLastDay = new DateTime(currentDay.Year, 12, 31);

                if (lastQuarter <= 12)
                    dtLastDay = new DateTime(currentDay.Year, 3 * currQuarter + 1, 1).AddDays(-1);

                if (monthChange || firstExec)
                {
                    firstExec = false;
                    monthChange = false;
                    var dtStart = "";
                    var dtEnd = "";


                    if (start.CompareTo(dtFirstDay) > 0)
                    {
                        dtStart = start.ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        dtStart = dtFirstDay.ToString("yyyy-MM-dd");
                    }

                    if (end.CompareTo(dtLastDay) < 0)
                        dtEnd = end.ToString("yyyy-MM-dd");

                    else
                        dtEnd = dtLastDay.ToString("yyyy-MM-dd");

                    var compare = new DateStartEnd();
                    compare.startDate = dtStart;
                    compare.endDate = dtEnd;
                    compare.depict = startDate.Year == endDate.Year ? currQuarter.ToString() : $"{start.Year} - {currQuarter}";
                    quarters.Add(compare);

                }

                start = start.AddDays(1);
                var newMonth = (start.Month - 1) / 3 + 1;
                if (currQuarter != newMonth)
                {
                    monthChange = true;
                }
            }
            return quarters;
        }

        public List<DateStartEnd> GetWeeksInPeriod(DateTime startDate, DateTime endDate, string lang)
        {
            var weekLabel = _translateChartHandler.GetChartTranslation(
               new TranslationChartQueryResult { lang = lang, indicatorLabel = "", screenCode = "INDICATORS_GRAPHIC", translationKey = "WEEK", indicator = true });

            DateTime y = startDate;
            DateTime x = endDate;
            double duration = x.Subtract(y).TotalDays;

            DateTime start = startDate;
            DateTime end = endDate;

            bool firstExec = true;
            bool weekChange = false;

            var weeks = new List<DateStartEnd>();

            if (startDate == endDate)
            {
                duration += 1;
            }

            for (var i = 0; i < duration; i++)
            {
                int currentWeek = GetIso8601WeekOfYear(start);
                DateTime currentDay = start;

                if (firstExec == true || weekChange == true)
                {
                    firstExec = false;
                    weekChange = false;
                    var dtStart = "";
                    var dtEnd = "";
                    if (start.CompareTo(StartOfWeek(currentDay, DayOfWeek.Monday)) > 0)
                        dtStart = start.ToString("yyyy-MM-dd");

                    else
                        dtStart = StartOfWeek(currentDay, DayOfWeek.Monday).ToString("yyyy-MM-dd");


                    if (end.CompareTo(EndOfWeek(currentDay, DayOfWeek.Saturday)) < 0)
                        dtEnd = end.ToString("yyyy-MM-dd");

                    else
                        dtEnd = EndOfWeek(currentDay, DayOfWeek.Saturday).ToString("yyyy-MM-dd");

                    var compare = new DateStartEnd();
                    compare.startDate = dtStart;
                    compare.endDate = dtEnd;
                    compare.depict = startDate.Year == endDate.Year ? weekLabel + $" {currentWeek}" : $"{start.Year} - {currentWeek}";
                    weeks.Add(compare);
                    ;
                }

                start = start.AddDays(1);
                var newWeek = GetIso8601WeekOfYear(start);
                if (currentWeek != newWeek)
                {
                    weekChange = true;
                }

            }

            return weeks;
        }

        public List<DateStartEnd> GetMonthsInPeriod(DateTime startDate, DateTime endDate, string lang)
        {
            DateTime y = startDate;
            DateTime x = endDate;
            double duration = x.Subtract(y).TotalDays;

            DateTime start = startDate;
            DateTime end = endDate;

            bool firstExec = true;
            bool monthChange = false;

            if (startDate == endDate)
            {
                duration += 1;
            }

            var months = new List<DateStartEnd>();
            for (var i = 0; i < duration; i++)
            {
                int currentMonth = start.Month;
                DateTime currentDay = start;

                if (firstExec == true || monthChange == true)
                {
                    firstExec = false;
                    monthChange = false;
                    var dtStart = "";
                    var dtEnd = "";
                    var depict = "";

                    var firstDayOfMonth = new DateTime(currentDay.Year, currentDay.Month, 1);

                    var lastDayOfMonth = firstDayOfMonth.AddMonths(1).AddDays(-1);

                    if (start.CompareTo(firstDayOfMonth) > 0)
                    {
                        dtStart = start.ToString("yyyy-MM-dd");
                        depict = start.ToString("MMMM", CultureInfo.CreateSpecificCulture(lang)).ToUpper();
                    }
                    else
                    {
                        dtStart = firstDayOfMonth.ToString("yyyy-MM-dd");
                        depict = firstDayOfMonth.ToString("MMMM", CultureInfo.CreateSpecificCulture(lang)).ToUpper();
                    }

                    if (end.CompareTo(lastDayOfMonth) < 0)
                        dtEnd = end.ToString("yyyy-MM-dd");

                    else
                        dtEnd = lastDayOfMonth.ToString("yyyy-MM-dd");

                    var compare = new DateStartEnd();
                    compare.startDate = dtStart;
                    compare.endDate = dtEnd;
                    compare.depict = startDate.Year == endDate.Year ? $"{depict}" : $"{start.Year} - {depict}";
                    months.Add(compare);

                }

                start = start.AddDays(1);
                var newMonth = start.Month;
                if (currentMonth != newMonth)
                {
                    monthChange = true;
                }

            }

            return months;
        }

        public int GetIso8601WeekOfYear(DateTime time)
        {
            DayOfWeek day = CultureInfo.InvariantCulture.Calendar.GetDayOfWeek(time);
            if (day >= DayOfWeek.Monday && day <= DayOfWeek.Wednesday)
            {
                time = time.AddDays(3);
            }

            return CultureInfo.InvariantCulture.Calendar.GetWeekOfYear(time, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Sunday);
        }

        public DateTime StartOfWeek(DateTime dt, DayOfWeek startOfWeek)
        {
            int diff = (7 + (dt.DayOfWeek - startOfWeek)) % 7;
            return dt.AddDays(-1 * diff).Date;
        }

        public DateTime EndOfWeek(DateTime dt, DayOfWeek endOfWeek)
        {
            int diff = endOfWeek - dt.DayOfWeek;
            return dt.AddDays(diff).Date;
        }

        public int GetQuarter(DateTime date)
        {
            return (date.Month + 2) / 3;
        }

        public List<DateStartEnd> GetDaysInPeriod(DateTime startDate, DateTime endDate, string lang)
        {
            List<DateStartEnd> days = new List<DateStartEnd>();

            for (DateTime date = startDate; date <= endDate; date = date.AddDays(1))
            {
                days.Add(new DateStartEnd()
                {
                    startDate = date.Date.ToString("yyyy-MM-dd"),
                    endDate = date.Date.Add(new TimeSpan(23, 59, 59)).ToString("yyyy-MM-dd"),
                    depict = date.Date.ToString("dd/MM/yyyy")
                });
            }

            return days;
        }

        public string FormatedIds(List<int> ids)
        {
            string concatId = " ";

            foreach (var id in ids)
            {
                concatId += id + ",";
            }
            return concatId.Remove(concatId.Length - 1);
        }

        public double RoundTo(double value, int decimals)
        {
            double factor = Math.Pow(10, decimals);
            return Math.Round(value * factor) / factor;
        }

        public bool IsNumeric(string value)
        {
            return int.TryParse(value, out _);
        }

        public int Compare(string s1, string s2)
        {
            const int S1GreaterThanS2 = 1;
            const int S2GreaterThanS1 = -1;

            var IsNumeric1 = IsNumeric(s1);
            var IsNumeric2 = IsNumeric(s2);

            if (IsNumeric1 && IsNumeric2)
            {
                var i1 = Convert.ToInt32(s1);
                var i2 = Convert.ToInt32(s2);

                if (i1 > i2)
                {
                    return S1GreaterThanS2;
                }

                if (i1 < i2)
                {
                    return S2GreaterThanS1;
                }

                return 0;
            }

            if (IsNumeric1)
            {
                return S2GreaterThanS1;
            }

            if (IsNumeric2)
            {
                return S1GreaterThanS2;
            }

            return string.Compare(s1, s2, true, CultureInfo.InvariantCulture);
        }

        public List<GetSumTimesQueryResult> GetSumTimes(List<BaseTimesQueryResult> times)
        {
            var sumTimes = new List<GetSumTimesQueryResult>();
            foreach (var time in times)
            {
                var sumTime = new GetSumTimesQueryResult();

                sumTime.plantName = time.plantName;
                sumTime.areaName = time.areaName;
                sumTime.sectorName = time.sectorName;
                sumTime.managerGrpName = time.managerGrpName;
                sumTime.resourceName = time.resourceName;
                sumTime.resourceCode = time.resourceCode;
                sumTime.idResource = time.idResource;
                sumTime.TempoParadaNPlanejada = time.NPlanTime;
                sumTime.TempoParadaPlanejada1 = time.PlanTime;
                sumTime.TempoParadaPlanejada2 = time.WasteTime;
                sumTime.TempoTotal = time.RunningTime + time.NPlanTime + time.WasteTime + time.PlanTime + time.NoSchTime;
                sumTime.TempoDeCarga = time.RunningTime + time.NPlanTime + time.WasteTime + time.PlanTime;
                sumTime.TempoDisponivel = time.RunningTime + time.NPlanTime;
                sumTime.TempoProdutivoBruto = time.ProductTime + time.ScrapTime + time.ReworkTime;
                sumTime.TempoProdutivoLiquido = time.ProductTime;
                sumTime.TempoForaDeTurno = time.NoSchTime;
                sumTime.TempoRetrabalho = time.ReworkTime;
                sumTime.TempoTrabalhado = time.RunningTime;
                sumTime.TempoRefugo = time.ScrapTime;
                sumTime.Ritmo = ((time.RunningTime - sumTime.TempoProdutivoBruto) < 0) ? 0 : (time.RunningTime - sumTime.TempoProdutivoBruto);
                sumTime.Refugo = time.ScrapProd;
                sumTime.Retrabalho = time.ReworkProd;
                sumTime.ProdQtyFactor2 = time.ProdQtyFromFactor2;
                sumTime.ProdScrapQtyFactor2 = time.ProdQtyFromFactor2 + time.ScrapQtyFromFactor2;
                sumTimes.Add(sumTime);
            }

            return sumTimes;
        }

        public string GetFormatTime(double seconds)
        {
            var ts = TimeSpan.FromSeconds(seconds);
            var hour = (Math.Floor(ts.TotalHours) > 0 ? ((Math.Floor(ts.TotalHours) < 10 ? "0" : "") + Math.Floor(ts.TotalHours).ToString()) : "00");
            var min = (ts.Minutes > 0 ? ((ts.Minutes < 10 ? "0" : "") + ts.Minutes.ToString()) : "00");
            var sec = (ts.Seconds > 0 ? ((ts.Seconds < 10 ? "0" : "") + ts.Seconds.ToString()) : "00");

            return (hour + ":" + min + ":" + sec);
        }

        public string ToCamelCase(string str)
        {
            Regex pattern = new Regex(@"[A-Z]{2,}(?=[A-Z][a-z]+[0-9]*|\b)|[A-Z]?[a-z]+[0-9]*|[A-Z]|[0-9]+");
            return new string(
              new CultureInfo("en-US", false)
                .TextInfo
                .ToTitleCase(
                  string.Join(" ", pattern.Matches(str)).ToLower()
                )
                .Replace(@" ", "")
                .Select((x, i) => i == 0 ? char.ToLower(x) : x)
                .ToArray()
            );
        }

        public void ChangeIndex<T>(List<T> list, T obj, int newIndex)
        {
            //Busca o objeto na lista
            int index = list.IndexOf(obj);
            if (index >= 0)
            {
                // Remove o objeto do índice original
                list.RemoveAt(index);

                // Insere o objeto no novo índice
                list.Insert(newIndex, obj);
            }
            else
            {
                _log.Error("Object not found in the list", new Exception("Object not found in the list"));
            }
        }

        public string GetFormattedCodeInput(string Value)
        {
            if (Value.Contains("''"))
            {
                Value = Value.Replace("''", "'");
            }

            return Value;
        }

        public Object GetFormattedPeriodFilter(Object Filters)
        {
            var filterPresets = Filters.GetType().GetProperty("filterPresets")?.GetValue(Filters) as List<FilterOption>;
            var filterRows = Filters.GetType().GetProperty("filterRows")?.GetValue(Filters) as List<FilterRow>;

            if (filterRows == null && filterPresets == null)
                return Filters;

            if (filterPresets.Count == 0 || filterRows.Count == 0)
                return Filters;

            if (filterPresets != null && filterRows != null)
            {
                // Verificar se há opções de filtro de data
                var quickFilterDateOptions = filterRows
                    ?.FirstOrDefault(filter => filter.label.Contains("PERIOD_FILTER"))?.options;

                // Verificar se há uma opção de filtro de data selecionada
                var selectedQuickFilterDateOption = filterPresets
                    ?.FirstOrDefault(option => (option.type == "QUICK_FILTER_DATE" || option.label.Contains("QUICK_FILTER_DATE")) && option.value == "true")
                    ?? quickFilterDateOptions?.FirstOrDefault(option => option.type == "QUICK_FILTER_DATE" && option.value == "true");

                if (selectedQuickFilterDateOption != null)
                {
                    DateTime currentDate = DateTime.Now;
                    var shiftList = new List<int>();

                    switch (selectedQuickFilterDateOption.name)
                    {
                        case "RESPECT_TOP_FILTER":
                            break;

                        case "PREVIOUS_DAY":
                            Filters.GetType().GetProperty("startDate")?.SetValue(Filters, currentDate.AddDays(-1).ToString("yyyy-MM-dd"));
                            Filters.GetType().GetProperty("endDate")?.SetValue(Filters, currentDate.AddDays(-1).ToString("yyyy-MM-dd"));
                            break;

                        case "TODAY":
                            Filters.GetType().GetProperty("startDate")?.SetValue(Filters, currentDate.ToString("yyyy-MM-dd"));
                            Filters.GetType().GetProperty("endDate")?.SetValue(Filters, currentDate.ToString("yyyy-MM-dd"));
                            break;

                        case "PREVIOUS_MONTH":
                            DateTime previousMonthStartDate = currentDate.AddDays(-30);
                            DateTime previousMonthEndDate = currentDate.AddDays(-1);
                            Filters.GetType().GetProperty("startDate")?.SetValue(Filters, previousMonthStartDate.ToString("yyyy-MM-dd"));
                            Filters.GetType().GetProperty("endDate")?.SetValue(Filters, previousMonthEndDate.ToString("yyyy-MM-dd"));
                            break;

                        case "ACTUAL_MONTH":
                            DateTime firstDayOfCurrentMonth = new DateTime(currentDate.Year, currentDate.Month, 1);
                            Filters.GetType().GetProperty("startDate")?.SetValue(Filters, firstDayOfCurrentMonth.ToString("yyyy-MM-dd"));
                            Filters.GetType().GetProperty("endDate")?.SetValue(Filters, currentDate.ToString("yyyy-MM-dd"));
                            break;

                        case "LAST_MONTH":
                            DateTime firstDayOfLastMonth = new DateTime(currentDate.Year, currentDate.Month - 1, 1);
                            DateTime lastDayOfLastMonth = firstDayOfLastMonth.AddMonths(1).AddDays(-1);
                            Filters.GetType().GetProperty("startDate")?.SetValue(Filters, firstDayOfLastMonth.ToString("yyyy-MM-dd"));
                            Filters.GetType().GetProperty("endDate")?.SetValue(Filters, lastDayOfLastMonth.ToString("yyyy-MM-dd"));
                            break;

                        case var shiftOption when shiftOption.StartsWith("SHIFT"):
                            int shiftNumber = int.Parse(shiftOption.Substring(5));
                            shiftList.Add(shiftNumber);
                            Filters.GetType().GetProperty("shift")?.SetValue(Filters, shiftList);
                            Filters.GetType().GetProperty("startDate")?.SetValue(Filters, currentDate.ToString("yyyy-MM-dd"));
                            Filters.GetType().GetProperty("endDate")?.SetValue(Filters, currentDate.ToString("yyyy-MM-dd"));
                            break;

                        default:
                            break;
                    }
                }
            }

            return Filters;
        }
    }
}
