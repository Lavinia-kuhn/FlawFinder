using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Shared;
using System;
using System.Data;
using System.Data.SqlClient;

namespace PCFactoryManagementView.Infra.PcfactoryContext.DataContext
{
    [ScopedService]
    public class PCFactoryManagementViewDataContext: IDisposable
    {
        public SqlConnection Connection { get; set; }

        public PCFactoryManagementViewDataContext()
        {
            Connection = new SqlConnection(Settings.ConnectionString);
            Connection.Open();
        }

        public void Dispose()
        {
            if (Connection.State != ConnectionState.Closed)
                Connection.Close();

        }
    }

    [ScopedService]
    public class PCFactoryManagementViewDataContextInteg : IDisposable
    {
        public SqlConnection ConnectionWithPCF4Integ { get; set; }
        public PCFactoryManagementViewDataContextInteg()
        {
            if (Settings.ConnectionStringInteg != null)
            {
                ConnectionWithPCF4Integ = new SqlConnection(Settings.ConnectionStringInteg);
                ConnectionWithPCF4Integ.Open();
            }
        }

        public void Dispose()
        {
            if (ConnectionWithPCF4Integ != null)
            {
                if (ConnectionWithPCF4Integ.State != ConnectionState.Closed)
                    ConnectionWithPCF4Integ.Close();
            }
        }
    }
}
