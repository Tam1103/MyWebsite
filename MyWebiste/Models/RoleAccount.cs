using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyWebiste.Models
{
    [Table("RoleAccount")]
    public class RoleAccount
    {
        [Key]
        public int RoleId { get; set; }

        [Key]
        public int AccountId { get; set; }

        public bool Status { get; set; }

        public virtual Account Account { get; set; }

        public virtual Role Role { get; set; }

    }
}
