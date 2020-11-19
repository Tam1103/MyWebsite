using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyWebiste.Models
{
    [Table("Photo")]
    public class Photo
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public bool Featured { get; set; }
        public int ProductId { get; set; }
        public virtual Product Product { get; set; }
    }
}
