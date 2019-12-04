<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="slider">
        <!-- Slippy Slider -->
        <script src="Scripts/slippry.min.js"></script>
        <link rel="stylesheet" href="CSS/slippry.css" />
        <ul id="slippry-slider">
            <li>
                <a style="z-index: -1;" href="/Videos/List.aspx?V_Cat=8">
                    <img src="Assets/s1.jpg" alt="3D Printing"></a>
            </li>
            <li>
                <a href="/Videos/List.aspx?V_Cat=4">
                    <img src="Assets/s2.jpg" alt="Cooking"></a>
            </li>
            <li>
                <a href="/Videos/List.aspx?V_Cat=2">
                    <img src="Assets/s3.jpeg" alt="Arts and Craft"></a>
            </li>
        </ul>
        <script>
            jQuery("#slippry-slider").slippry();
        </script>
    </div>
    <br />
    <h2>Recently Uploaded Videos</h2>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="LinqDataSource1">
        <AlternatingItemTemplate>
            <td runat="server" style="background-color: #FFFFFF; color: #284775;">Video Name:
                <asp:Label ID="V_NameLabel" runat="server" Text='<%# Eval("V_Name") %>' />
                <br />
                Upload Date:
                <asp:Label ID="V_DateLabel" runat="server" Text='<%# Eval("V_Date") %>' />
                <br />
                Category:
                <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                <br />
            </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="background-color: #999999;">V_Name:
                <asp:TextBox ID="V_NameTextBox" runat="server" Text='<%# Bind("V_Name") %>' />
                <br />
                V_Date:
                <asp:TextBox ID="V_DateTextBox" runat="server" Text='<%# Bind("V_Date") %>' />
                <br />
                Category:
                <asp:TextBox ID="CategoryTextBox" runat="server" Text='<%# Bind("Category") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <td runat="server" style="">V_Name:
                <asp:TextBox ID="V_NameTextBox" runat="server" Text='<%# Bind("V_Name") %>' />
                <br />
                V_Date:
                <asp:TextBox ID="V_DateTextBox" runat="server" Text='<%# Bind("V_Date") %>' />
                <br />
                Category:
                <asp:TextBox ID="CategoryTextBox" runat="server" Text='<%# Bind("Category") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="background-color: #E0FFFF; color: #333333;">Video Name:
                <asp:Label ID="V_NameLabel" runat="server" Text='<%# Eval("V_Name") %>' />
                <br />
                Upload Date:
                <asp:Label ID="V_DateLabel" runat="server" Text='<%# Eval("V_Date") %>' />
                <br />
                Category:
                <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                <br />
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </table>
            <div style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="background-color: #E2DED6; font-weight: bold; color: #333333;">Video Name:
                <asp:Label ID="V_NameLabel" runat="server" Text='<%# Eval("Video Name") %>' />
                <br />
                Upload Date:
                <asp:Label ID="V_DateLabel" runat="server" Text='<%# Eval("Upload Date") %>' />
                <br />
                Category:
                <asp:Label ID="CategoryLabel" runat="server" Text='<%# Eval("Category") %>' />
                <br />
            </td>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="PMDBDataContext" EntityTypeName="" Select="new (V_Name, V_Date, Category)" TableName="Videos">
    </asp:LinqDataSource>

</asp:Content>
