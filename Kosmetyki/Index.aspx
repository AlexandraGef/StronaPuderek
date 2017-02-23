<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <asp:Panel ID="pnlProducts" runat="server">
            <br />
            <asp:TextBox ID="TextBox1" runat="server" BackColor="#F79BFB" BorderColor="#F79BFB" BorderStyle="None" Font-Bold="True" Font-Names="Brush Script MT" Font-Overline="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="True" ForeColor="#B800F4"  Width="1114px" style="margin-left: 0px" ReadOnly="True">
                POPULARNE
                                                                                                                                                                                                                                         </asp:TextBox>
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" CssClass="productImage" ImageUrl="~/Images/Products/CienieDoPowiek.jpg" PostBackUrl="~/Pages/Product.aspx?id=1" />
            <asp:ImageButton ID="ImageButton2" runat="server" CssClass="productImage" ImageUrl="~/Images/Products/korektor6.jpg" PostBackUrl="/Pages/Product.aspx?id=1030" />
            <asp:ImageButton ID="ImageButton3" runat="server" CssClass="productImage" ImageUrl="~/Images/Products/blyszczyk6.jpg" PostBackUrl="/Pages/Product.aspx?id=1011" />
            <asp:ImageButton ID="ImageButton4" runat="server" CssClass="productImage" ImageUrl="~/Images/Products/tusz6.jpg" PostBackUrl="/Pages/Product.aspx?id=1037" />
            <asp:ImageButton ID="ImageButton5" runat="server" CssClass="productImage" ImageUrl="~/Images/Products/szminka3.jpg" PostBackUrl="/Pages/Product.aspx?id=1077" />
            <asp:ImageButton ID="ImageButton6" runat="server" CssClass="productImage" ImageUrl="~/Images/Products/roz4.jpg" PostBackUrl="/Pages/Product.aspx?id=1057" />
            
            <asp:TextBox ID="TextBox2" runat="server" Width="160px" BackColor="#F79BFB" BorderColor="#F79BFB" BorderStyle="None" Font-Bold="True" ForeColor="#B800F4" ReadOnly="True" Font-Italic="True">   Chanel  Les 4 Ombres</asp:TextBox>
            
            <asp:TextBox ID="TextBox3" runat="server" BackColor="#F79BFB" CssClass="podpis" Width="160px" ReadOnly="True" Font-Italic="True">              Bourjois CC</asp:TextBox>
           
            <asp:TextBox ID="TextBox4" runat="server" CssClass="podpis" Width="172px" ReadOnly="True" Font-Italic="True">       Collistar Gloss Design</asp:TextBox>
          
            <asp:TextBox ID="TextBox5" runat="server" CssClass="podpis" Width="160px" ReadOnly="True" Font-Italic="True">        Artdeco Angel Eyes</asp:TextBox>
           
            <asp:TextBox ID="TextBox6" runat="server" CssClass="podpis" Width="191px" ReadOnly="True" Font-Italic="True">        New York Colour Expert</asp:TextBox>
           
            <asp:TextBox ID="TextBox7" runat="server" CssClass="podpis" Width="160px" ReadOnly="True" Font-Italic="True" >    Catrice Blush Artist</asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="TextBox8" runat="server" CssClass="podpis" Font-Overline="False" Font-Underline="True" Height="16px" Width="1092px" Font-Bold="True" ReadOnly="True">                                                                                                                                                                                                                                                                                                .</asp:TextBox>
            <br />
            <br />
            <br />
    </asp:Panel>
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <asp:Timer runat="server" Interval="1500" OnTick="Unnamed1_Tick"></asp:Timer>
            <asp:Image ID="Image1" Height="300px" Width="1055px" runat="server"></asp:Image>
        </ContentTemplate>
    </asp:UpdatePanel>
   <asp:Panel ID="Panel1" runat="server">
        <br />
        <br />
        <asp:TextBox ID="TextBox9" runat="server" BackColor="#F79BFB" BorderColor="#F79BFB" BorderStyle="None" Font-Bold="True" Font-Names="Brush Script MT" Font-Overline="False" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="True" ForeColor="#B800F4"  Width="1114px" style="margin-left: 0px" ReadOnly="True">
                PROMOCJE
                                                                                                                                                                                                                                         </asp:TextBox>
            <br />
            <asp:ImageButton ID="ImageButton7" runat="server" CssClass="productImage" ImageUrl="~/Images/Products/kredkadoust.jpg" PostBackUrl="~/Pages/Product.aspx?id=1009" />
            <asp:ImageButton ID="ImageButton8" runat="server" CssClass="productImage" ImageUrl="~/Images/Products/CienieDoBrwi.jpg" PostBackUrl="~/Pages/Product.aspx?id=1008" />
            <asp:ImageButton ID="ImageButton9" runat="server" CssClass="productImage" ImageUrl="~/Images/Products/RozDoPoliczkow.jpg" PostBackUrl="~/Pages/Product.aspx?id=1005" />
            <asp:ImageButton ID="ImageButton10" runat="server" CssClass="productImage" ImageUrl="~/Images/Products/podklad2.jpg" PostBackUrl="~/Pages/Product.aspx?id=1069" />
            <asp:ImageButton ID="ImageButton11" runat="server" CssClass="productImage" ImageUrl="~/Images/Products/blyszczyk7.jpg" PostBackUrl="~/Pages/Product.aspx?id=1017" />
            <asp:ImageButton ID="ImageButton12" runat="server" CssClass="productImage" ImageUrl="~/Images/Products/puder6.jpg" PostBackUrl="~/Pages/Product.aspx?id=1052" />
            
            <asp:TextBox ID="TextBox10" runat="server" Width="160px" BackColor="#F79BFB" BorderColor="#F79BFB" BorderStyle="None" Font-Bold="True" ForeColor="#B800F4" ReadOnly="True" Font-Italic="True">        Kredka do ust Emily</asp:TextBox>
            
            <asp:TextBox ID="TextBox11" runat="server" BackColor="#F79BFB" CssClass="podpis" Width="160px" ReadOnly="True" Font-Italic="True">                Form a Brow</asp:TextBox>
           
            <asp:TextBox ID="TextBox12" runat="server" CssClass="podpis" Width="172px" ReadOnly="True" Font-Italic="True">                 Róż Bourjois</asp:TextBox>
          
            <asp:TextBox ID="TextBox13" runat="server" CssClass="podpis" Width="165px" ReadOnly="True" Font-Italic="True">            Paese Long Cover</asp:TextBox>
           
            <asp:TextBox ID="TextBox14" runat="server" CssClass="podpis" Width="182px" ReadOnly="True" Font-Italic="True">         Maybelline Color Elixir </asp:TextBox>
           
            <asp:TextBox ID="TextBox15" runat="server" CssClass="podpis" Width="190px" ReadOnly="True" Font-Italic="True" > Maybelline Shape Your Face </asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="TextBox16" runat="server" CssClass="podpis" Font-Overline="False" Font-Underline="True" Height="16px" Width="1092px" Font-Bold="True" ReadOnly="True">                                                                                                                                                                                                                                                                                                .</asp:TextBox>
            <br />
            <br />
       </asp:Panel>
</asp:Content>

