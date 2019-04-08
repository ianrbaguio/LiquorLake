<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>ADD NEW PRODUCT</h2>
    <br />
    UPC:
    <asp:TextBox ID="UPCTB" runat="server"></asp:TextBox>
    <br />
    Category:
    <asp:DropDownList ID="CategoryDropDownList" runat="server" AutoPostBack="true">
        <asp:ListItem Value="1">Beer</asp:ListItem>
        <asp:ListItem Value="2">Spirits</asp:ListItem>
        <asp:ListItem Value="3">Wine</asp:ListItem>
    </asp:DropDownList>
    <br />
    Product Name:
    <asp:TextBox ID="ProductNameTB" runat="server"></asp:TextBox>
    <br />
    Price:
    <asp:TextBox ID="PriceTB" runat="server"></asp:TextBox>
    <br />
    Size:
    <asp:TextBox ID="SizeTB" runat="server"></asp:TextBox>
    <br />
    Country Of Origin:
    <asp:TextBox ID="CountryOfOriginTB" runat="server"></asp:TextBox>
    <br />
    Wine Sweetness Index:
    <asp:DropDownList ID="WineSweetnessIndexDropDownList" runat="server" AutoPostBack="true">
        <asp:ListItem Value="Extra Dry">Extra Dry</asp:ListItem>
        <asp:ListItem Value="Dry">Dry</asp:ListItem>
        <asp:ListItem Value="Medium">Medium</asp:ListItem>
        <asp:ListItem Value="Medium Sweet">Medium Sweet</asp:ListItem>
        <asp:ListItem Value="Sweet">Sweet</asp:ListItem>
    </asp:DropDownList>
    <br />
    Company:
    <asp:TextBox ID="CompanyTB" runat="server"></asp:TextBox>
    <br />
    Description:
    <asp:TextBox ID="DescriptionTB" runat="server"></asp:TextBox>
    <br />
    Image: <asp:FileUpload ID="ImageUpload" runat="server" />
    
    <asp:Button ID="AddProductButton" runat="server" Text="Add" OnClick="AddProductButton_Click" />
    <br />
    <asp:Label ID="AddProductLabel" runat="server"></asp:Label>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" runat="Server">
</asp:Content>

