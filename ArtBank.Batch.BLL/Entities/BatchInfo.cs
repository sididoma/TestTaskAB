using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace ArtBank.Batch.BLL.Entities
{
    public class BatchInfo
    {
        [Key]
        public int Id { get; set; }
        public int RequestCounter { get; set; }
        public DateTime RequestedDate { get; set; }
    }
}
