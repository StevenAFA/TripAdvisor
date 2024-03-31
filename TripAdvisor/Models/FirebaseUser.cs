using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TripAdvisor.Models
{
	public class FirebaseUser
	{
		public string idToken { get; set; }
		public string email { get; set; }
		public string password { get; set; }
		public string displayName {  get; set; }
		public string refreshToken { get; set; }
		public string expiresIn { get; set; }
		public string localId { get; set; }
		public bool registered { get; set; }
	}
}