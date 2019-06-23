using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace ArtBankCommon.Helpers
{
    public static class XmlParseHelper
    {
        public static T ParseXML<T>(this string @this) where T : class
        {
            try
            {
                using (TextReader reader = new StringReader(@this.Trim()))
                {
                    return (T)new XmlSerializer(typeof(T)).Deserialize(reader);
                }
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public static string Serialize<T>(this T value)
        {
            if (value == null)
                return string.Empty;

            try
            {
                var xmlSer = new XmlSerializer(typeof(T));
                var stringWriter = new StringWriter();
                using (var writer = XmlWriter.Create(stringWriter))
                {
                    xmlSer.Serialize(writer, value);
                    return stringWriter.ToString();
                }
            }
            catch (Exception ex)
            {
                return string.Empty;
            }
        }
    }
}
