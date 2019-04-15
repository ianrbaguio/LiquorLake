<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="ViewCatalog.aspx.cs" Inherits="ViewCatalog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="/App_Themes/Catalog/Catalog.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="ViewCatalogFullContainer" class="catalog_container">
        <h1>Catalog</h1>
        <div class="search_bar_container">
            <div class="search_textbox"> 
                <asp:TextBox ID="SearchTB" placeholder="Search" runat="server"></asp:TextBox>

            </div>
            <div class="search_button">
                <button id="SearchButton" runat="server" onserverclick="SearchButton_ServerClick">
                    <i class="fa fa-search"></i>
                </button>
            </div>
        </div>
        <div id="ViewCatalogContent">
            <%--<div id="ViewCatalogFilterContainer" style="float: left; width: 180px; text-align: center; background-color: black; border-radius: 5px;">
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
            </div>--%>
            <div id="ProductsDiv" runat="server"></div>
        </div>
        <%--<div id="FreeLiquorIconReference" style="clear: both;">
            <div>Icons made by <a href="https://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
        </div>--%>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" runat="Server">
    <script type="text/javascript">

        $(".more_info_button").click(function () {
            var productUPC = $(this).prop('id').replace("buttonMI_", "");
            var buttonID = $(this).prop('id');
            
            var productmodal = document.getElementById(productUPC + "Modal");
            // Get the button that opens the modal
            var btn = document.getElementsByClassName("more_info_button");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            productmodal.style.display = "block";

            //$(window).click(function (event) {
            //    if (!$(event.target).parents(".modal").length && $(".modal").is(":visible")) {
            //        console.log("w clicked");
            //        $(".modal").css("display", "none");
            //    }
            //});

        });

        $(".close").click(function () {
            var upc = $(this).prop('id').replace("_close_button", "");
            $("#" + upc + "Modal").css("display", "none");
        });

    </script>
</asp:Content>

