<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="AddProduct.aspx.cs" Inherits="AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="admin_container">
        <asp:HyperLink ID="AdminDefaultHyperLink" NavigateUrl="~/Admin/AdminDefault.aspx" runat="server">Home</asp:HyperLink>
        <h2>ADD NEW PRODUCT</h2>        
        <div id="ImageDiv" class="admin_row_container">
			<div class="admin_image_heading">
				<span style="color:red;">*</span>
				<span>Image</span>
			</div>
			<div class="admin_image_row">
				<asp:FileUpload ID="ImageUpload" runat="server" accept=".png,.jpg,.jpeg"/> 			
			</div>
			<div class="admin_image_row">
				<asp:Button ID="ImageUploadButton" runat="server" Text="Upload" OnClick="ImageUploadButton_Click" CausesValidation="false" />
			</div>
			<div class="admin_image_row">
				<asp:Image ID="UploadedImage" runat="server" style="padding:10px 0;" />
			</div>
        </div>
        <div id="UPCDiv" class="admin_row_container">
			<div class="admin_row_container_left">
				<span style="color:red;">*</span>
				<span>UPC:</span>
			</div>
			<div class="admin_row_container_right">
				<asp:TextBox ID="UPCTB" runat="server"></asp:TextBox>
			</div>
            <asp:RequiredFieldValidator ID="UPCRequiredFieldValidator" runat="server" ErrorMessage="Input Required!" ControlToValidate="UPCTB" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div id="CategoryDiv" class="admin_row_container">
			<div class="admin_row_container_left">
				<span style="color:red;">*</span>
				<span>Category:</span>
			</div>
			<div class="admin_row_container_right">
				<asp:DropDownList ID="CategoryDropDownList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="CategoryDropDownList_SelectedIndexChanged">
					<asp:ListItem Value="1">Beer</asp:ListItem>
					<asp:ListItem Value="2">Spirits</asp:ListItem>
					<asp:ListItem Value="3">Wine</asp:ListItem>
				</asp:DropDownList>
			</div>
        </div>
        <div id="ProductNameDiv" class="admin_row_container">
			<div class="admin_row_container_left">
				<span style="color:red;">*</span>
				<span>Product Name:</span>
			</div>
			<div class="admin_row_container_right">
				<asp:TextBox ID="ProductNameTB" runat="server"></asp:TextBox>
			</div>
            <asp:RequiredFieldValidator ID="ProductNameRequiredFieldValidator" runat="server" ErrorMessage="Input required!" ControlToValidate="ProductNameTB" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div id="PriceDiv" class="admin_row_container">
			<div class="admin_row_container_left">
				<span style="color:red;">*</span>
				<span>Price:</span>
			</div>
			<div class="admin_row_container_right">
				<asp:TextBox ID="PriceTB" runat="server"></asp:TextBox>
			</div>
            <asp:RequiredFieldValidator ID="PriceRequiredFieldValidator" runat="server" ErrorMessage="Input required!" ControlToValidate="PriceTB" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div id="SizeDiv" class="admin_row_container">
			<div class="admin_row_container_left">
				<span style="color:red;">*</span>
				<span>Size:</span>
			</div>
			<div class="admin_row_container_right">
				<asp:TextBox ID="SizeTB" runat="server"></asp:TextBox>
			</div>
            <asp:RequiredFieldValidator ID="SizeRequiredFieldValidator" runat="server" ErrorMessage="Input required!" ControlToValidate="SizeTB" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div id="CountryOfOriginDiv" class="admin_row_container">
			<div class="admin_row_container_left">
				<span>Country Of Origin:</span>
			</div>
			<div class="admin_row_container_right">
				<asp:TextBox ID="CountryOfOriginTB" runat="server"></asp:TextBox>
			</div>
        </div>
        <div id="CompanyDiv" class="admin_row_container">
			<div class="admin_row_container_left">
				<span style="color:red;">*</span>
				<span>Company:</span>
			</div>
			<div class="admin_row_container_right">
				<asp:TextBox ID="CompanyTB" runat="server"></asp:TextBox>
			</div>
            <asp:RequiredFieldValidator ID="CompanyRequiredFieldValidator" runat="server" ErrorMessage="Input required!" ControlToValidate="CompanyTB" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div id="DescriptionDiv" class="admin_row_container">
			<div class="admin_row_container_left">
				<span>Description:</span>
			</div>
			<div class="admin_row_container_right">
				<asp:TextBox ID="DescriptionTB" runat="server"></asp:TextBox>				
			</div>
        </div>       
        <asp:Panel ID="WineCategoryPanel" Visible="false" runat="server">
            <div id="WineSweetnessIndex" class="admin_row_container">
				<div class="admin_row_container_left">
					<span>Wine Sweetness Index:</span>
				</div>
				<div class="admin_row_container_right">
					<asp:DropDownList ID="WineSweetnessIndexDropDownList" runat="server" AutoPostBack="true">
						<asp:ListItem Value="N/A">N/A</asp:ListItem>
						<asp:ListItem Value="Extra Dry">Extra Dry</asp:ListItem>
						<asp:ListItem Value="Dry">Dry</asp:ListItem>
						<asp:ListItem Value="Medium">Medium</asp:ListItem>
						<asp:ListItem Value="Medium Sweet">Medium Sweet</asp:ListItem>
						<asp:ListItem Value="Sweet">Sweet</asp:ListItem>
					</asp:DropDownList>
				</div>
			</div>
        </asp:Panel>
		<div class="admin_row_container">
			<asp:Button ID="AddProductButton" runat="server" Text="Add Product" OnClick="AddProductButton_Click" />
		</div>
        <br />
        <asp:Label ID="AddProductLabel" runat="server"></asp:Label>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" runat="Server"></asp:Content>

