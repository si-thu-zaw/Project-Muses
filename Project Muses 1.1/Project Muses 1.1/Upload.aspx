<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="Upload.aspx.cs" Inherits="Upload" MasterPageFile="~/Site.master"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <h1>Upload New Video</h1>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
        Video Name:
    <asp:TextBox ID="TextBox1" runat="server" Width="399px"></asp:TextBox>
    </p>
    <p>
        &nbsp;
        Video Description:
    <asp:TextBox ID="TextBox2" runat="server" Width="399px"></asp:TextBox>
    </p>
    <p>
        &nbsp;&nbsp;
        Video Embed Link:
    <asp:TextBox ID="TextBox3" runat="server" Width="399px"></asp:TextBox>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;
        Video Category:
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="C_Name" DataValueField="C_ID"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMDBConnectionString %>" SelectCommand="SELECT [C_Name], [C_ID] FROM [Category]"></asp:SqlDataSource>
    </p>
    </br>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" />
</asp:Content>
