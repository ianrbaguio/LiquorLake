<%@ Page Title="" Language="C#" MasterPageFile="~/LiquorLakeMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="AdminContainer" style="width: 100%;">
        <div style="width:20%; margin:0 auto; padding:25px; text-align:center;">
            <h2>ADMIN LOGIN</h2>
            <span style="min-width:100px; display:inline-block;">Username:</span>
        <asp:TextBox ID="UsernameTB" runat="server"></asp:TextBox>
            <br />
            <br />
            <span style="min-width:100px; display:inline-block;">Password:</span>
        <asp:TextBox ID="PasswordTB" TextMode="Password" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="LoginButton" Width="100%" style="margin:auto 0;" runat="server" Text="Login" OnClick="LoginButton_Click" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="jQueryPlaceHolder" runat="Server">
</asp:Content>

