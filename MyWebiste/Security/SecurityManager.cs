using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using MyWebiste.Models;

namespace MyWebiste.Security
{
    public class SecurityManager
    {
        public string CookieAuthen { get; private set; }

        public async void SignIn(HttpContext httpcontext, Account account)
        {
            ClaimsIdentity claimsIdentity = new ClaimsIdentity(GetUserClaims(account),
                CookieAuthenticationDefaults.AuthenticationScheme);

            ClaimsPrincipal claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
            await httpcontext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, claimsPrincipal);
        }


        public async void SignOut(HttpContext htttpContext)
        {
            await htttpContext.SignOutAsync();
        }


        private IEnumerable<Claim> GetUserClaims(Account account)
        {
            List<Claim> claims = new List<Claim>();
            claims.Add(new Claim(ClaimTypes.Name, account.FullName));

            account.RoleAccounts.ToList().ForEach(ra =>
            {
                claims.Add(new Claim(ClaimTypes.Role, ra.Role.Name));
            });
            return claims;
        }
    }
}
