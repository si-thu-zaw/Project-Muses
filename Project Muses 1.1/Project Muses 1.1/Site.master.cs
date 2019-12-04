using System.ComponentModel.DataAnnotations;
using System.Web.DynamicData;
using System.Web.UI.WebControls;

public partial class Site : System.Web.UI.MasterPage {

    protected void Page_Load(object sender, System.EventArgs e)
    {

    }

    protected void TextBox1_TextChanged(object sender, System.EventArgs e)
    {
        var t = TextBox1.Text.Trim();
        Response.Redirect("~/Search.aspx?V_Name=" + t);
    }

    protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Session.Abandon();
    }
}
