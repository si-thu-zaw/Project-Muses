<%@ Page Language="C#" MasterPageFile="~/Site.master" CodeFile="Details.aspx.cs" Inherits="Details" %>


<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="Server">
    <asp:DynamicDataManager ID="DynamicDataManager1" runat="server" AutoLoadForeignKeys="true">
        <DataControls>
            <asp:DataControlReference ControlID="FormView1" />
        </DataControls>
    </asp:DynamicDataManager>
    <div class="video-container">
        <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                V_Link:
            <asp:TextBox ID="V_LinkTextBox" runat="server" Text='<%# Bind("V_Link") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                V_Link:
            <asp:TextBox ID="V_LinkTextBox" runat="server" Text='<%# Bind("V_Link") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                &nbsp;<asp:Label ID="V_LinkLabel" runat="server" Text='<%# Bind("V_Link") %>' />
                <br />

            </ItemTemplate>
        </asp:FormView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PMDBConnectionString %>" SelectCommand="SELECT [V_Link] FROM [Video] WHERE ([V_ID] = @V_ID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="V_ID" QueryStringField="V_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            Views:
            <asp:TextBox ID="ViewsTextBox" runat="server" Text='<%# Bind("Views") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Views:
            <asp:TextBox ID="ViewsTextBox0" runat="server" Text='<%# Bind("Views") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Views:
            <asp:Label ID="ViewsLabel" runat="server" Text='<%# Bind("Views") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>

    <asp:FormView ID="FormView4" runat="server" DataSourceID="SqlDataSource3">
        <EditItemTemplate>
            Likes:
            <asp:TextBox ID="LikesTextBox" runat="server" Text='<%# Bind("Likes") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Likes:
            <asp:TextBox ID="LikesTextBox" runat="server" Text='<%# Bind("Likes") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Likes:
            <asp:Label ID="LikesLabel" runat="server" Text='<%# Bind("Likes") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Like" />

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
                HeaderText="List of validation errors" CssClass="DDValidator" />
            <asp:DynamicValidator runat="server" ID="DetailsViewValidator" ControlToValidate="FormView1" Display="None" CssClass="DDValidator" />

            <asp:FormView runat="server" ID="FormView1" DataSourceID="DetailsDataSource" OnItemDeleted="FormView1_ItemDeleted" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>
                    <table id="detailsTable" class="DDDetailsTable" cellpadding="6">
                        <asp:DynamicEntity runat="server" />
                        <tr class="td">
                            <td colspan="2">
                                <asp:DynamicHyperLink runat="server" Action="Edit" Text="Edit" />
                                <asp:LinkButton runat="server" CommandName="Delete" Text="Delete"
                                    OnClientClick='return confirm("Are you sure you want to delete this item?");' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <EmptyDataTemplate>
                    <div class="DDNoItem">No such item.</div>
                </EmptyDataTemplate>
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            </asp:FormView>

            <asp:LinqDataSource ID="DetailsDataSource" runat="server" EnableDelete="true" />

            <asp:QueryExtender TargetControlID="DetailsDataSource" ID="DetailsQueryExtender" runat="server">
                <asp:DynamicRouteExpression />
            </asp:QueryExtender>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PMDBConnectionString %>" SelectCommand="SELECT COUNT(Vi_ID) AS Views FROM [View] WHERE (Vi_Video = @V_ID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="V_ID" QueryStringField="V_ID" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add Comment" />

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:PMDBConnectionString %>" SelectCommand="SELECT COUNT(L_ID) AS Likes FROM [Like] WHERE (L_Video = @V_ID)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="V_ID" QueryStringField="V_ID" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
                <AlternatingItemTemplate>
                    <span style="background-color: #FFFFFF;color: #284775;">CM_User:
                    <asp:Label ID="CM_UserLabel" runat="server" Text='<%# Eval("CM_User") %>' />
                    <br />
                    CM_Comment:
                    <asp:Label ID="CM_CommentLabel" runat="server" Text='<%# Eval("CM_Comment") %>' />
                    <br />
                    CM_Date:
                    <asp:Label ID="CM_DateLabel" runat="server" Text='<%# Eval("CM_Date") %>' />
                    <br />
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #999999;">CM_User:
                    <asp:TextBox ID="CM_UserTextBox" runat="server" Text='<%# Bind("CM_User") %>' />
                    <br />
                    CM_Comment:
                    <asp:TextBox ID="CM_CommentTextBox" runat="server" Text='<%# Bind("CM_Comment") %>' />
                    <br />
                    CM_Date:
                    <asp:TextBox ID="CM_DateTextBox" runat="server" Text='<%# Bind("CM_Date") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    This video has no comments.
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">CM_User:
                    <asp:TextBox ID="CM_UserTextBox" runat="server" Text='<%# Bind("CM_User") %>' />
                    <br />
                    CM_Comment:
                    <asp:TextBox ID="CM_CommentTextBox" runat="server" Text='<%# Bind("CM_Comment") %>' />
                    <br />
                    CM_Date:
                    <asp:TextBox ID="CM_DateTextBox" runat="server" Text='<%# Bind("CM_Date") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #E0FFFF;color: #333333;">CM_User:
                    <asp:Label ID="CM_UserLabel" runat="server" Text='<%# Eval("CM_User") %>' />
                    <br />
                    CM_Comment:
                    <asp:Label ID="CM_CommentLabel" runat="server" Text='<%# Eval("CM_Comment") %>' />
                    <br />
                    CM_Date:
                    <asp:Label ID="CM_DateLabel" runat="server" Text='<%# Eval("CM_Date") %>' />
                    <br />
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #E2DED6;font-weight: bold;color: #333333;">CM_User:
                    <asp:Label ID="CM_UserLabel" runat="server" Text='<%# Eval("CM_User") %>' />
                    <br />
                    CM_Comment:
                    <asp:Label ID="CM_CommentLabel" runat="server" Text='<%# Eval("CM_Comment") %>' />
                    <br />
                    CM_Date:
                    <asp:Label ID="CM_DateLabel" runat="server" Text='<%# Eval("CM_Date") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:PMDBConnectionString %>" SelectCommand="SELECT [CM_User], [CM_Comment], [CM_Date] FROM [Comment] WHERE ([CM_Video] = @CM_Video)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="CM_Video" QueryStringField="V_ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <br />

            <div class="DDBottomHyperLink">
                <asp:DynamicHyperLink ID="ListHyperLink" runat="server" Action="List">Show all items</asp:DynamicHyperLink>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

