using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace PCFactoryManagementView.Infra.Translations
{
    class Translations
    {
        public Dictionary<string, Dictionary<string, string>> Translate(string language)
        {

            //Busca o caminho do projeto de Domain
            var url = AppDomain.CurrentDomain.GetAssemblies().Where(a => a.GetName().Name == "PCFactoryManagementView.Domain").FirstOrDefault().Location;

            // Encontra a última ocorrência da barra invertida
            int lastBar = url.LastIndexOf("\\");

            // Obtém a parte do caminho antes da última barra invertida
            string newUrl = url.Substring(0, lastBar);


            var json = File.ReadAllText(Path.Combine(newUrl, $"Translations\\{language}.json"), Encoding.GetEncoding("iso-8859-1"));
            var translations = JsonConvert.DeserializeObject<Dictionary<string, Dictionary<string, string>>>(json);
            return translations;
        }
    }
}

