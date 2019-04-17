<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="AdminDefault.aspx.cs" Inherits="Admin_AdminDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        <asp:Label ID="WelcomeLabel" runat="server"></asp:Label>
    </h2>
    <asp:Button ID="LogOutButton" runat="server" Text="Log Out" OnClick="LogOutButton_Click" />
    <br />
    <br />
    <ul>
        <li>
            <asp:HyperLink ID="AddProductHyperLink" NavigateUrl="~/Admin/AddProduct.aspx" runat="server">Add New Product</asp:HyperLink>
        </li>
        <li>
            <asp:HyperLink ID="DeleteProductHyperLink" NavigateUrl="~/Admin/DeleteProduct.aspx" runat="server">Delete Product</asp:HyperLink>
        </li>
        <li>
            <asp:HyperLink ID="UpdateProductHyperLink" NavigateUrl="~/Admin/UpdateProduct.aspx" runat="server">Update Product</asp:HyperLink>
        </li>
    </ul>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" Runat="Server">
</asp:Content>

