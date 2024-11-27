using DbUp;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using PCFactoryManagementView.Shared;
using System;
using System.Linq;


namespace PCFactoryManagementView.Filters
{
    public class DatabaseInitFilter : IStartupFilter
    {
        private readonly ILoggerManager _log;

        public DatabaseInitFilter(ILoggerManager log)
        {
            _log = log;
        }

        public Action<IApplicationBuilder> Configure(Action<IApplicationBuilder> next)
        {
            var connectionString = Settings.ConnectionString;
            _log.LogInformation("=========================================== Starting Migrations");
            try
            {
                //VOU OBTER OS RESOURCES DO PROJETO INFRA
                var a = AppDomain.CurrentDomain.GetAssemblies().Where(a => a.GetName().Name == "PCFactoryManagementView.Infra").FirstOrDefault();

                if (a != null)
                {
                    var dbUpgradeEngineBuilder = DeployChanges.To
                         .SqlDatabase(connectionString)
                         //.WithScriptsEmbeddedInAssembly(a, (string s) => s.Contains("Script"))
                         .WithScriptsEmbeddedInAssembly(a)
                         .WithTransaction()
                         .JournalToSqlTable("dbo", "__MigrationHistoryMV");
                    //.LogTo(_log);
                    var dbUpgradeEngine = dbUpgradeEngineBuilder.Build();
                    var numberOfScripts = dbUpgradeEngine.GetScriptsToExecute();
                    _log.LogInformation($"=========================================== {numberOfScripts.Count()} Script(s) to execute");
                    if (dbUpgradeEngine.IsUpgradeRequired())
                    {
                        _log.LogInformation("=========================================== Upgrades have been detected. Upgrading database now...");
                        var operation = dbUpgradeEngine.PerformUpgrade();
                        if (operation.Successful)
                        {
                            _log.LogInformation("=========================================== Migration process finished");
                        }
                        else {
                            var errorType = operation.Error;
                            var scriptError = operation.ErrorScript;
                            _log.LogInformation("=========================================== Error happened in the upgrade.");
                            _log.LogInformation($@"{errorType.Message} occurred in {scriptError.Name}.
===========================================
The content of the script is:
    {scriptError.Contents}");
                        }
                    }
                }

            }
            catch (Exception e)
            {
                _log.Error("=========================================== Migration Error.", e);
                throw e;
            }

            return next;
        }
    }
}