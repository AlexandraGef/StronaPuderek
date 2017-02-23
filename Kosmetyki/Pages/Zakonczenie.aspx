<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Zakonczenie.aspx.cs" Inherits="Pages_Zakonczenie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:TextBox ID="TextBox1" runat="server" BackColor="#F79BFB" BorderStyle="None" Font-Bold="True" Font-Italic="True" Font-Names="Garamond" Font-Size="XX-Large" ForeColor="#9900CC" ReadOnly="True" Width="639px">Dziękujemy za wspólne zakupy i zapraszamy ponownie</asp:TextBox>
    <br />
    <br />
    <br />
    <asp:LinkButton ID="lnkContinue" runat="server" PostBackUrl="~/Index.aspx"
                    Text=" Kontynuuj zakupy " CssClass="button" ForeColor="#FFCCFF" />
</asp:Content>

