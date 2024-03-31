using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TripAdvisor.Views;

namespace TripAdvisor.Models
{
	public class Booked : Trip
	{
        public int BookedId { get; set; }        	
		public string Email { get; set; }
		public string Checkin { get; set; }
		public string Checkout { get; set; }
		public int Adults { get; set; }
		public string BookedHour { get; set; }
		public decimal Total {  get; set; } 		
		public DateTime Created { get; set; }
	}
}