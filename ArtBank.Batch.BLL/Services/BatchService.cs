using ArtBank.Batch.BLL.Entities;
using ArtBank.Batch.BLL.Interfaces;
using ArtBankCommon.DTOs;
using ArtBankCommon.Helpers;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace ArtBank.Batch.BLL.Services
{
    public class BatchService : IBatchService
    {
        private readonly IRepository<BatchInfo> _infoRepo;
        private readonly IRepository<Valute> _valuteRepo;

        public BatchService(IRepository<BatchInfo> infoRepo, IRepository<Valute> valuteRepo)
        {
            _infoRepo = infoRepo;
            _valuteRepo = valuteRepo;
        }

        public BatchResultDTO GetBatch()
        {
            var info = _infoRepo.ListAll().Where(x => x.RequestedDate.Date == DateTime.Now.Date).FirstOrDefault();
            string fileName = string.Empty;
            if (info == null)
            {
                info = new BatchInfo
                {
                    RequestCounter = 1,
                    RequestedDate = DateTime.Now.Date
                };
                _infoRepo.Add(info);
            }

            fileName = $"BANK_{string.Format("{0:yyyyMMdd}", DateTime.Now)}_{info.RequestCounter}.xml";

            ++info.RequestCounter;

            _infoRepo.Update(info);

            var valutes = _valuteRepo.ListAll();

            var resultString = valutes.ToArray().Serialize();

            byte[] bytes = Encoding.Default.GetBytes(resultString);
            var content = new MemoryStream(bytes);
            var contentType = "application/xml";

            return new BatchResultDTO { MemStream = content, ContentType = contentType, FileName = fileName };
        }
    }
}
