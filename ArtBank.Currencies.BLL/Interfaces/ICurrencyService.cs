using System;
using System.Collections.Generic;
using System.Text;

namespace ArtBank.Currencies.BLL.Interfaces
{
    public interface ICurrencyService
    {
        string GetCurrency(string currencyCode);
    }
}
