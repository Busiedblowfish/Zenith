﻿<%@ Page Title="Zenith Fitness | Member Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MemberLogin.aspx.cs" Inherits="Zenith_Fitness.WebForm7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 { height: 25px; }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <br/>
        <table id="loginTable">
            <tr>
                <td>
                    <h2 style="color: green; text-align: left;">Sign In to your Account</h2>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="display: block; height: 55px; width: auto;">
                    <asp:TextBox ID="tbxUser" runat="server" Placeholder="Enter Username" ForeColor="Black" Font-Bold="false" Font-Size="Large" Font-Names="Georgia" Height="40px" Width="300px" ToolTip="Username must begin with a letter, may contain digits, and 6-15 characters long"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvUser" runat="server" ErrorMessage="Required" ValidationGroup="Login" ControlToValidate="tbxUser" ForeColor="Red" Height="40px"></asp:RequiredFieldValidator>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="height: 55px; width: auto;">
                    <asp:TextBox ID="tbxPwd" runat="server" Placeholder="Enter Password" ForeColor="Black" Font-Bold="false" Font-Size="Large" Font-Names="Georgia" Height="40px" Width="300px" TextMode="Password" ToolTip="Password must include at least one upper and lower case letter, digit, special character, and 8 characters long"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ErrorMessage="Required" ValidationGroup="Login" ControlToValidate="tbxPwd" ForeColor="Red" Height="40px"></asp:RequiredFieldValidator>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="height: 55px; width: 223px;">
                    <asp:Button ID="btnLogin" runat="server" Height="40px" Text="Login" Width="300px" Font-Size="Large" Font-Names="Georgia" BackColor="#01A5CA" ForeColor="White" OnClick="btnLogin_Click"/>
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Zenith-FitnessConnectionString %>" SelectCommand="SELECT [member_username], [member_password] FROM [Member]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblEx" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                </td>
                <td class="auto-style1">
                </td>
            </tr>
            <tr>
                <td>
                    <a href="AdminLogin.aspx">
                        <h3 style="text-align: center">Employee? Click Here</h3>
                    </a>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</asp:Content>