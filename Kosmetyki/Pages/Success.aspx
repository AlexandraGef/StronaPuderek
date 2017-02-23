<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Success.aspx.cs" Inherits="Pages_Success" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="pnlShoppingCart" runat="server"></asp:Panel>
    <table align="center">
        <tr>
            <td>Cena<b>: </b></td>
            <td>
                <asp:Literal ID="litTotal" runat="server" Text="" /></td>
        </tr>
        <tr>
            <td><b>Vat: </b></td>
            <td>
                <asp:Literal ID="litVat" runat="server" Text="" /></td>
        </tr>
        <tr>
            <td><b>Wysyłka: </b></td>
            <td>10 zł</td>
        </tr>
        <tr>
            <td><b>Całość: </b></td>
            <td>
                <asp:Literal ID="litTotalAmount" runat="server" Text="" /></td>
            <asp:Literal ID="Literal1" runat="server" Text="" Visible="False" />
        </tr>
        <tr>
            <td>
    </table>
    <br />
    <br />
     <asp:TextBox ID="TextBox5" runat="server" BackColor="#F79BFB" BorderStyle="None" Font-Size="X-Large" Style="margin-left: 0px" Width="246px" Font-Bold="True" Font-Names="Garamond" ForeColor="#9900CC" ReadOnly="True" Font-Italic="True">Wiadomość do sprzedającego</asp:TextBox>
    <br />
    <br />
     
    <asp:TextBox ID="TextBox6" runat="server" CssClass="inputs" Height="104px" TextMode="MultiLine"></asp:TextBox>
     
    <br />
    <br />
     <asp:TextBox ID="TextBox4" runat="server" BackColor="#F79BFB" BorderStyle="None" Font-Size="X-Large" Style="margin-left: 0px" Width="207px" Font-Bold="True" Font-Names="Garamond" ForeColor="#9900CC" ReadOnly="True" Font-Italic="True">Wybierz formę wysyłki</asp:TextBox>
      <br />
    <br />
    <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#FF99FF" Font-Bold="True" Font-Names="Garamond" Font-Size="Large" CssClass="inputs">
        <asp:ListItem Selected="True" Value="pusto">Wybierz</asp:ListItem>
        <asp:ListItem Value="List ekonomiczny">List ekonomiczny</asp:ListItem>
        <asp:ListItem Value="List priorytetowy">List priorytetowy</asp:ListItem>
        <asp:ListItem Value="List polecony ekonomiczny">List polecony ekonomiczny</asp:ListItem>
        <asp:ListItem Value="List polecony priorytetowy">List polecony priorytetowy</asp:ListItem>
        <asp:ListItem Value="Paczka pocztowa">Paczka pocztowa</asp:ListItem>
        <asp:ListItem Value="Przesyłka kurierska">Przesyłka kurierska</asp:ListItem>
        <asp:ListItem Value="Paczkomat">Paczkomat</asp:ListItem>

    </asp:DropDownList>
    <br />
    <br />
    <asp:TextBox ID="TextBox1" runat="server" BackColor="#F79BFB" BorderStyle="None" Font-Size="X-Large" Style="margin-left: 0px" Width="215px" Font-Bold="True" Font-Names="Garamond" ForeColor="#9900CC" ReadOnly="True" Font-Italic="True">Wybierz formę płatności</asp:TextBox>
    <br />
    <br />
    <asp:DropDownList ID="droplistbank" runat="server" AutoPostBack="True" BackColor="#FF99FF" Font-Bold="True" Font-Names="Garamond" Font-Size="Large" OnSelectedIndexChanged="banki" CssClass="inputs">
        <asp:ListItem Selected="True" Value="wybierz">Wybierz</asp:ListItem>
        <asp:ListItem Value="Platnosc przy odbiorze">Płatność przy odbiorze</asp:ListItem>
        <asp:ListItem Value="Płatnosc z gory">Płatność z góry</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:Panel ID="PanelBank" runat="server">
        <asp:TextBox ID="TextBox2" runat="server" BackColor="#F79BFB" BorderStyle="None" Font-Bold="True" Font-Names="Garamond" Font-Size="X-Large" ForeColor="#9900CC" Width="142px" ReadOnly="True">Wybierz bank</asp:TextBox>
        <br />
        <br />
        <asp:TextBox ID="TextBox3" runat="server" Width="595px" BackColor="#F79BFB" BorderStyle="None" Font-Names="Garamond" Font-Size="Medium" ForeColor="#9900CC" ReadOnly="True">Wybierając bank potwierdzasz transakcję, po czym zostaniesz przekierowany na stronę banku.</asp:TextBox>
        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" CssClass="bank" ImageUrl="~/Images/banki/eurobank.jpg" CausesValidation="True" OnClick="ImageButton1_Click" />
        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/banki/bank-BGZ.jpg" CssClass="bank" OnClick="ImageButton2_Click" />
        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/banki/bph.jpg" CssClass="bank" OnClick="ImageButton3_Click" />
        <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/banki/bz-wbk.jpg" CssClass="bank" OnClick="ImageButton4_Click" />
        <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/Images/banki/PKO-BANK-POLSKI-RGB-31mm.jpg" CssClass="bank" OnClick="ImageButton5_Click" />
        <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/Images/banki/raiffeisenbank-logo260x240.png" CssClass="bank" OnClick="ImageButton6_Click" />
        <asp:ImageButton ID="ImageButton7" runat="server" ImageUrl="~/Images/banki/mbank300x300.jpg" CssClass="bank" OnClick="ImageButton7_Click" />
        <br />
        <asp:ImageButton ID="ImageButton8" runat="server" ImageUrl="~/Images/banki/Nordea-Visionsgruppe1.png" CssClass="bank" OnClick="ImageButton8_Click" />
        <asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/Images/banki/lokata-zysk-co-miesiac-bank-pocztowy_260_239.jpg" CssClass="bank" OnClick="ImageButton9_Click" />
        <asp:ImageButton ID="ImageButton10" runat="server" ImageUrl="~/Images/banki/pekao-300x300.jpg" CssClass="bank" OnClick="ImageButton10_Click" />
        <asp:ImageButton ID="ImageButton11" runat="server" ImageUrl="~/Images/banki/61ab4f8acd56b74a543642aa532e2eb0.jpg" CssClass="bank" OnClick="ImageButton11_Click" />
        <asp:ImageButton ID="ImageButton12" runat="server" ImageUrl="~/Images/banki/large_image.jpg" CssClass="bank" OnClick="ImageButton12_Click" />
        <asp:ImageButton ID="ImageButton13" runat="server" ImageUrl="~/Images/banki/logo-multibank.jpg" CssClass="bank" OnClientClick="PostBackUrl" OnClick="ImageButton13_Click" />
        <asp:ImageButton ID="ImageButton14" runat="server" ImageUrl="~/Images/banki/logo.png" CssClass="bank" OnClick="ImageButton14_Click" />

    </asp:Panel>
    <asp:Button ID="btnZatwierdz" runat="server" Text="Zatwierdź" CssClass="button" ForeColor="#FFCCFF" OnClick="btnZatwierdz_Click" />
    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
</asp:Content>

