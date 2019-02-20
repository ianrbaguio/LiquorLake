<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="LiquorLakeImage" class="liquor_lake_default_image">
        <span class="fas fa-angle-down fa-10x liquor_lake_caret_down">
        </span>
    </div>
    <div id="AboutUsContainer" style="margin:20px; display:flex;">
        <div id="AboutUsSection" style="float:left; width:50%; flex: 1;">
            <h2>About Us</h2>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
            </p>
            
            <b>Hours of Operation: </b> <br />
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
        <div id="AboutUsImageSection" style="display:flex; width:50%; float:right; flex: 1;">
            <img src="App_Themes/Master/Images/LiquorLake.png" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            var RemainingHeight = $(window).height() - $("#LiquorLakeHeader").height();
            $("#LiquorLakeImage").height(RemainingHeight);

            //scroll to about us section
            $(".liquor_lake_caret_down").click(function () {
                $("html, body").animate({
                    scrollTop: $("#AboutUsContainer").offset().top
                },'slow');
            });
        });
    </script>
</asp:Content>

