using System;
using System.Collections.Generic;
using System.Numerics;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class GetSumTimesQueryResult
    {
        public string plantName { get; set; }
        public string areaName { get; set; }
        public string sectorName { get; set; }
        public string managerGrpName { get; set; }
        public string resourceName { get; set; }
        public string resourceCode { get; set; }
        public string idResource { get; set; }
        public string woHdName { get; set; }
        public string woDetName { get; set; }
        // PCF: TEMPO TOTAL
        public long TempoTotal { get; set; }
        // PCF: TEMPO DISPONIVEL
        public long TempoDeCarga { get; set; }
        // PCF: TEMPO OPERACIONAL
        public long TempoDisponivel { get; set; }
        // PCF: TEMPO TRABALHADO
        public long TempoTrabalhado { get; set; }
        // PCF: TEMPO PRODUTIVO BRUTO
        public long TempoProdutivoBruto { get; set; }
        // PCF: TEMPO PRODUTIVO LIQUIDO
        public long TempoProdutivoLiquido { get; set; }
        public long TempoParadaPlanejada1 { get; set; }
        public long TempoParadaPlanejada2 { get; set; }
        public long TempoParadaNPlanejada { get; set; }
        public long TempoForaDeTurno { get; set; }
        public long TempoRefugo { get; set; }
        public long TempoRetrabalho { get; set; }
        public long Ritmo { get; set; }
        public long Refugo { get; set; }
        public long Retrabalho { get; set; }
        public decimal ProdQtyFactor2 { get; set; }
        public decimal ProdScrapQtyFactor2 { get; set; }
    }

    public class BaseTimesQueryResult
    {
        public string plantName { get; set; }
        public string areaName { get; set; }
        public string sectorName { get; set; }
        public string managerGrpName { get; set; }
        public string resourceName { get; set; }
        public string resourceCode { get; set; }
	    public string idResource { get; set; }
        public string woHdName { get; set; }
        public string woDetName { get; set; }
        public long NoSchTime { get; set; }
        public long NPlanTime { get; set; }
        public long PlanTime { get; set; }
        public long ProductTime { get; set; }
        public long RunningTime { get; set; }
        public long ReworkTime { get; set; }
        public long ScrapTime { get; set; }
        public long WasteTime { get; set; }
        public long ReworkProd { get; set; }
        public long ScrapProd { get; set; }
        public decimal ProdQtyFromFactor2 { get; set; }
        public decimal ScrapQtyFromFactor2 { get; set; }

    }
}
