using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.DynamicData;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.Expressions;

public partial class Edit : System.Web.UI.Page {
    protected MetaTable table;
    string constr = ConfigurationManager.ConnectionStrings["PMDBConnectionString"].ConnectionString;
    protected void Page_Init(object sender, EventArgs e) {
        table = DynamicDataRouteHandler.GetRequestMetaTable(Context);
        FormView1.SetMetaTable(table);
        DetailsDataSource.EntityTypeName = table.EntityType.AssemblyQualifiedName;
    }

    protected void Page_Load(object sender, EventArgs e) {
        Title = table.DisplayName;
        int role = Convert.ToInt32(Session["UserRole"]);

        int owner = 0;
        int comment = Convert.ToInt32(Request.QueryString["CM_ID"]);
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("GetCommentOwner"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ID", comment);
                    cmd.Connection = con;
                    con.Open();
                    owner = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
            }
        }
        int user = Convert.ToInt32(Session["UserID"]);
        if (role != 2)
        {
            if (owner != user)
            {
                Response.Redirect("~/ErrorAuthorisation.aspx");
            }
        }
    }

    protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e) {
        if (e.CommandName == DataControlCommands.CancelCommandName) {
            Response.Redirect(table.ListActionPath);
        }
    }

    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e) {
        if (e.Exception == null || e.ExceptionHandled) {
            Response.Redirect(table.ListActionPath);
        }
    }

}
