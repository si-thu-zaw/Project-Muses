<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddComment.aspx.cs" MasterPageFile="~/Site.master" Inherits="AddComment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <h1>Add a comment</h1>
    <p>
        &nbsp; Comment:
        <asp:TextBox ID="TextBox1" runat="server" Width="700px"></asp:TextBox>
    </p>
    <p>
        &nbsp;&nbsp;Video:&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="V_Name" DataValueField="V_ID" Width="372px"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMDBConnectionString %>" SelectCommand="SELECT * FROM [Video]"></asp:SqlDataSource>
    </p>
    </br>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit Comment" />
</asp:Content>