using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using PCFactoryManagementView.Shared;

namespace PCFactoryManagementView.Api.Filters
{
    public class MVExceptionFilter : IExceptionFilter
    {

        public void OnException(ExceptionContext context)
        {
            var _log = new LoggerManager();
            
            string message = "AG_GRID_LOCALE.request_error";
            string type = "error";

            _log.Error($@"{context.ActionDescriptor.AttributeRouteInfo.Template}: ", context.Exception);

            //Erro de banco
            if (context.Exception.Message.StartsWith("Timeout"))
            {
                message = "AG_GRID_LOCALE.timeout";
            }

            //Erro de banco sem espaco para alocacao
            if (context.Exception.Message.StartsWith("Could not allocate"))
                message = "AG_GRID_LOCALE.notspace";

            switch(context.Exception.Message)
            {
                //Quando a Treeview deve ser utilizada
                case "TreeView":
                    {
                        message = "AG_GRID_LOCALE.treeview";
                        type = "warning";
                        break;
                    }
                //Quando produto ou lote deve ser utilizado
                case "ProductOrLot":
                    {
                        message = "AG_GRID_LOCALE.productOrLot";
                        type = "warning";
                        break;
                    }
                //Quando a treeview não possui dados por conta de data
                case "TreeViewDate":
                    {
                        message = "AG_GRID_LOCALE.treeviewDate";
                        type = "warning";
                        break;
                    }
            }
            
            var apiError = new ErrorResponse
            {
                Type = type,
                Message = message
            };

            context.Result = new JsonResult(apiError) { StatusCode = 500 };
        }
    }
}
