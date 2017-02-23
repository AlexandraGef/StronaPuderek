<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Wyszukiwarka.aspx.cs" Inherits="Pages_Wyszukiwarka" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None" ForeColor="#9900CC" Font-Size="X-Large" BackColor="#F79BFB" Font-Italic="True" Font-Names="Garamond" Width="283px">Wpisz nazwę szukanego produktu</asp:TextBox>
    <br />
   <br />
    
    <asp:TextBox ID="TextBox1" runat="server" Width="170px" CssClass="inputs"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Szukaj" CssClass="button" OnClick="Button1_Click" ForeColor="#FFCCFF" />
    <asp:GridView ID="GridView1" runat="server" CssClass="cartTable" ></asp:GridView><br /><br /><br /><br />
    
</asp:Content>

