using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using System;
using System.Globalization;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities.Bases
{
    public class ReportTemporal
    {

        [HiddenColumn(true)]
        public int WeekOfYear { get; set; }

        [ValueFormatterProp(EValueFormatterDate.MONTHFORMAT)]
        [HiddenColumn(true)]
        public string Month { get; set; }

        [HiddenColumn(true)]
        public int Trimester { get; set; }
        [HiddenColumn(true)]
        public int Year { get; set; }

        private static GregorianCalendar _gc = new GregorianCalendar();
        public void GetTemporalColuns(DateTime date)
        {
            WeekOfYear = GetIso8601WeekOfYear(date);
            var monthUpper= date.ToString("MMMM", CultureInfo.CreateSpecificCulture("en")).ToUpper();
            Month = $"GLOBAL.{monthUpper}";

            Trimester = 0;
            if(date.Month < 4)
            {
                Trimester = 1;
            }else if(date.Month >= 4 && date.Month <= 6)
            {
                Trimester = 2;
            }else if (date.Month > 6 && date.Month < 9)
            {
                Trimester = 3;
            }
            else
            {
                Trimester = 4;
            }
            Year = date.Year;
        }

        public static int GetIso8601WeekOfYear(DateTime time)
        {
            DayOfWeek day = _gc.GetDayOfWeek(time);
            if (day >= DayOfWeek.Monday && day <= DayOfWeek.Wednesday)
            {
                time = time.AddDays(3);
            }

            return _gc.GetWeekOfYear(time, CalendarWeekRule.FirstFourDayWeek, DayOfWeek.Monday);
        }

    }
}
