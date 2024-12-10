using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class Jira
    {
        public List<Issue> Issues { get; set; }
    }

    public class Issue
    {
        public string key { get; set; }
        public DateTime date { get; set; }
    }

    public class Fields
    {
        public string Summary { get; set; }
        public Status Status { get; set; }
        public Priority Priority { get; set; }
        public Assignee Assignee { get; set; }
        public string Created { get; set; }
    }

    public class Status
    {
        public string Name { get; set; }
    }

    public class Priority
    {
        public string Name { get; set; }
    }

    public class Assignee
    {
        public string DisplayName { get; set; }
    }

    public class Bug
    {
        public string Key { get; set; }
        public string Summary { get; set; }
        public string Status { get; set; }
        public string Priority { get; set; }
        public string Assignee { get; set; }
        public string Created { get; set; }
    }

    public class ApiResponse
    {
        public int Area { get; set; }
        public int Componente_Compartilhado { get; set; }
        public int Duplicada { get; set; }
        public int Falta_de_Configuracao_de_ambiente { get; set; }
        public int Fonte_dos_Dados { get; set; }
        public string Issue_key { get; set; }
        public string Motivo_Nao_Deteccao { get; set; }
        public int Problem_Classification { get; set; }
        public int Summary { get; set; }
    }

}
