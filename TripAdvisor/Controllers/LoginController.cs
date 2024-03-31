using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using TripAdvisor.Models;

namespace TripAdvisor.Controllers
{
	public class LoginController
	{
		string key = "AIzaSyDekydHLw2t3lwDS-KZM1WJ1LuvaUckLlI";

		public FirebaseUser FirebaseAuth(FirebaseUser user)
		{

			string url = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" + key;
			string body = "{'email':'" + user.email + "','password':'" + user.password + "','returnSecureToken':true}";

			HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
			request.Method = "POST";
			request.ContentType = "application/json";

			using (Stream dataStream = request.GetRequestStream())
			{
				dataStream.Write(Encoding.UTF8.GetBytes(body), 0, Encoding.UTF8.GetBytes(body).Length);
			}

			try
			{
				HttpWebResponse response = request.GetResponse() as HttpWebResponse;
				using (StreamReader reader = new StreamReader(response.GetResponseStream()))
				{
					return JsonConvert.DeserializeObject<FirebaseUser>(reader.ReadToEnd());
				}
			}
			catch
			{
				return null;
			}
		}

		public bool FirebaseSigUp(FirebaseUser user)
		{
			string url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=" + key;
			string body = "{'email':'" + user.email + "','password':'" + user.password + "','returnSecureToken':true, 'displayName': '" + user.displayName + "'}";

			HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
			request.Method = "POST";
			request.ContentType = "application/json";

			using (Stream dataStream = request.GetRequestStream())
			{
				dataStream.Write(Encoding.UTF8.GetBytes(body), 0, Encoding.UTF8.GetBytes(body).Length);
			}

			try
			{
				HttpWebResponse response = request.GetResponse() as HttpWebResponse;
				using (StreamReader reader = new StreamReader(response.GetResponseStream()))
				{
					FirebaseUser payload = JsonConvert.DeserializeObject<FirebaseUser>(reader.ReadToEnd());

					return true;
				}
			}
			catch
			{
				return false;
			}
		}
	}
}