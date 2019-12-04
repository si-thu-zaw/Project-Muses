<%@ Page Language="C#"  AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <asp:Login ID="LoginBox" Width="1042px" Font-Size="X-Large" runat="server" OnAuthenticate="LoginBox_Authenticate" Height="331px"></asp:Login>
    </br>
    <a href="Register.aspx">Don't have an account on Project:Muses yet? Click here to register for your very own account!</a>
</asp:Content>



