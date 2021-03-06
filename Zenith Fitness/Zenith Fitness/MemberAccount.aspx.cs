﻿using System;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace Zenith_Fitness
{
    public partial class WebForm16 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore();
            if (Session["Username"] == null)
                Response.Redirect("MemberLogin.aspx");

            currentUser.Text = Session["Username"].ToString();
            var memId = int.Parse(Session["mem_id"].ToString());
            const string cmd = "SELECT [member_id], [membership_name] ,[membership_status], [membership_start], [membership_end] FROM[dbo].[Membership] WHERE [member_id] = @memID;";

            using (var userAcct = new SqlConnection(SqlDataSource1.ConnectionString))
            {
                userAcct.Open();
                using (var checkUser = new SqlCommand(cmd, userAcct))
                {
                    checkUser.Parameters.AddWithValue("@memID", memId);
                    var reader = checkUser.ExecuteReader();
                    while (reader.Read())
                    {
                        lblPlan.Text = reader["membership_name"].ToString();
                        lblStatus.Text = reader["membership_status"].ToString();
                        lblStart.Text = reader["membership_start"].ToString();
                        lblEnd.Text = reader["membership_end"].ToString();
                    }
                }
            }
        }

        protected void LbSignout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("MemberLogin.aspx");
        }
    }
}