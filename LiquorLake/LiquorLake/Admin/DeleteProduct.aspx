<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DeleteProduct.aspx.cs" Inherits="Admin_DeleteProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Delete Product</h2>

            <div>
                <asp:TextBox ID="tbFilter" runat="server"></asp:TextBox>

                <asp:Button ID="btnSearchProduct" runat="server" Text="Search Product" />
            </div>

            <div>
                <asp:Table ID="ProductsTable" runat="server" GridLines="Both"></asp:Table>
            </div>

        </div>
    </form>
</body>
</html>
