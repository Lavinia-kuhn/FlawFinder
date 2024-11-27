using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Xml;
using System;
using System.Dynamic;
using System.Reflection;
using System.Linq;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IXmlFieldsHandler
    {
        List<object> XmlToObject(List<object> myData);
    }

    public class XmlFieldsHandler : IXmlFieldsHandler
    {
        private readonly IXmlFieldsRepository _xmlRepository;
        private ILoggerManager _log;

        public XmlFieldsHandler(IXmlFieldsRepository xmlRepository,
            ILoggerManager log)
        {
            _xmlRepository = xmlRepository;
            _log = log;
        }
        public List<object> XmlToObject(List<object> myData)
        {

            var result = new List<object>();
            foreach (var value in myData)
            {
                dynamic sampleObject = convertToExpando(value);

                var xmlField = value.GetType().GetProperty("XmlField").GetValue(value, null);

                if (xmlField != null)
                {
                    XmlDocument xml = new XmlDocument();
                    xml.LoadXml((string)xmlField);
                    XmlNode node = xml.SelectSingleNode("fields");


                    foreach (XmlNode item in node)
                    {
                        AddProperty(sampleObject, item.Name, item.InnerXml);
                    }
                }


                result.Add(sampleObject);

            }


            return result;
        }


        public static ExpandoObject convertToExpando(object obj)
        {
            BindingFlags flags = BindingFlags.Public | BindingFlags.Instance;
            PropertyInfo[] properties = obj.GetType().GetProperties(flags);


            ExpandoObject expando = new ExpandoObject();
            foreach (PropertyInfo property in properties)
            {
                AddProperty(expando, property.Name, property.GetValue(obj));
            }

            return expando;
        }

        public static void AddProperty(ExpandoObject expando, string propertyName, object propertyValue)
        {

            var expandoDict = expando as IDictionary<String, object>;
            if (expandoDict.ContainsKey(propertyName))
                expandoDict[propertyName] = propertyValue;
            else
                expandoDict.Add(propertyName, propertyValue);
        }
    }
}
