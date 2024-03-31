using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TripAdvisor.Controllers;
using TripAdvisor.Models;

namespace TripAdvisor.Views
{
	public partial class tripDetail : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["session"] != null)
			{
				FirebaseUser user = (FirebaseUser)Session["session"];

				UserNameIfLogged.InnerText = "Welcome " + user.displayName;

				int id = Convert.ToInt16(Request.QueryString["id"]);

				TripController tripController = new TripController();

				List<Trip> tripList = tripController.GetTrip(id);

				tripPrice.InnerText = tripList[0].Price.ToString();

				repTrip.DataSource = tripList;
				repTrip.DataBind();
			}
			else
			{
				Response.Redirect("main.aspx");
			}
		}

		protected void btnSaveBooked_ServerClick(object sender, EventArgs e)
		{
			try
			{
				BookedController bookedController = new BookedController();

				FirebaseUser user = (FirebaseUser)Session["session"];

				Booked booked = new Booked
				{
					Id = Convert.ToInt16(Request.QueryString["id"]),
					Email = user.email,
					Checkin = dtCheckin.Value,
					Checkout = dtCheckOut.Value,
					Adults = Convert.ToInt16(selectAdults.Value),
					BookedHour = "9:30 am",
					Total = Convert.ToDecimal(tripPrice.InnerText) * Convert.ToInt16(selectAdults.Value)
				};

				bookedController.SaveBooked(booked);

				ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your trip was saved successfully')", true);
			}
			catch (Exception ex)
			{
				alertError.InnerText = ex.Message;
				alertError.Attributes.Remove("hidden");
			}
		}
	}
}