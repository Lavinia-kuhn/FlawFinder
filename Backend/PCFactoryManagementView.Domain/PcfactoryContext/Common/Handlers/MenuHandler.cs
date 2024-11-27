using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Shared;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IMenuHandler
    {
        List<MenusResult> GetMenusByIdUser(int iduser);
        List<MenusResult> GetQualityMenusByIdUser(int iduser);
        List<MenuSearchControl> GetMenusSearchControl(string lang, int idUser);
    }

    public class MenuHandler : IMenuHandler
    {
        private ILoggerManager _log;
        private readonly IMenuRepository _repository;
        public MenuHandler(IMenuRepository repository,
            ILoggerManager log)
        {
            _log = log;
            _repository = repository;
        }

        public List<MenusResult> GetMenusByIdUser(int iduser)
        {
            _log.LogInformation("MenuHandler: GetMenusByIdUser");
            var result = new List<MenusResult>();
            var menus = _repository.GetMenusByIdUser(iduser);
            
            foreach(var menu in menus)
            {
                result.Add(new MenusResult{ 
                    id = menu.ShortCut,
                    name = menu.Product == 1 ? menu.ShortCut + "." + menu.Screen : menu.ScreenName,
                    reportMenuLabel = menu.Menu,
                    reportMenuSlug = menu.Menu,
                    filters = null,
                    subMenu = null,
                    product = menu.Product == 1 ? true : false,
                    link = menu.Link
                });
            }

            return result;
        }

        public List<MenusResult> GetQualityMenusByIdUser(int iduser)
        {
            _log.LogInformation("MenuHandler: GetMenusByIdUser");
            var result = new List<MenusResult>();
            var menus = _repository.GetMenusByIdUser(iduser);

            foreach (var menu in menus)
            {
                result.Add(new MenusResult
                {
                    id = menu.ShortCut,
                    name = menu.Product == 1 ? menu.ShortCut + "." + menu.Screen : menu.ScreenName,
                    reportMenuLabel = menu.Menu,
                    reportMenuSlug = menu.Menu,
                    filters = null,
                    subMenu = null,
                    product = menu.Product == 1 ? true : false,
                    link = menu.Link
                });
            }

            return result;
        }

        public List<MenuSearchControl> GetMenusSearchControl(string lang, int idUser)
        {
            var lstLangs = new List<string>();
            lstLangs.Add("ptlocal");
            lstLangs.Add("enlocal");
            lstLangs.Add("eslocal");
            lstLangs.Add("gelocal");
            lstLangs.Add("hulocal");
            lstLangs.Add("filocal");
            lstLangs.Add("kolocal");
            lstLangs.Add("sclocal");

            bool b = lstLangs.Any(lang.Contains);
            //FORÇO PTLOCAL CASO IDIOMA INFORMADO NÃO ESTEJA NA LISTA
            if (!b)
                lang = "ptlocal";

            var menus = _repository.GetMenusSearchControl(lang, idUser);
            return menus;
        }
    }
}
