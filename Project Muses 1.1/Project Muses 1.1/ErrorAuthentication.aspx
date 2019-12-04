<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorAuthentication.aspx.cs" Inherits="Error_Authentication" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Assets/login.png" Height="304px" Width="327px" />
    <h1>You must be logged in to be able to access this function.</h1>
    </br>
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Register.aspx">Click here to register for your own free account!</asp:LinkButton>
    <br />
    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Login.aspx">If you already have an account, click here to log in.</asp:LinkButton>
</asp:Content>
