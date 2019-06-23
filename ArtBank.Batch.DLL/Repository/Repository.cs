using ArtBank.Batch.BLL.Interfaces;
using ArtBank.Batch.DLL.Domain;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ArtBank.Batch.DLL.Repository
{
    public class Repository<T> : IRepository<T> where T : class
    {
        private readonly DataBaseContext _dbContext;

        public Repository(DataBaseContext context)
        {
            _dbContext = context;
        }

        public T GetRecord(int id)
        {
            try
            {
                return _dbContext.Set<T>().Find(id);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public IQueryable<T> ListAll()
        {
            try
            {
                return _dbContext.Set<T>().AsQueryable();
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public T Add(T entity)
        {
            try
            {
                _dbContext.Add(entity);
                _dbContext.SaveChanges();
                return entity;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public T Update(T entity)
        {
            try
            {
                var entry = _dbContext.Entry(entity);
                entry.State = EntityState.Modified;
                _dbContext.SaveChanges();

                return entity;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
