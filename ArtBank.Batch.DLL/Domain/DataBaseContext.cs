using ArtBank.Batch.BLL.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace ArtBank.Batch.DLL.Domain
{
    public class DataBaseContext : DbContext
    {
        public DataBaseContext(DbContextOptions<DataBaseContext> option)
            : base(option)
        {

        }

        public DbSet<Valute> Valutes { get; set; }
        public DbSet<BatchInfo> BatchInfos { get; set; }
    }
}
