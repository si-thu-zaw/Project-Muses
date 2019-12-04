using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LoginBox_Authenticate(object sender, AuthenticateEventArgs e)
    {
        int userId = 0;
        int userrole = 0;
        string constr = ConfigurationManager.ConnectionStrings["PMDBConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Validate_User1"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Username", LoginBox.UserName);
                cmd.Parameters.AddWithValue("@Password", LoginBox.Password);
                cmd.Connection = con;
                con.Open();
                userId = Convert.ToInt32(cmd.ExecuteScalar());
                Session["UserID"] = userId;
                con.Close();
            }
            using (SqlCommand cmd = new SqlCommand("GetRole"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@ID", userId);
                cmd.Connection = con;
                con.Open();
                userrole = Convert.ToInt32(cmd.ExecuteScalar());
                Session["UserRole"] = userrole;
                con.Close();
            }
            switch (userId)
            {
                    case -1:
                        LoginBox.FailureText = "Username and/or password is incorrect.";
                        break;
                    case -2:
                        LoginBox.FailureText = "Account not exists.";
                        break;
                    default:
                        System.Web.Security.FormsAuthentication.RedirectFromLoginPage(LoginBox.UserName, LoginBox.RememberMeSet);
                        break;
                }
        }
        
    }
}