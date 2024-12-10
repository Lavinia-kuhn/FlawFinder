using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Text.Json;
using System.Globalization;
using System.IO;
using CsvHelper;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IIssueHandler
    {
        List<DualAxes> GetNoDetectionCausePareto();
        List<Line> GetNoDetectionIncrease();
        List<Pie> GetAllNoDetection();
        int GetBugCount();
        Task GetBugsFromJira();

    }
    public class IssueHandler : IIssueHandler
    {

        private ILoggerManager _log;
        private IIssueRepository _issueRepository;

        public IssueHandler(
            ILoggerManager log,
            IIssueRepository issueRepository
            )
        {
            _log = log;
            _issueRepository = issueRepository;
        }

        public List<DualAxes> GetNoDetectionCausePareto()
        {
            AddNoDetectionCause();
            var pareto = _issueRepository.GetNoDetectionCausePareto();
            var total = pareto.Sum(x => x.count);
            var countLine = 0.0;
            foreach (var p in pareto)
            {

                countLine += p.count;
                p.value = Math.Round((countLine / total) * 100, 2);
            }

            return pareto;
        }

        public List<Line> GetNoDetectionIncrease()
        {
            return _issueRepository.GetNoDetectionIncrease();
        }

        public List<Pie> GetAllNoDetection()
        {
            return _issueRepository.GetAllNoDetection();
        }


        public int GetBugCount()
        {
            return _issueRepository.GetBugCount();
        }

        public async Task GetBugsFromJira()
        {
          
            string baseUrl = "https://jiracloudweg.atlassian.net";
            string endpoint = "/rest/agile/1.0/board/6/issue";

           
            string username = Environment.GetEnvironmentVariable("ATLASSIAN_USERNAME");
            string password = Environment.GetEnvironmentVariable("ATLASSIAN_API_TOKEN");


            int startAt = 0;
            int maxResults = 50;
            bool hasMoreResults = true;

            try
            {
                using (var client = new HttpClient())
                {
                    
                    var credentials = Convert.ToBase64String(Encoding.ASCII.GetBytes($"{username}:{password}"));
                    client.BaseAddress = new Uri(baseUrl);
                    client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", credentials);

                    while (hasMoreResults)
                    {
                    
                        string paginatedEndpoint = $"{endpoint}?startAt={startAt}";

                        HttpResponseMessage response = await client.GetAsync(paginatedEndpoint);

                        if (response.IsSuccessStatusCode)
                        {
                      
                            var responseBody = JsonConvert.DeserializeObject<object>(await response.Content.ReadAsStringAsync()) as JObject;
                            var issues = responseBody["issues"];
                            var total = (int)responseBody["total"]; 
                            var currentMaxResults = (int)responseBody["maxResults"];

                            var issuesBulkValues = new List<Issue>();
                            foreach (var issue in issues)
                            {
                                var components = issue["fields"]["components"] as JArray;
                                if (components.Count() > 0)
                                {
                                    if (components[0]?["name"].ToString() == "PCF Management View")
                                        issuesBulkValues.Add(new Issue { key = issue["key"].ToString(), date = DateTime.Parse(issue["fields"]["created"].ToString()) });
                                }

                            }
                            _issueRepository.InsertIssueCodes(issuesBulkValues);
                            startAt += currentMaxResults;
                            hasMoreResults = startAt < total;
                        }
                        else
                        {
                            string errorBody = await response.Content.ReadAsStringAsync();
                            Console.WriteLine($"Erro: {response.StatusCode}, Detalhes: {errorBody}");
                            hasMoreResults = false;
                        }
                    }
                }

                AddNoDetectionCause();
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Erro ao chamar a API: {ex.Message}");
            }
        }

        public async Task AddNoDetectionCause()
        {
            string apiUrl = "http://localhost:5000/predict_reasons"; // URL da sua API Flask
            
            string filePath = "C:/Users/veniciojt/Downloads/BugsSemMotivos.csv"; // Caminho para o arquivo CSV que deseja enviar

            try
            {
                using (HttpClient client = new HttpClient())
                {
                    // Definir o cabeçalho Content-Type para enviar arquivos
                    client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                    // Carregar o arquivo para enviar
                    MultipartFormDataContent formData = new MultipartFormDataContent();
                    ByteArrayContent fileContent = new ByteArrayContent(System.IO.File.ReadAllBytes(filePath));
                    fileContent.Headers.ContentType = new MediaTypeHeaderValue("text/csv");
                    formData.Add(fileContent, "file", "arquivo.csv");

                    // Fazer a solicitação POST para a API
                    HttpResponseMessage response = await client.PostAsync(apiUrl, formData);

                    if (response.IsSuccessStatusCode)
                    {
                        string responseContent = await response.Content.ReadAsStringAsync();
                        var result = JsonConvert.DeserializeObject<List<ApiResponse>>(responseContent);
                        _issueRepository.InsertNoDetectionCause(result);
                    }
                    else
                    {
                        Console.WriteLine("Erro ao chamar a API. Status: " + response.StatusCode);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Erro: " + ex.Message);
            }
        }
    }

}
