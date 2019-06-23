using ArtBankCommon.DTOs;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace ArtBank.Batch.BLL.Interfaces
{
    public interface IBatchService
    {
        BatchResultDTO GetBatch();
    }
}
