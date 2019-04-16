<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="UpdateProduct.aspx.cs" Inherits="Admin_UpdateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    Search by Name<asp:TextBox ID="tbSearchProduct" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearchProduct" runat="server" Text="Find Product" OnClick="btnSearchProduct_Click" />

    <hr />

    <asp:Table ID="ProductsTable" runat="server"></asp:Table>

    <asp:Panel ID="ProductInfoPanel" runat="server" Visible="false">
        <asp:TextBox ID="tbUPC" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbName" runat="server"></asp:TextBox>
        <br />
        <asp:DropDownList ID="ddlCategoryName" runat="server" AutoPostBack="true">
            <asp:ListItem Value="1" Text="Wine">Wine</asp:ListItem>
            <asp:ListItem Value="2" Text="Beer">Beer</asp:ListItem>
            <asp:ListItem Value="3" Text="Spirit">Spirit</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="tbPrice" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbSize" runat="server"></asp:TextBox>
        <br />
        <asp:TextBox ID="tbCountryOfOrigin" runat="server" AutoPostBack="true"></asp:TextBox>
        <asp:DropDownList ID="ddlSweetnessIndex" runat="server">
            <asp:ListItem Value="Extra Dry">Extra Dry</asp:ListItem>
            <asp:ListItem Value="Dry">Dry</asp:ListItem>
            <asp:ListItem Value="Medium">Medium</asp:ListItem>
            <asp:ListItem Value="Medium Sweet">Medium Sweet</asp:ListItem>
            <asp:ListItem Value="Sweet">Sweet</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:TextBox ID="tbCompany" runat="server"></asp:TextBox>
        <asp:TextBox ID="tbDescription" runat="server"></asp:TextBox>
        <br />
        <asp:Image ID="ItemImage" runat="server" />
        <asp:FileUpload ID="fuImage" runat="server" accept=".png,.jpg,.jpeg"/>

        <br />

        <asp:Button ID="btnUpdateProduct" runat="server" Text="Update Product" OnClick="btnUpdateProduct_Click" />

        <br />

        <asp:Label ID="lblConfirmation" runat="server" Text=""></asp:Label>

    </asp:Panel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" runat="Server">
</asp:Content>

