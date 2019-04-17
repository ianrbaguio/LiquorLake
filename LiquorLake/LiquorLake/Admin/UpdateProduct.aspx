<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="UpdateProduct.aspx.cs" Inherits="Admin_UpdateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="text-align: center; width: 100%; padding: 25px;">
        <asp:HyperLink ID="AdminDefaultHyperLink" NavigateUrl="~/Admin/AdminDefault.aspx" runat="server">Home</asp:HyperLink>
        <h2>UPDATE PRODUCT</h2>
        Search by Name<asp:TextBox ID="tbSearchProduct" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearchProduct" runat="server" Text="Find Product" OnClick="btnSearchProduct_Click" />
        <hr />
    </div>


    <asp:Panel ID="ProductInfoPanel" Style="width: 60%; margin: 0 auto; text-align: center;" runat="server" Visible="false">
        <div id="ImageDiv" style="padding: 10px;">
            <span style="color: red;">*</span>Image:
            <%--<asp:FileUpload ID="ImageUpload" runat="server" /> 
            <asp:Button ID="ImageUploadButton" runat="server" Text="Upload" OnClick="ImageUploadButton_Click" CausesValidation="false" />
            <br />
            <asp:Image ID="UploadedImage" runat="server" style="padding:10px 0;" />--%>
            <asp:FileUpload ID="fuImage" runat="server" accept=".png,.jpg,.jpeg" />
            <asp:Button ID="UploadImageButton" runat="server" Text="Upload" OnClick="UploadImageButton_Click" />
            <br />
            <asp:Image ID="ItemImage" runat="server" />
        </div>

        <div id="UPCDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">UPC:</span>
            <asp:TextBox ID="tbUPC" runat="server"></asp:TextBox><span style="color: red;">*</span>
            <br />
            <asp:RequiredFieldValidator ID="UPCRequiredFieldValidator"
                runat="server"
                ErrorMessage="Input Required!"
                ControlToValidate="tbUPC"
                Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div id="CategoryDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Category:</span>
            <asp:DropDownList ID="ddlCategoryName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoryName_SelectedIndexChanged">
                <asp:ListItem Value="1" Text="Beer">Beer</asp:ListItem>
                <asp:ListItem Value="2" Text="Spirit">Spirit</asp:ListItem>
                <asp:ListItem Value="3" Text="Wine">Wine</asp:ListItem>
            </asp:DropDownList><span style="color: red;">*</span>
        </div>
        <br />

        <div id="ProductNameDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Product Name:</span>
            <asp:TextBox ID="tbName" runat="server"></asp:TextBox><span style="color: red;">*</span>
            <br />
            <asp:RequiredFieldValidator ID="ProductNameRequiredFieldValidator"
                runat="server"
                ErrorMessage="Input Required!"
                ControlToValidate="tbName"
                Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div id="PriceDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Price:</span>
            <asp:TextBox ID="tbPrice" runat="server"></asp:TextBox><span style="color: red;">*</span>
            <br />
            <asp:RequiredFieldValidator ID="PriceRequiredFieldValidator"
                runat="server"
                ErrorMessage="Input Required!"
                ControlToValidate="tbPrice"
                Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <br />

        <div id="SizeDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Size:</span>
            <asp:TextBox ID="tbSize" runat="server"></asp:TextBox><span style="color: red;">*</span>
            <br />
            <asp:RequiredFieldValidator ID="SizeRequiredFieldValidator"
                runat="server"
                ErrorMessage="Input Required!"
                ControlToValidate="tbSize"
                Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div id="CountryOfOriginDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Country Of Origin:</span>
            <asp:TextBox ID="tbCountryOfOrigin" runat="server" AutoPostBack="true"></asp:TextBox><span style="color: red;">*</span>
            <br />
        </div>

        <br />

        <div id="CompanyDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Country Of Origin:</span>
            <asp:TextBox ID="tbCompany" runat="server"></asp:TextBox><span style="color: red;">*</span>
            <br />
            <asp:RequiredFieldValidator ID="CompanyRequiredFieldValidator"
                runat="server"
                ErrorMessage="Input Required!"
                ControlToValidate="tbCompany"
                Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div id="DescriptionDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Description:</span>
            <asp:TextBox ID="tbDescription" runat="server"></asp:TextBox><span style="color: red;">*</span>
        </div>

        <br />

        <asp:Panel ID="WineCategoryPanel" Visible="false" runat="server">
            <div id="WineSweetnessIndex" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 50%; text-align: right;">Wine Sweetness Index:</span>
            <asp:DropDownList ID="ddlSweetnessIndex" runat="server">
            <asp:ListItem Value="Extra Dry">Extra Dry</asp:ListItem>
            <asp:ListItem Value="Dry">Dry</asp:ListItem>
            <asp:ListItem Value="Medium">Medium</asp:ListItem>
            <asp:ListItem Value="Medium Sweet">Medium Sweet</asp:ListItem>
            <asp:ListItem Value="Sweet">Sweet</asp:ListItem>
            </asp:DropDownList>
            </div>
        </asp:Panel>
        <br />
        <asp:Button ID="btnUpdateProduct" runat="server" style="margin:10px 0;" Text="Update Product" OnClick="btnUpdateProduct_Click" />
        <br />
        <asp:Label ID="lblConfirmation" runat="server" Text=""></asp:Label>
        <br />
    </asp:Panel>

    <asp:Table ID="ProductsTable" runat="server" GridLines="Both"></asp:Table>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" runat="Server">
</asp:Content>

