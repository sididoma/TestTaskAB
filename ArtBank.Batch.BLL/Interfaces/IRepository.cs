using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ArtBank.Batch.BLL.Interfaces
{
    public interface IRepository<T> where T : class
    {
        IQueryable<T> ListAll();
        T GetRecord(int id);
        T Add(T model);
        T Update(T model);
    }
}
