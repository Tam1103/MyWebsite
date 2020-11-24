using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyWebiste.Models;
using System.Linq;

namespace MyWebiste.Controllers
{
    [Route("home")]
    public class HomeController : Controller
    {
        private readonly DatabaseContext _context;
        public HomeController(DatabaseContext context)
        {
            _context = context;
        }

        [Route("")]
        [Route("index")]
        [Route("~/")]
        public IActionResult Index()
        {
            var product = _context.Products.OrderByDescending(p => p.Id).Where(p => p.Status).Take(4).ToList();
            ViewBag.featureProduct = _context.Photos.Where(p => p.Featured && p.Product.Featured && p.Product.Status).Include(p => p.Product).Take(4);
            return View("Index", product);
        }

        [Route("error")]
        public IActionResult Error()
        {
            return View();
        }
    }
}
