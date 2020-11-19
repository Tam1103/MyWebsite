using System.Linq;
using Microsoft.AspNetCore.Mvc;
using MyWebiste.Models;
using MyWebiste.Security;

namespace MyWebiste.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin/login")]
    public class LoginController : Controller
    {
        private readonly DatabaseContext db;
        private readonly SecurityManager securityManager;

        public LoginController(DatabaseContext _db)
        {
            db = _db;
            securityManager = new SecurityManager();
        }
        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            return View();
        }


        [HttpPost]
        [Route("process")]
        public IActionResult Process(string username, string password)
        {
            var account = ProcessLogin(username, password);
            if (account != null)
            {
                securityManager.SignIn(this.HttpContext, account);
                return RedirectToAction("index", "dashboard", new { area = "admin" });
            }
            else
            {
                ViewBag.error = "Invalid Account";
                return View("Index");
            }
        }

        private Account ProcessLogin(string username, string password)
        {
            var account = db.Accounts.SingleOrDefault(a => a.Username.Equals(username) && a.Status == true);
            if (account != null)
            {
                var accounts = db.RoleAccounts.FirstOrDefault(r => r.AccountId == account.Id);
                if(accounts != null)
                {
                    if (BCrypt.Net.BCrypt.Verify(password, account.Password) && accounts.RoleId == 1)
                    {
                        return account;
                    }
                }
            }
            return null;
        }

        [Route("signout")]
        public IActionResult SignOut()
        {
            securityManager.SignOut(this.HttpContext);
            return RedirectToAction("index", "login", new { area = "admin" });
        }

        [Route("accessdenied")]
        public IActionResult AccessDenied()
        {
            return View("AccessDenied");
        }
    }
}