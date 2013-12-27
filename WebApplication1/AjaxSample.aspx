<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxSample.aspx.cs" Inherits="WebApplication1.AjaxSample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" />
            <div>

                <asp:Panel runat="server" GroupingText="Panel 1">


                </asp:Panel>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <fieldset style="width: 30%">
                            <legend>Update Panel-1</legend>
                            <asp:Label ID="lbl1" runat="server" ForeColor="green" /><br />
                            <asp:Button ID="btnUpdate1" runat="server" Text="Update Both Panels" OnClick="btnUpdate1_Click" />
                            <asp:Button ID="btnUpdate2" runat="server" Text="Update This Panel" OnClick="btnUpdate2_Click" />
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <fieldset style="width: 30%">
                            <legend>Update Panel-2</legend>
                            <asp:Label ID="lbl2" runat="server" ForeColor="red" />
                        </fieldset>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnUpdate1" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>


                <asp:Panel runat="server" >
                    <asp:TextBox ID="idTxtTest" runat="server" />
                    <asp:Button ID="btnWithoutUP" OnClick="btnWithoutUP_Click" Text="Without AJAX" runat="server" />

                </asp:Panel>
            </div>
    </form>
</body>
</html>
