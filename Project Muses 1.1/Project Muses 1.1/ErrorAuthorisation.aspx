<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorAuthorisation.aspx.cs" Inherits="Error_Authentication" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Assets/authorization.png" Height="304px" Width="327px" />
    <h1>You are not authorised to access this page.</h1>
    </br>
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Default.aspx">Click here to go back to home page</asp:LinkButton>
</asp:Content>
