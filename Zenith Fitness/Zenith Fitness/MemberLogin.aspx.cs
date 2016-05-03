﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Zenith_Fitness
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string user = tbxUser.Text;
            string pwd = tbxPwd.Text;
            int mem_id;
            bool userFound = false;

            Validate("Login");
            if (Page.IsValid)
            {
                try
                {
                    using (SqlConnection userLogin = new SqlConnection(SqlDataSource1.ConnectionString))
                    {
                        userLogin.Open();

                        // Verify that the Username and Password exist [Exact]
                        using (SqlCommand checkUser = new SqlCommand("Select count(*) from [dbo].Member where member_username='" + user + "'" +
                            "AND member_password='" + pwd + "'" + " COLLATE SQL_Latin1_General_CP1_CS_AS", userLogin))
                        {
                            checkUser.Parameters.AddWithValue("@Username", user);
                            checkUser.Parameters.AddWithValue("@Password", pwd);

                            userFound = ((int)checkUser.ExecuteScalar() > 0);
                        }

                        if (userFound) 
                        {
                            Session["Username"] = user;
                            Response.Redirect("MemberAccount.aspx");
                        }
                        else
                        {
                            lblEx.Text = "Invalid username and/or password";
                            lblEx.Visible = true;
                        }

                        userLogin.Close();
                    }
                }

                catch (Exception ex)
                {
                    lblEx.Text = ex.Message;
                    lblEx.Visible = true;
                }

                finally
                {
                    using (SqlConnection getUser = new SqlConnection(SqlDataSource1.ConnectionString))
                    {
                        getUser.Open();
                        using (SqlCommand getID = new SqlCommand("Select member_id from dbo.[Member] where member_username = '" + user + "'", getUser))
                        {
                            mem_id = Convert.ToInt32(getID.ExecuteScalar());
                        }
                        getUser.Close();
                    }

                    Session["mem_id"] = mem_id;
                }

            }
        }
    }
}