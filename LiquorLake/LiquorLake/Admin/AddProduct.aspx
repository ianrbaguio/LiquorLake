<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="width: 60%; margin: 0 auto; text-align: center;">
        <asp:HyperLink ID="AdminDefaultHyperLink" NavigateUrl="~/Admin/AdminDefault.aspx" runat="server">Home</asp:HyperLink>
        <h2>ADD NEW PRODUCT</h2>
        <br />
        <div id="ImageDiv" style="padding: 10px;">
            <span style="color:red;">*</span>Image:
            <asp:FileUpload ID="ImageUpload" runat="server" accept=".png,.jpg,.jpeg"/> 
            <asp:Button ID="ImageUploadButton" runat="server" Text="Upload" OnClick="ImageUploadButton_Click" CausesValidation="false" />
            <br />
            <asp:Image ID="UploadedImage" runat="server" style="padding:10px 0;" />
        </div>

        <div id="UPCDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">UPC:</span>
            <asp:TextBox ID="UPCTB" runat="server"></asp:TextBox><span style="color:red;">*</span>
            <br />
            <asp:RequiredFieldValidator ID="UPCRequiredFieldValidator" 
                                        runat="server" 
                                        ErrorMessage="Input Required!"
                                        ControlToValidate="UPCTB"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div id="CategoryDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Category:</span>
            <asp:DropDownList ID="CategoryDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CategoryDropDownList_SelectedIndexChanged">
                <asp:ListItem Value="1">Beer</asp:ListItem>
                <asp:ListItem Value="2">Spirits</asp:ListItem>
                <asp:ListItem Value="3">Wine</asp:ListItem>
            </asp:DropDownList><span style="color:red;">*</span>
        </div>
        <br />

        <div id="ProductNameDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Product Name:</span>
            <asp:TextBox ID="ProductNameTB" runat="server"></asp:TextBox><span style="color:red;">*</span>
            <br />
            <asp:RequiredFieldValidator ID="ProductNameRequiredFieldValidator" 
                                        runat="server" 
                                        ErrorMessage="Input required!"
                                        ControlToValidate="ProductNameTB"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
        </div>


        <div id="PriceDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Price:</span>
            <asp:TextBox ID="PriceTB" runat="server"></asp:TextBox><span style="color:red;">*</span>
            <br />
            <asp:RequiredFieldValidator ID="PriceRequiredFieldValidator" 
                                        runat="server" 
                                        ErrorMessage="Input required!"
                                        ControlToValidate="PriceTB"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <br />

        <div id="SizeDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Size:</span>
            <asp:TextBox ID="SizeTB" runat="server"></asp:TextBox><span style="color:red;">*</span>
            <br />
            <asp:RequiredFieldValidator ID="SizeRequiredFieldValidator" 
                                        runat="server" 
                                        ErrorMessage="Input required!"
                                        ControlToValidate="SizeTB"
                                        Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div id="CountryOfOriginDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Country Of Origin:</span>
            <asp:TextBox ID="CountryOfOriginTB" runat="server"></asp:TextBox>
            <br />
        </div>
        <br />

        <div id="CompanyDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Company:</span>
            <asp:TextBox ID="CompanyTB" runat="server"></asp:TextBox><span style="color:red;">*</span>
            <br />
            <asp:RequiredFieldValidator ID="CompanyRequiredFieldValidator" 
                                        runat="server" 
                                        ErrorMessage="Input required!"
                                        ControlToValidate="CompanyTB"
                                        Display="Dynamic"></asp:RequiredFieldValidator>

        </div>

        <div id="DescriptionDiv" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 40%; text-align: right;">Description:</span>
            <asp:TextBox ID="DescriptionTB" runat="server"></asp:TextBox>
        </div>
        <br />

        <asp:Panel ID="WineCategoryPanel" Visible="false" runat="server">
            <div id="WineSweetnessIndex" style="width: 46%; display: inline-block; padding: 10px 0;">
            <span style="display: inline-block; width: 50%; text-align: right;">Wine Sweetness Index:</span>
            <asp:DropDownList ID="WineSweetnessIndexDropDownList" runat="server" AutoPostBack="true">
                <asp:ListItem Value="N/A">N/A</asp:ListItem>
                <asp:ListItem Value="Extra Dry">Extra Dry</asp:ListItem>
                <asp:ListItem Value="Dry">Dry</asp:ListItem>
                <asp:ListItem Value="Medium">Medium</asp:ListItem>
                <asp:ListItem Value="Medium Sweet">Medium Sweet</asp:ListItem>
                <asp:ListItem Value="Sweet">Sweet</asp:ListItem>
            </asp:DropDownList>
        </div>
        </asp:Panel>

        <br />
        <asp:Button ID="AddProductButton" runat="server" Text="Add Product" Width="125" style="margin:10px 0;" OnClick="AddProductButton_Click" />
        <br />
        <asp:Label ID="AddProductLabel" runat="server"></asp:Label>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" runat="Server">
</asp:Content>

