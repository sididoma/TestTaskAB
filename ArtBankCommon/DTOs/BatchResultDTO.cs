using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace ArtBankCommon.DTOs
{
    public class BatchResultDTO
    {
        public MemoryStream MemStream { get; set; }
        public string ContentType { get; set; }
        public string FileName { get; set; }
    }
}
