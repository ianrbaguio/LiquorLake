<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%-- This is a comment made by Tim. --%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="LiquorLakeImage" class="liquor_lake_default_image">
        <span class="fas fa-angle-down fa-10x liquor_lake_caret_down"></span>
    </div>
    <div id="SearchByCategoriesDiv">
        <h2>SEARCH BY CATEGOREIS</h2>
        <div id="CategoriesContainer" style="text-align: center;" runat="server">
        </div>
    </div>
    <hr />
    <div id="AboutUsContainer" style="margin: 20px; display: flex;">
        <div id="AboutUsSection" style="float: left; width: 50%; flex: 1;">
            <h2>About Us</h2>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>

            <b>Hours of Operation: </b>
            <br />
            <ul>
                <li>Monday: 10 AM - 10 PM</li>
                <li>Tuesday: 10 AM - 10 PM</li>
                <li>Wednesday: 10 AM - 10 PM</li>
                <li>Thursday: 10 AM - 10 PM</li>
                <li>Friday: 10 AM - 11 PM</li>
                <li>Saturday: 10 AM - 11 PM</li>
                <li>Sunday: 10 AM - 10 PM</li>
            </ul>

        </div>
        <div id="AboutUsImageSection" style="width: 50%; float: right; flex: 1;">
            <img src="App_Themes/Master/Images/LiquorLake.png" style="width: 80%;" />
        </div>
    </div>

    <div id="FreeLiquorIconReference" style="clear: both;">
        <div>Icons made by <a href="https://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            var RemainingHeight = $(window).height() - $("#LiquorLakeHeader").height();
            $("#LiquorLakeImage").height(RemainingHeight);

            //scroll to about us section
            $(".liquor_lake_caret_down").click(function () {
                $("html, body").animate({
                    scrollTop: $("#AboutUsContainer").offset().top
                }, 'slow');
            });
        });
    </script>
</asp:Content>

