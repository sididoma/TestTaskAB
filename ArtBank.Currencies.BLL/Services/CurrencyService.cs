using ArtBank.Currencies.BLL.Interfaces;
using ArtBankCommon.Helpers;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;

namespace ArtBank.Currencies.BLL.Services
{
    public class CurrencyService : ICurrencyService
    {
        private const string _url = "http://www.cbr.ru/scripts/XML_daily.asp";
        public string GetCurrency(string currencyCode)
        {
            var cur = GetResponseObject(currencyCode);

            if (cur != null)
                return cur.Value;

            return "Not found";
        }

        private CBRValute GetResponseObject(string currencyCode)
        {
            string responseXML = GetCurrentCurrencies();

            if (responseXML == null || responseXML.Length < 1)
                return null;

            CBRResponse responseObj = responseXML.ParseXML<CBRResponse>();

            foreach (var cur in responseObj.Valute)
            {
                if (cur.ID == currencyCode)
                    return cur;
            }
            return null;
        }

        private string GetCurrentCurrencies()
        {
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(_url);
                request.Method = "GET";

                var responseStream = (HttpWebResponse)request.GetResponse();
                var responseString = string.Empty;

                using (StreamReader reader = new StreamReader(responseStream.GetResponseStream()))
                {
                    responseString = reader.ReadToEnd();
                }

                return responseString;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
