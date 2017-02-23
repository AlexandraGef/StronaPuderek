<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Management.aspx.cs" Inherits="Pages_Management_Management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="button" PostBackUrl="~/Pages/Management/ManageProducts.aspx" ForeColor="#FF99FF">Dodaj nowy produkt</asp:LinkButton>
<br />
<br />
<asp:GridView ID="grdProducts" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sdsProducts" ForeColor="#CC00FF" Width="100%" BackColor="#FFCCFF" BorderColor="#660066" OnRowEditing="grdProduct_RowEditing">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="TypeId" HeaderText="TypeId" SortExpression="TypeId" />
        <asp:BoundField DataField="Nazwa" HeaderText="Nazwa" SortExpression="Nazwa" />
        <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
        <asp:BoundField DataField="Opis" HeaderText="Opis" SortExpression="Opis" />
        <asp:BoundField DataField="Zdjecie" HeaderText="Zdjecie" SortExpression="Zdjecie" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="sdsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:KosmetykiDBConnectionString %>" DeleteCommand="DELETE FROM [Produkty] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Produkty] ([TypeId], [Nazwa], [Cena], [Opis], [Zdjecie]) VALUES (@TypeId, @Nazwa, @Cena, @Opis, @Zdjecie)" SelectCommand="SELECT * FROM [Produkty]" UpdateCommand="UPDATE [Produkty] SET [TypeId] = @TypeId, [Nazwa] = @Nazwa, [Cena] = @Cena, [Opis] = @Opis, [Zdjecie] = @Zdjecie WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="TypeId" Type="Int32" />
        <asp:Parameter Name="Nazwa" Type="String" />
        <asp:Parameter Name="Cena" Type="Double" />
        <asp:Parameter Name="Opis" Type="String" />
        <asp:Parameter Name="Zdjecie" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="TypeId" Type="Int32" />
        <asp:Parameter Name="Nazwa" Type="String" />
        <asp:Parameter Name="Cena" Type="Double" />
        <asp:Parameter Name="Opis" Type="String" />
        <asp:Parameter Name="Zdjecie" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<br />
<asp:LinkButton ID="LinkButton2" runat="server" CssClass="button" PostBackUrl="~/Pages/Management/ManageProductTypes.aspx" ForeColor="#FF99FF">Dodaj nowy typ produktu</asp:LinkButton>
<br />
<br />
<asp:GridView ID="grdProductsTypes" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sdsProductTypes" ForeColor="#CC00FF" Width="28%" BackColor="#FFCCFF" BorderColor="#660066">
    <Columns>
        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="sdsProductTypes" runat="server" ConnectionString="<%$ ConnectionStrings:KosmetykiDBConnectionString %>" DeleteCommand="DELETE FROM [TypyProduktow] WHERE [Id] = @Id" InsertCommand="INSERT INTO [TypyProduktow] ([Name]) VALUES (@Name)" SelectCommand="SELECT * FROM [TypyProduktow]" UpdateCommand="UPDATE [TypyProduktow] SET [Name] = @Name WHERE [Id] = @Id">
    <DeleteParameters>
        <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="Name" Type="String" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
    <br />
    <asp:GridView ID="opinie" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" BackColor="#FFCCFF" BorderColor="#660066" ForeColor="#CC00FF" >
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Imie" HeaderText="Imie" SortExpression="Imie" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Opinia" HeaderText="Opinia" SortExpression="Opinia" />
        </Columns>
    </asp:GridView>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:KosmetykiDBConnectionString %>" DeleteCommand="DELETE FROM [Opinie] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Opinie] ([Imie], [Email], [Opinia]) VALUES (@Imie, @Email, @Opinia)" SelectCommand="SELECT * FROM [Opinie]" UpdateCommand="UPDATE [Opinie] SET [Imie] = @Imie, [Email] = @Email, [Opinia] = @Opinia WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Imie" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Opinia" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Imie" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Opinia" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    </asp:Content>

