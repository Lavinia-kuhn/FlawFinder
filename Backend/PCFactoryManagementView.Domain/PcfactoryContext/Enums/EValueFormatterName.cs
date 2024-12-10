namespace PCFactoryManagementView.Domain.PcfactoryContext.Enums
{
    public static class EValueFormatterName
    {
        public const string TEEP = "teepFormatter";
        public const string DEC4 = "dec4Formatter"; //decimal de 4 casas
        public const string DEC2 = "dec2Formatter"; //decimal de 2 casas
        public const string INT = "intFormatter";
        public const string TIMEHOURS = "timeHoursFormatter";
        public const string TIMEHOURSDAY = "timeHoursDaysFormatter";
        public const string DATE = "dateFormatter";
        public const string DATEDAY = "dateDayFormatter";
        public const string DATETIMEHOURS = "datetimeHoursFormatter";
        public const string SITUATIONAPPROVAL = "situationApprovalFormatter";
        public const string STATUSFLGVALIDATED = "statusFlgValidatedFormatter";
        public const string COLIDS = "colIdsFormatter";
        public const string ANDONLINK = "andonLinkFormatter"; // AndonLink
        public const string PERIODFILTER = "andonPeriodFilterFormatter";
    }
    public static class EValueFormatterPref
    {
        public const string DECUNIT = "decUnitFormatter"; //Casas Decimais Unidade

        public const string DECINDICATORS = "decIndicators"; //Casas Decimais Indicadores
        public const string DECINDICATORSPERCENT = "decIndicatorsPercentFormatter"; //Casas Decimais Percentual

        public const string DECSPEED = "decSpeedFormatter";
        public const string DECSPEEDFORMAT = "decSpeedFormatFormatter"; //Casas Decimais Velocidade

        public const string DECCREW = "decCrewFormatter"; //Casas Decimais Equipe

        public const string TEMPFORMAT = "tempFormatter"; // Formato Tempo

        public const string DECMATERIAL = "decMaterial"; //Casas Decimais Materiais

    }
    public static class EValueFormatterDate
    {
        public const string TIMEHOURS = "elapsedFormat";
        public const string DATE = "dateFormat";
        public const string DATEDAY = "dateFormat";
        public const string DATETIMEHOURS = "dateTimeFormat";
        public const string MONTHFORMAT = "monthFormatter";
    }
}