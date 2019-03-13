<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <header>
        <p>Welcome to Liqour Lake!</p>
        <div class="down_arrow_link">
            <a href="#AboutUsContainer">
                <%--<i class="fas fa-angle-down"></i>--%>
                <i class="fas fa-arrow-down"></i>
            </a>
        </div>
    </header>
    <div id="AboutUsContainer" class="about_us_container">
        <h1>About Us</h1>
        <div class="about_us_text">
            <p>
                Welcome to Liqour Lake! Here we have a wide selection of various beer, wine, and spirits.
            </p>
            <p>
                Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim.
            </p>
            <p>Hours of Operation: </p>
            <ul class="store_hours_list">
                <li>Monday: 10 AM - 10 PM</li>
                <li>Tuesday: 10 AM - 10 PM</li>
                <li>Wednesday: 10 AM - 10 PM</li>
                <li>Thursday: 10 AM - 10 PM</li>
                <li>Friday: 10 AM - 11 PM</li>
                <li>Saturday: 10 AM - 11 PM</li>
                <li>Sunday: 10 AM - 10 PM</li>
            </ul>
        </div>
        <div id="AboutUsImageSection" class="about_us_image">
            <img src="App_Themes/Master/Images/LiquorLake.jpg" />
        </div>        
        <div id="CategoriesContainer" class="categories_container" runat="server">
            <h2>Have a look at our selection!</h2>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            var RemainingHeight = $(window).height() - $("#LiquorLakeHeader").height();
            $("#LiquorLakeImage").height(RemainingHeight);

            //scroll to about us section
            $(".down_arrow_link").click(function () {
                $("html, body").animate({
                    scrollTop: $("#AboutUsContainer").offset().top
                }, 'slow');
            });
        });
    </script>
</asp:Content>

