<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageProducts.aspx.cs" Inherits="Pages_Management_ManageProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    Nazwa:</p>
<p>
    <asp:TextBox ID="txtName" runat="server" CssClass="inputs"></asp:TextBox>
</p>
<p>
    Typ:</p>
<p>
    <asp:DropDownList ID="ddType" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id" CssClass="inputs">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KosmetykiDBConnectionString %>" SelectCommand="SELECT * FROM [TypyProduktow] ORDER BY [Name]"></asp:SqlDataSource>
</p>
<p>
    Cena:</p>
<p>
    <asp:TextBox ID="txtPrice" runat="server" CssClass="inputs"></asp:TextBox>
</p>
<p>
    Zdjęcie:</p>
<p>
    <asp:DropDownList ID="ddImage" runat="server" CssClass="inputs">
    </asp:DropDownList>
</p>
<p>
    Opis:</p>
<p>
    <asp:TextBox ID="txtDescription" runat="server" Height="128px" TextMode="MultiLine" Width="270px" CssClass="inputs"></asp:TextBox>
</p>
<p>
    <asp:Button ID="btnSubmit" runat="server" Text="Zatwierdź" OnClick="btnSubmit_Click" CssClass="button" ForeColor="#FFCCFF" />
</p>
<p>
    <asp:Label ID="lblResult" runat="server"></asp:Label>
</p>
</asp:Content>

