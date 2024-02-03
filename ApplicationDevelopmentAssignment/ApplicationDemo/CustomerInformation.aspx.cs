using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ApplicationDevelopmentAssignment.ApplicationDemo
{
    public partial class CustomerInformation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void modal_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "OpenModalScript", "$('#mymodal').modal('show');", true);
        }
        protected void btnsave_Click(object sender, EventArgs e)
        {
            string connectionstring = ConfigurationManager.ConnectionStrings["Application"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                conn.Open();
                SqlCommand cmd;
                if (!string.IsNullOrEmpty(hdid.Value))
                {
                    string id = hdid.Value;
                    cmd = new SqlCommand("UPDATE CustomerInformation_Application SET [First Name]=@FirstName, [Last Name]=@LastName, [Middle Initial]=@MiddleInitial," +
                        " Age=@Age, [Contact Number]=@ContactNumber, [Address]=@Address WHERE CustomerID=@CustomerID", conn);
                    cmd.Parameters.AddWithValue("@CustomerID", id);
                }
                else
                {
                    cmd = new SqlCommand("INSERT INTO CustomerInformation_Application ([First Name],[Last Name],[Middle Initial],Age,[Contact Number],[Address])" +
                    " VALUES(@FirstName,@LastName,@MiddleInitial,@Age,@ContactNumber,@Address)", conn);
                }
                cmd.Parameters.AddWithValue("@FirstName", txtfname.Text);
                cmd.Parameters.AddWithValue("@LastName", txtlname.Text);
                cmd.Parameters.AddWithValue("@MiddleInitial", txtminitial.Text);
                cmd.Parameters.AddWithValue("@Age", txtage.Text);
                cmd.Parameters.AddWithValue("@ContactNumber", txtcontact.Text);
                cmd.Parameters.AddWithValue("@Address", txtaddress.Text);
                int rowsaffected = cmd.ExecuteNonQuery();
                conn.Close();
                if (rowsaffected > 0)
                {
                    lblmsg.Text = "Information Added Successfully";
                }
                else
                {
                    lblmsg.Text = "Error!";
                }
                string script = "$('#mymodal').modal('show');";
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", script, true);
                rptr1.DataBind();
            }
        }

        protected void btnupdate_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            hdid.Value = id;
            string connectionstring = ConfigurationManager.ConnectionStrings["Application"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select * from CustomerInformation_Application where CustomerID=@CustomerID", conn);
                cmd.Parameters.AddWithValue("@CustomerID", id);
                SqlDataReader dataReader = cmd.ExecuteReader();
                if (dataReader.Read())
                {
                    txtfname.Text = dataReader["First Name"].ToString();
                    txtlname.Text = dataReader["Last Name"].ToString();
                    txtminitial.Text = dataReader["Middle Initial"].ToString();
                    txtage.Text = dataReader["Age"].ToString();
                    txtcontact.Text = dataReader["Contact Number"].ToString();
                    txtaddress.Text = dataReader["Address"].ToString();
                }
                dataReader.Close();
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "OpenModalScript", "$('#mymodal').modal('show');", true);
        }

        protected void btndlt_Command(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();
            string connectionstring = ConfigurationManager.ConnectionStrings["Application"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionstring))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("delete from CustomerInformation_Application where CustomerID=@CustomerID", conn);
                cmd.Parameters.AddWithValue("@CustomerID", id);
                cmd.ExecuteNonQuery();
            }
            rptr1.DataBind();
        }
    }
}