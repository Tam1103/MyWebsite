using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyWebiste.Models
{
    [Table("SlideShow")]
    public class SlideShow
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
        public string UptoSale { get; set; }
        public string Description { get; set; }
        public bool Status { get; set; }
    }
}
