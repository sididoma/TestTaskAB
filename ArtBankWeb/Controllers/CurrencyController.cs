using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ArtBank.Currencies.BLL.Interfaces;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ArtBankWeb.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CurrencyController : ControllerBase
    {
        private readonly ICurrencyService _service;

        public CurrencyController(ICurrencyService service)
        {
            _service = service;
        }

        [HttpGet]
        public ActionResult<string> Get(string currencyCode)
        {
            var result = _service.GetCurrency(currencyCode);

            return result;
        }
    }
}