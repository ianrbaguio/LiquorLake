<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="ViewCatalog.aspx.cs" Inherits="ViewCatalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="/App_Themes/Catalog/Catalog.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="ViewCatalogFullContainer" style="margin:0 10px;">
        <div id="ViewCatalogHeader">
            <div style="float: left;">
                <h2>Catalog</h2>
            </div>
            <div style="float: right; padding: 25px;">
                <div style="border: 1px solid black;">
                    <asp:TextBox ID="SearchTB" Width="250" Height="20" BorderStyle="None" runat="server"></asp:TextBox>
                    <span class="fa fa-search"></span>
                </div>
            </div>
        </div>

        <div id="ViewCatalogContent" style="clear: both; padding: 20px 0;">
            <div id="ViewCatalogFilterContainer" style="float: left; width: 180px; text-align: center; background-color: black; border-radius: 5px;">
                <div style="color:yellow; font-size:25px; padding:5px;">FILTER</div>
                <div id="CategoriesFilter" style="margin:5px; color:black; background-color: white;  ">
                    <h3>CATEGORIES</h3>
                    <asp:CheckBoxList runat="server">
                        <asp:ListItem>Beers</asp:ListItem>
                        <asp:ListItem>Spirits</asp:ListItem>
                        <asp:ListItem>Wines</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <div id="CompanyFilter" style="margin:5px; color:black; background-color: white;  ">
                    <h3>COMPANY</h3>
                    <asp:DropDownList ID="CompanyDropDownList" runat="server">
                        <asp:ListItem Value="All">All</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div id="ProductsDiv" style="float:left; max-width:80%; padding: 0 25px;" runat="server">

            </div>
        </div>

        <div id="FreeLiquorIconReference" style="clear:both;">
            <div>Icons made by <a href="https://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" runat="Server">
</asp:Content>

