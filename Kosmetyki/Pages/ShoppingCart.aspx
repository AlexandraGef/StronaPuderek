<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="Pages_ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="pnlShoppingCart" runat="server"></asp:Panel>
    <table>
        <tr>
            <td>Cena<b>: </b></td>
            <td><asp:Literal ID="litTotal" runat="server" Text="" /></td>
        </tr>
         <tr>
            <td><b>Vat: </b></td>
            <td><asp:Literal ID="litVat" runat="server" Text="" /></td>
        </tr>
         <tr>
            <td><b>Wysyłka: </b></td>
            <td>10 zł</td>
        </tr>
         <tr>
            <td><b>Całość: </b></td>
            <td><asp:Literal ID="litTotalAmount" runat="server" Text="" /></td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="lnkContinue" runat="server" PostBackUrl="~/Index.aspx"
                    Text=" Kontynuuj zakupy " CssClass="button" ForeColor="#FFCCFF" />
                &nbsp;lub
                <asp:Button ID="btnCheckOut" runat="server" PostBackUrl="~/Pages/Success.aspx"
                    CssClass="button" Withd="250px" Text="Zakończ i zapłać" ForeColor="#FFCCFF" />
                
            </td>
        </tr>
    </table>
</asp:Content>

