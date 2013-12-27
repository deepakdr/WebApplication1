<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebApplication1.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">

        function sayHello() {
            alert('Hey Guys');
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Login Page
        </div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblFName" runat="server" Text="FName"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFName" runat="server" Text="FName" ToolTip="Please enter your first name"></asp:TextBox>
                    <asp:RangeValidator ID="rvFName" runat="server" MinimumValue="3" MaximumValue="50" Text="Name should be > 3 and < 50" ControlToValidate="txtFName"></asp:RangeValidator>
                </td>

            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLName" runat="server" Text="LName"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" Text="LName"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAge" runat="server" Text="Age"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rqvAge" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtAge"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Text=""></asp:TextBox>
                     <asp:RegularExpressionValidator  ID="rglValEmail" Font-Bold="True" ForeColor="Maroon" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"  runat="server" ErrorMessage="Please enter a valid email address" ValidationGroup="detailGroup"></asp:RegularExpressionValidator>
                </td>
            </tr>
            
            <tr>
                <td colspan="2">

                    <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />

                </td>
            </tr>
        </table>
    </form>
</body>
</html>
