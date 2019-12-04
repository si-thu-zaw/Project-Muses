using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Configuration;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;
using System.Data.SqlClient;
using System.Data;

public partial class Details : System.Web.UI.Page {
    protected MetaTable table;
        
    protected void Page_Init(object sender, EventArgs e) {
        table = DynamicDataRouteHandler.GetRequestMetaTable(Context);
        FormView1.SetMetaTable(table);
        DetailsDataSource.EntityTypeName = table.EntityType.AssemblyQualifiedName;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        Title = table.DisplayName;
        string constr = ConfigurationManager.ConnectionStrings["PMDBConnectionString"].ConnectionString;
        int v = Convert.ToInt32(Request.QueryString["V_ID"]);
        int u = Convert.ToInt32(Session["UserID"]);
        if (u <= 0)
        {
            u = 1;
        }
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("AddView"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@video", v);
                cmd.Parameters.AddWithValue("@user", u);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery(); 
                con.Close();
            }
        }
    }
    protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e) {
        if (e.Exception == null || e.ExceptionHandled) {
            Response.Redirect(table.ListActionPath);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["PMDBConnectionString"].ConnectionString;
        int v = Convert.ToInt32(Request.QueryString["V_ID"]);
        int u = Convert.ToInt32(Session["UserID"]);
        if (u <= 1)
        {
            Response.Write(@"<script language='javascript'>alert('You are not allowed to add a like.');</script>");
        }
        else
        {
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("AddLike"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@v", v);
                    cmd.Parameters.AddWithValue("@u", u);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["tempvideo"] = Request.QueryString["V_ID"];
        Response.Redirect("~/AddComment.aspx");
    }
}
