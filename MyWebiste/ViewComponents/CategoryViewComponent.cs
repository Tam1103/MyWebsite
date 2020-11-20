﻿using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MyWebiste.Models;

namespace MyWebiste.ViewComponents
{
    [ViewComponent(Name = "Category")]
    public class CategoryViewComponent: ViewComponent
    {
        private DatabaseContext db;
        public CategoryViewComponent(DatabaseContext _db)
        {
            db = _db;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            List<Category> categories = db.Categories.Where(c => c.Parent == null && c.Status).ToList();
            return View("Index",categories);
        } 
    }
}
