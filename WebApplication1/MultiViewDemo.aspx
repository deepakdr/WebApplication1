<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiViewDemo.aspx.cs" Inherits="WebApplication1.MultiViewDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Menu
        ID="Menu1"
        Width="168px"
        runat="server"
        Orientation="Horizontal"
        StaticEnableDefaultPopOutImage="False" BackColor="#E3EAEB" 
        DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#666666" 
        StaticSubMenuIndent="10px" OnMenuItemClick="Menu1_MenuItemClick"
        >
        <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <DynamicMenuStyle BackColor="#E3EAEB" />
        <DynamicSelectedStyle BackColor="#1C5E55" />
    <Items>
        <asp:MenuItem Text="Home" Value="0"></asp:MenuItem>
        <asp:MenuItem Text="Details" Value="1"></asp:MenuItem>
        <asp:MenuItem Text="Contact" Value="2"></asp:MenuItem>
    </Items>
        <StaticHoverStyle BackColor="#666666" ForeColor="White" />
        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
        <StaticSelectedStyle BackColor="#1C5E55" />
</asp:Menu>

        <asp:MultiView ActiveViewIndex="0" ID="mltView" runat="server">
            <asp:View ID="vw1" runat="server" >
                <span>
                    This is just home
                </span>
            </asp:View>
            <asp:View ID="View1" runat="server" >
                <span>
                    Welcome to Details
                </span>
            </asp:View>
            <asp:View ID="View2" runat="server" >
                <span>
                    Welcome to About
                </span>
            </asp:View>

        </asp:MultiView>
    </div>
    </form>
</body>
</html>
