using PCFactoryManagementView.Domain.PcfactoryContext.Enums;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Enums
{
    public enum EIcons
    {
        // The icons must be the same as the one that exists in ng-zorro-antd
        // https://ng.ant.design/components/icon/en
        Warning,
    }

    public static class EIconsExtensions
    {
        public static string ToIconString(this EIcons icon)
        {
            return icon switch
            {
                EIcons.Warning => "warning",
                _ => throw new System.NotImplementedException(),
            };
        }
    }
}