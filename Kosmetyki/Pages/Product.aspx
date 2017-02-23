<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Product.aspx.cs" Inherits="Pages_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
                  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td rowspan="4">
                <asp:Image ID="imgProduct" runat="server" CssClass="detailsImage"/></td>
            <td class="auto-style2"><h2>
                <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label>
                <hr/>
                </h2></td>
        </tr>
        <tr>
            <td class="auto-style2"><asp:Label ID="lblDescription" runat="server" CssClass="detailsDescription"></asp:Label></td>
            <td class="auto-style1"><asp:Label ID="lblPrice" runat="server" CssClass="detailsPrice"></asp:Label><br/>
                Ilość:
            <asp:DropDownList ID="ddlAmount" runat="server"></asp:DropDownList><br/>
                <br />
                <asp:Button ID="btnAdd" runat="server" Text="Dodaj do koszyka" CssClass="button" ForeColor="#FFCCFF" OnClick="btnAdd_Click" />
                <br />
                <br />
            <asp:Label ID="lblResult" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td class="auto-style2">Numer produktu: <asp:Label ID="lblItemnr" runat="server" Text="Label"></asp:Label></td>
            
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label1" runat="server" Text="Dostępny" CssClass="productPrice"></asp:Label></td>
            
        </tr>
    </table>
</asp:Content>

