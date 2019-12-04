using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddComment : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["PMDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated) { }
        else
        {
            Response.Redirect("~/ErrorAuthentication.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int video = Convert.ToInt32(Session["tempvideo"]);
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("AddComment"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@video", video);
                    cmd.Parameters.AddWithValue("@comment", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@user", Session["UserID"]);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Comment Inserted Successfully')", true);
    }
}