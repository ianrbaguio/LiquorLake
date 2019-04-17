<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="UpdateProduct.aspx.cs" Inherits="Admin_UpdateProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="update_product_search_container">
        <asp:HyperLink ID="AdminDefaultHyperLink" NavigateUrl="~/Admin/AdminDefault.aspx" runat="server">Home</asp:HyperLink>
        <h2>UPDATE PRODUCT</h2>
		<div class="admin_update_row">
			<span>Search by Name</span>
		</div>
		<div class="admin_update_row">
			<asp:TextBox ID="tbSearchProduct" runat="server"></asp:TextBox>
		</div>
		<div class="admin_update_row">
			<asp:Button ID="btnSearchProduct" runat="server" Text="Find Product" OnClick="btnSearchProduct_Click" />
		</div>
    </div>

    <asp:Panel ID="ProductInfoPanel" runat="server" Visible="false">
		<div class="admin_container">
			<div id="ImageDiv" class="admin_row_container">
				<div class="admin_image_heading">
					<span style="color:red;">*</span>
					<span>Image</span>
				</div>
				<div class="admin_image_row">
					<asp:FileUpload ID="fuImage" runat="server" accept=".png,.jpg,.jpeg" />
				</div>
				<div class="admin_image_row">
					<asp:Button ID="UploadImageButton" runat="server" Text="Upload" OnClick="UploadImageButton_Click" />
				</div>
				<div class="admin_image_row">
					<asp:Image ID="ItemImage" runat="server" style="padding:10px 0;" />
				</div>
			</div>
			<div id="UPCDiv" class="admin_row_container">
				<div class="admin_row_container_left">
					<span style="color:red;">*</span>
					<span>UPC:</span>
				</div>
				<div class="admin_row_container_right">
					<asp:TextBox ID="tbUPC" runat="server"></asp:TextBox>
				</div>
				<asp:RequiredFieldValidator ID="UPCRequiredFieldValidator" runat="server" ErrorMessage="Input Required!" ControlToValidate="tbUPC" Display="Dynamic"></asp:RequiredFieldValidator>
			</div>
			<div id="CategoryDiv" class="admin_row_container">
				<div class="admin_row_container_left">
					<span style="color:red;">*</span>
					<span>Category:</span>
				</div>
				<div class="admin_row_container_right">
					<asp:DropDownList ID="ddlCategoryName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategoryName_SelectedIndexChanged">
						<asp:ListItem Value="1" Text="Beer">Beer</asp:ListItem>
						<asp:ListItem Value="2" Text="Spirit">Spirit</asp:ListItem>
						<asp:ListItem Value="3" Text="Wine">Wine</asp:ListItem>
					</asp:DropDownList>
				</div>
			</div>
			<div id="ProductNameDiv" class="admin_row_container">
				<div class="admin_row_container_left">
					<span style="color:red;">*</span>
					<span>Product Name:</span>
				</div>
				<div class="admin_row_container_right">
					<asp:TextBox ID="tbName" runat="server"></asp:TextBox>
				</div>
				<asp:RequiredFieldValidator ID="ProductNameRequiredFieldValidator" runat="server" ErrorMessage="Input Required!" ControlToValidate="tbName" Display="Dynamic"></asp:RequiredFieldValidator>
			</div>
			<div id="PriceDiv" class="admin_row_container">
				<div class="admin_row_container_left">
					<span style="color:red;">*</span>
					<span>Price:</span>
				</div>
				<div class="admin_row_container_right">
					<asp:TextBox ID="tbPrice" runat="server"></asp:TextBox>
				</div>
				<asp:RequiredFieldValidator ID="PriceRequiredFieldValidator" runat="server" ErrorMessage="Input Required!" ControlToValidate="tbPrice" Display="Dynamic"></asp:RequiredFieldValidator>
			</div>
			<div id="SizeDiv" class="admin_row_container">
				<div class="admin_row_container_left">
					<span style="color:red;">*</span>
					<span>Size:</span>
				</div>
				<div class="admin_row_container_right">
					<asp:TextBox ID="tbSize" runat="server"></asp:TextBox>
				</div>
				<asp:RequiredFieldValidator ID="SizeRequiredFieldValidator" runat="server" ErrorMessage="Input Required!" ControlToValidate="tbSize" Display="Dynamic"></asp:RequiredFieldValidator>
			</div>
			<div id="CountryOfOriginDiv" class="admin_row_container">
				<div class="admin_row_container_left">
					<span>Country Of Origin:</span>
				</div>
				<div class="admin_row_container_right">
					<asp:TextBox ID="tbCountryOfOrigin" runat="server" AutoPostBack="true"></asp:TextBox>
				</div>
			</div>
			<div id="CompanyDiv" class="admin_row_container">
				<div class="admin_row_container_left">
					<span style="color:red;">*</span>
					<span>Company:</span>
				</div>
				<div class="admin_row_container_right">
					<asp:TextBox ID="tbCompany" runat="server"></asp:TextBox>
				</div>
				<asp:RequiredFieldValidator ID="CompanyRequiredFieldValidator" runat="server" ErrorMessage="Input Required!" ControlToValidate="tbCompany" Display="Dynamic"></asp:RequiredFieldValidator>
			</div>
			<div id="DescriptionDiv" class="admin_row_container">
				<div class="admin_row_container_left">
					<span>Description:</span>
				</div>
				<div class="admin_row_container_right">
					<asp:TextBox ID="tbDescription" runat="server"></asp:TextBox>
				</div>
			</div>
			<asp:Panel ID="WineCategoryPanel" Visible="false" runat="server">
				<div id="WineSweetnessIndex" class="admin_row_container">
					<div class="admin_row_container_left">
						<span>Wine Sweetness Index:</span>
					</div>
					<div class="admin_row_container_right">
						<asp:DropDownList ID="ddlSweetnessIndex" runat="server">
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
				<asp:Button ID="btnUpdateProduct" runat="server" Text="Update Product" OnClick="btnUpdateProduct_Click" />
			</div>
			<br />
			<asp:Label ID="lblConfirmation" runat="server" Text=""></asp:Label>

		</div>
    </asp:Panel>

    <asp:Table ID="ProductsTable" runat="server" GridLines="Both"></asp:Table>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" runat="Server"></asp:Content>
