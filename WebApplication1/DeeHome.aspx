<%@ Page MasterPageFile="~/Sample.Master" Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="DeeHome.aspx.cs"  Inherits="WebApplication1.DeeHome" %>

<asp:Content ContentPlaceHolderID="cntContents" ID="deeHome" runat="server">


    <div style="font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: small;">
    <div>
       <div style="padding-bottom:1%">
           Student Details Form
        </div>

        <br />

        <a  onclick="javascript:alert('Navigating');" >Google</a>
        <table style="padding: 1%; border-style: solid; border-width: thin; background-color:#FFFF99;" >
            <tr>
                <td>
                    <asp:Label ID="lblFName" runat="server" Text="First Name:"></asp:Label>
                </td>
                <td>
                        <asp:TextBox ID="txtFName" runat="server" Text="" ToolTip="Please enter your first name"></asp:TextBox>
                    <asp:RangeValidator ControlToValidate="txtFName" ID="rngValFName" runat="server" MinimumValue="3" MaximumValue="50" ErrorMessage="Name needs to be > 3 and < 50" Font-Bold="True" ForeColor="Maroon" ValidationGroup="detailGroup"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLName" runat="server" Text="Last Name:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" Text=""></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblAge" runat="server" Text="Age:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtAge" runat="server" Text=""></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  Font-Bold="True" ForeColor="Maroon" ControlToValidate="txtAge" ErrorMessage="Age is required" ValidationGroup="detailGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
                  <tr>
                <td>
                    <asp:Label ID="lblSex" runat="server" Text="Sex:"></asp:Label>
                </td>
                <td>
                 <asp:RadioButton ID="rbM" Checked="true" runat="server" GroupName="grpSex" Text="Male" />
                    <asp:RadioButton ID="rbF" runat="server" GroupName="grpSex" Text="Female" />
                </td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="lblEmail" runat="server" Text="Email Address:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Text=""></asp:TextBox>
                    <asp:RegularExpressionValidator  ID="rglValEmail" Font-Bold="True" ForeColor="Maroon" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail"  runat="server" ErrorMessage="Please enter a valid email address" ValidationGroup="detailGroup"></asp:RegularExpressionValidator>
                </td>
                  
            </tr>

             <tr>
                <td>
                    <asp:Label ID="lblCountry" runat="server" Text="Country:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList runat="server" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="true" ID="ddlCountry"  >
                        <asp:ListItem>---Select--</asp:ListItem>
                        <asp:ListItem>India</asp:ListItem>
                    </asp:DropDownList>
                </td>
                  
            </tr>
               <tr>
                <td>
                    <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlState" />
                </td>
                  
            </tr>
         
            <tr>
                <td colspan="2">

                    <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" Text="Submit" runat="server" OnClientClick="javascript:alert('Hey you are trying to submit');"  />
                    
                </td>
            </tr>
              <tr>
                <td colspan="2">

                    <asp:Button ID="btntUpdateDB" Text="Update DB" runat="server" OnClick="UpdateDBButtonClick" />
                    
                </td>
            </tr>
                <tr>
                <td colspan="2">

                 <asp:Label ID="lblError" Visible="false" runat="server" />
                    
                </td>
            </tr>
        </table>
    </div>
        </div>
  
</asp:Content>