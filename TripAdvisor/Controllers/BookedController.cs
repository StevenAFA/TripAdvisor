using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using TripAdvisor.Models;

namespace TripAdvisor.Controllers
{
	public class BookedController
	{
		public void SaveBooked(Booked booked)
		{
			try
			{
				DatabaseHelper.Database database = new DatabaseHelper.Database();

				database.SaveBooked(booked);
			}
			catch (Exception ex)
			{
				throw ex;
			}			
		}

		public void DeleteBooked(int bookedId)
		{
			DatabaseHelper.Database database = new DatabaseHelper.Database();

			database.DeleteBooked(bookedId);
		}

		public List<Booked> GetBooked(string email)
		{
			List<Booked> bookedList = new List<Booked>();

			DatabaseHelper.Database database = new DatabaseHelper.Database();

			DataTable dsBooked = database.GetBooked(email);												 

			foreach (DataRow dr in dsBooked.Rows)
			{
				bookedList.Add(new Booked
				{							
					BookedId = (int)dr["bookedId"],
					Id = (int)dr["tripId"],
					Name = dr["name"].ToString(),
					PhotoPath = dr["photoPath"].ToString(),
					Checkin = Convert.ToDateTime(dr["checkin"]).ToShortDateString(),
					Checkout = Convert.ToDateTime(dr["checkout"]).ToShortDateString(),
					Adults = (int)dr["adults"],					
					Total = (decimal)dr["total"],
					BookedHour = dr["bookedHour"].ToString(),
					Created = Convert.ToDateTime(dr["created"]),
				});
			}

			return bookedList;
		}		
	}
}