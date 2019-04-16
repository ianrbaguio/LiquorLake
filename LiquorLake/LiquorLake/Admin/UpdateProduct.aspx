<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="UpdateProduct.aspx.cs" Inherits="Admin_UpdateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Search by Name<asp:TextBox ID="tbSearchProduct" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearchProduct" runat="server" Text="Find Product" OnClick="btnSearchProduct_Click" />

    <hr />

    <asp:Table ID="ProductsTable" runat="server"></asp:Table>

    <asp:Panel ID="ProductInfoPanel" runat="server" Visible="false">
        <asp:TextBox ID="tbUPC" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
        <br />
        <asp:DropDownList ID="ddlCategoryName" runat="server"></asp:DropDownList>
        <asp:TextBox ID="tbPrice" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbSize" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="tbCountryOfOrigin" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbWineSweetnessIndex" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="tbCompany" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbDescription" runat="server"></asp:TextBox>
        <br />
        <asp:Image ID="ItemImage" runat="server" />
        <asp:FileUpload ID="fuImage" runat="server" />

        <br />

        <asp:Button ID="btnUpdateProduct" runat="server" Text="Update Product" />
    </asp:Panel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" Runat="Server">
</asp:Content>

