<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="DeleteProduct.aspx.cs" Inherits="Admin_DeleteProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	<link rel="stylesheet" href="/App_Themes/Master/Master.css" />
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <form id="form1" runat="server">
        <asp:HyperLink ID="AdminDefaultHyperLink" NavigateUrl="~/Admin/AdminDefault.aspx" runat="server">Home</asp:HyperLink>
        <div class="admin_container">
			<h2>Delete Product</h2>
			<div class="delete_product_row">
				<span>Enter a product name</span>
			</div>
			<div class="delete_product_row">
				<asp:TextBox ID="tbFilter" runat="server"></asp:TextBox>
			</div>
			<div class="delete_product_row">
				<asp:Button ID="btnSearchProduct" runat="server" Text="Search Product" />
			</div>
			<div class="delete_product_row">
                <asp:Label ID="lblConfirmation" runat="server" Text="" Font-Size="Large"></asp:Label>
			</div>
        </div>
        <div>
            <asp:Table ID="ProductsTable" runat="server" GridLines="Both"></asp:Table>
        </div>
    </form>
</body>
</html>
