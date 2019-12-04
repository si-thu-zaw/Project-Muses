<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1>Search Results</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="V_ID" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
            <Columns>
                <asp:ButtonField Text="Watch" ButtonType="Button" CommandName="directvideo"/>
                <asp:BoundField DataField="V_ID" HeaderText="Video ID" InsertVisible="False" ReadOnly="True" SortExpression="V_ID" />
                <asp:BoundField DataField="V_Name" HeaderText="Video Name" SortExpression="V_Name" />
                <asp:BoundField DataField="V_Desc" HeaderText="Description" SortExpression="V_Desc" />
                <asp:BoundField DataField="V_Date" HeaderText="Upload Date" SortExpression="V_Date" />
                <asp:BoundField DataField="V_Cat" HeaderText="Category" SortExpression="V_Cat" />
                <asp:BoundField DataField="V_User" HeaderText="User" SortExpression="V_User" />
            </Columns>
            <EmptyDataTemplate>
                The search term did not return any results.
            </EmptyDataTemplate>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMDBConnectionString %>" SelectCommand="SELECT * FROM [Video] WHERE ([V_Name] LIKE '%' + @V_Name + '%')">
        <SelectParameters>
            <asp:QueryStringParameter Name="V_Name" QueryStringField="V_Name" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

