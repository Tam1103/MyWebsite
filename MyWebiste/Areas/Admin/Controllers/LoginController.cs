using System.Linq;
using System.Security.Claims;
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

        [Route("logout")]
        public IActionResult LogOut()
        {
            securityManager.SignOut(this.HttpContext);
            return RedirectToAction("index", "login", new { area = "admin" });
        }

        [HttpGet]
        [Route("register")]
        public IActionResult Register()
        {
            return View("Register");
        }


        [HttpPost]
        [Route("register")]
        public IActionResult Regester(Account account)
        {
            var eaccount = db.Accounts.All(a => a.Email != account.Email && a.Username != account.Username);
            if (!eaccount)
            {
                ViewBag.notice = "your email or username registered";
                return View("Register");
            }
            account.Password = BCrypt.Net.BCrypt.HashPassword(account.Password);
            account.Status = true;
            db.Accounts.Add(account);
            db.SaveChanges();

            var roleAccount = new RoleAccount();
            roleAccount.RoleId = 2;
            roleAccount.AccountId = account.Id;
            roleAccount.Status = true;
            db.RoleAccounts.Add(roleAccount);
            ViewBag.notice = "Register Successful";
            db.SaveChanges();
            return View("Register");
        }

        [HttpGet]
        [Route("resetpassword/{id}")]
        public IActionResult ResetPassword(int id)
        {
            var account = db.Accounts.Find(id);
            return View("ResetPassword", account);
        }

        [HttpPost]
        [Route("resetpassword/{id}")]
        public IActionResult ResetPassword(int id, Account account)
        {
            var currentAccount = db.Accounts.Find(id);
            if (!string.IsNullOrEmpty(account.Password))
            {
                currentAccount.Password = BCrypt.Net.BCrypt.HashPassword(account.Password);
            }
            ViewBag.msg = "Reset password successful";

            db.SaveChanges();
            return View("ResetPassword");
        }

        [HttpGet]
        [Route("forgotpassword")]
        public IActionResult ForgotPassword()
        {
            return View("ForgotPassword");
        }

        [HttpPost]
        [Route("forgotpassword")]
        public IActionResult ForgotPassword(Account account)
        {
            var currentAccount = db.Accounts.FirstOrDefault(a => a.Email == account.Email);
            if (currentAccount == null)
            {
                ViewBag.error = "Invalid Account";
                return View("forgotpassword");
            }
            else
            {
                return RedirectToAction("resetpassword", "login", new { area = "admin", id = currentAccount.Id });
            }
        }

         [HttpGet]
        [Route("profile")]
        public IActionResult Profile()
        {
            var user = User.FindFirst(ClaimTypes.Name);
            var username = user.Value;
            var account = db.Accounts.SingleOrDefault(a => a.Username.Equals(username));
            return View("Profile", account);
        }

        [HttpPost]
        [Route("profile")]
        public IActionResult Profile(Account account)
        {
            var currentAccount = db.Accounts.SingleOrDefault(a => a.Id.Equals(account.Id));
            if (!string.IsNullOrEmpty(account.Password))
            {
                currentAccount.Password = BCrypt.Net.BCrypt.HashPassword(account.Password);
            }
            currentAccount.Username = account.Username;
            currentAccount.Email = account.Email;
            currentAccount.FullName = account.FullName;
            currentAccount.Status = account.Status;

            ViewBag.msg = "Update successful";

            db.SaveChanges();
            return View("Profile");
        }

        [Route("accessdenied")]
        public IActionResult AccessDenied()
        {
            return View("AccessDenied");
        }

    }
}