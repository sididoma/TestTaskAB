using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ArtBank.Batch.DLL.Domain;
using ArtBank.Batch.DLL.Repository;
using ArtBank.Batch.BLL.Interfaces;
using ArtBank.Batch.BLL.Entities;
using ArtBank.Currencies.BLL.Interfaces;
using ArtBank.Currencies.BLL.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using ArtBank.Batch.BLL.Services;

namespace ArtBankWeb
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);

            services.AddDbContext<DataBaseContext>(c =>
            {
                try
                {
                    c.UseSqlServer(Configuration.GetConnectionString("ApplicationConnection"), x => x.MigrationsAssembly("ArtBank.Batch.DLL"));
                }
                catch (Exception ex)
                {

                }
            });

            services.AddScoped<ICurrencyService, CurrencyService>();
            services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
            services.AddScoped<IBatchService, BatchService>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseMvc();
        }
    }
}
