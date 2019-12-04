using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Upload : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["PMDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated) { }
            else {
            Response.Redirect("~/ErrorAuthentication.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("SaveVideo"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Video", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@category", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@user", Session["UserID"]);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
    }
}