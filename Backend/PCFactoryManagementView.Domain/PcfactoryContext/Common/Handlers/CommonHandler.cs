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
        public double RoundTo(double value, int decimals);
        public bool IsNumeric(string value);
        public int Compare(string s1, string s2);
        public string FormatedIds(List<int> ids);
        public string GetFormatTime(double seconds);
        public string ToCamelCase(string str);
        public void ChangeIndex<T>(List<T> list, T Object, int newIndex);
        public string GetFormattedCodeInput(string Value);
    }

    public class CommonHandler : ICommonHandler
    {

        private ILoggerManager _log;

        public CommonHandler(
            ILoggerManager log
            )
        {
            _log = log;
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

      
    }
}
