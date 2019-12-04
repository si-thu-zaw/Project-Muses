<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="Categories" MasterPageFile="~/Site.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/CategoryButtons.css" type="text/css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h1>Video Categories</h1>
    <div>
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="CategoryButton1" NavigateUrl="~/Videos/List.aspx?V_Cat=1"></asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="CategoryButton2" NavigateUrl="~/Videos/List.aspx?V_Cat=2"></asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" CssClass="CategoryButton3" NavigateUrl="~/Videos/List.aspx?V_Cat=3"></asp:HyperLink>
        </div>
        <div>
            <asp:HyperLink ID="HyperLink4" runat="server" CssClass="CategoryButton4" NavigateUrl="~/Videos/List.aspx?V_Cat=4"></asp:HyperLink>
            <asp:HyperLink ID="HyperLink5" runat="server" CssClass="CategoryButton5" NavigateUrl="~/Videos/List.aspx?V_Cat=5"></asp:HyperLink>
            <asp:HyperLink ID="HyperLink6" runat="server" CssClass="CategoryButton6" NavigateUrl="~/Videos/List.aspx?V_Cat=6"></asp:HyperLink>
        </div>
        <div>
            <asp:HyperLink ID="HyperLink7" runat="server" CssClass="CategoryButton7" NavigateUrl="~/Videos/List.aspx?V_Cat=7"></asp:HyperLink>
            <asp:HyperLink ID="HyperLink8" runat="server" CssClass="CategoryButton8" NavigateUrl="~/Videos/List.aspx?V_Cat=8"></asp:HyperLink>
            <asp:HyperLink ID="HyperLink9" runat="server" CssClass="CategoryButton9" NavigateUrl="~/Videos/List.aspx?V_Cat=9"></asp:HyperLink>
        </div>
        <div>
            <asp:HyperLink ID="HyperLink10" runat="server" CssClass="CategoryButton10" NavigateUrl="~/Videos/List.aspx?V_Cat=10"></asp:HyperLink>
        </div>
    </div>

</asp:Content>

