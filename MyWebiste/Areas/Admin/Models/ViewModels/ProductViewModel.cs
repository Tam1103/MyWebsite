using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using MyWebiste.Models;

namespace MyWebsite.Areas.Admin.Models.ViewModels
{
    public class ProductViewModel
    {
        public Product Product { get; set; }
        public List<SelectListItem> Categories { get; set; }
    }
}
