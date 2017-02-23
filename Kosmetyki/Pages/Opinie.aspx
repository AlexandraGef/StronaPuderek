<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Opinie.aspx.cs" Inherits="Pages_Opinie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 65px;
        }
        .auto-style2 {
            width: 400px;
        }
        .auto-style3 {
            width: 65px;
            height: 65px;
        }
        .auto-style4 {
            width: 400px;
            height: 65px;
        }
        .auto-style5 {
            width: 65px;
            height: 36px;
        }
        .auto-style6 {
            width: 400px;
            height: 36px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="TextBox1" runat="server" BackColor="#F79BFB" BorderStyle="None" Font-Bold="True" Font-Names="Garamond" Font-Size="XX-Large" ForeColor="#9900CC" style="text-align: center; margin-left: 0px;" Width="545px" ReadOnly="True" Font-Italic="True">Napisz co o Nas myślisz ;)</asp:TextBox><br /><br /><br />

    <table style="width: 50%; margin-top: 2px; margin-bottom: 0px;" class="tabletable">
        <tr>
            <td class="auto-style1">Imię:</td>
            <td class="auto-style2">
                <asp:TextBox ID="imietxt" runat="server" Width="350px" CssClass="inputs" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Imię jest wymagane" ControlToValidate="imietxt" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">E-mail:</td>
            <td class="auto-style2">
                <asp:TextBox ID="emailtxt" runat="server" Width="350px" CssClass="inputs"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Emial jest wymagany" ControlToValidate="emailtxt" Display="Dynamic" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Nieprawidłowy format email" ControlToValidate="emailtxt" Display="Dynamic" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Opinia:</td>
            <td class="auto-style4">
                <asp:TextBox ID="opiniatxt" runat="server" Height="73px" TextMode="MultiLine" Width="350px" CssClass="inputs"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Zapomniałeś/aś o opinii !" ControlToValidate="opiniatxt" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="emailtxt" ErrorMessage="Niepoprawny adres e-mail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5"></td>
            <td class="auto-style6">
                <asp:Button ID="opiniabtn" runat="server" Text="Wyślij" Width="67px" OnClick="opiniabtn_Click" CssClass="button" ForeColor="#FFCCFF" />
                
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <br />
    <br />
    <asp:Repeater ID="Repeater1" runat="server">

        <ItemTemplate>
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Imie") %>' BorderColor="#9900CC" BorderStyle="Double" Font-Overline="False" Font-Underline="False" Font-Strikeout="False" Width="25%" /><br />
          
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("Opinia") %>' /><br /><br />
   
        </ItemTemplate>
                </asp:Repeater>
    </asp:Content>

