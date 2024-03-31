using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TripAdvisor.Models
{
	public class Trip
	{
		public int Id { get; set; }
		public string Name { get; set; }
		public string Description { get; set; }
        public decimal Price { get; set; }
        public string PhotoPath { get; set; }
    }
}