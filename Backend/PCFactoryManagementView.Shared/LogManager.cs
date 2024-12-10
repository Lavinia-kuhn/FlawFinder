using AspNetCore.ServiceRegistration.Dynamic;
using log4net;
using log4net.Config;
using System;
using System.IO;
using System.Reflection;
using System.Xml;

namespace PCFactoryManagementView.Shared
{
    [SingletonService]
    public interface ILoggerManager
    {
        void LogInformation(string message);
        void Debug(string message);
        void DebugError(string message, Exception ex);
        void DebugFormat(string message, object[] args);
        void Warning(string message);
        void WarningError(string message, Exception ex);
        void Error(string message, Exception ex);
    }

    public class LoggerManager : ILoggerManager
    {
        private readonly ILog _logger = LogManager.GetLogger(typeof(LoggerManager));

        public LoggerManager()
        {
            try
            {
                var log4netConfig = new XmlDocument();

                using (var fs = File.OpenRead("log4net.config"))
                {
                    log4netConfig.Load(fs);
                    var repo = LogManager.CreateRepository(Assembly.GetEntryAssembly(), typeof(log4net.Repository.Hierarchy.Hierarchy));
                    XmlConfigurator.Configure(repo, log4netConfig["log4net"]);
                    _logger.Info("Log System Initialized");
                }
            }
            catch (Exception ex)
            {
                _logger.Error("Error", ex);
            }
        }
        public void LogInformation(string message)
        {
            _logger.Info(message);
        }

        public void Debug(string message)
        {
            _logger.Debug(message);
        }

        public void DebugFormat(string message, object[] args)
        {
            _logger.DebugFormat(message, args);
        }

        public void Warning(string message)
        {
            _logger.Warn(message);
        }

        public void WarningError(string message, Exception ex)
        {
            _logger.Warn(message, ex);
        }

        public void DebugError(string message, Exception ex)
        {
            _logger.Debug(message);
        }

        public void Error(string message, Exception ex)
        {
            _logger.Error(message,ex);
        }
    }
}
