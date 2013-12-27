<%@ Page MasterPageFile="~/Sample.Master" Language="C#" AutoEventWireup="true" CodeBehind="DetailsPage.aspx.cs" Inherits="WebApplication1.DetailsPage" %>

<%@ Register Src="~/WebUserControl1.ascx" TagPrefix="CC1" TagName="WebUserControl1" %>


<asp:Content runat="server" ContentPlaceHolderID="cntContents">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div>

        <asp:UpdatePanel UpdateMode="Conditional" ID="upGrid" runat="server">
            <ContentTemplate>

                <asp:Button ID="btnRefreshGrid" runat="server" Text="Refresh Grid.." OnClick="btnRefreshGrid_Click" />

                <asp:GridView Font-Names="verdana" Font-Size="10pt"
                    AllowSorting="True" AllowPaging="True" PageSize="5"
                    AutoGenerateColumns="False" ID="grdViewDetails"
                    runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                    OnRowEditing="GridViewRowEditingEvent"
                    OnRowCancelingEdit="GridViewCancelEditEvent"
                    OnRowUpdating="GridViewUpdateEditEvent"
                    OnRowDeleting="GridViewDeleting"
                    OnRowDataBound="GridViewRowDataBound"
                    OnSorting="GridViewSortingEvent"
                    OnPageIndexChanging="GridViewPaginationEvent">

                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                    <Columns>
                        <%-- In case if you dont want the user to edit you can use BoundField --%>
                        <%-- A boundfield gives your more control on representing the data --%>
                        <%-- Also, ensure that you say false to autogeneratecolumns --%>

                        <%-- <asp:BoundField DataField="FirstName" HeaderText="First Name" />
             <asp:BoundField DataField="LastName" HeaderText="Last Name" />
             <asp:BoundField DataField="Age" HeaderText="Age" />--%>

                        <asp:BoundField SortExpression="ID" DataField="ID" Visible="true" ReadOnly="true" HeaderText="ID" />
                        <asp:TemplateField SortExpression="FirstName" HeaderText="First Name">

                            <EditItemTemplate>
                                <asp:TextBox ID="txtGVFirstName" Text='<%# Bind("FirstName") %>' runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGVFirstName" Text='<%# Bind("FirstName") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="LastName" HeaderText="Last Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtGVLastName" Text='<%# Bind("LastName") %>' runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGVLastName" Text='<%# Bind("LastName") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="Age" HeaderText="Age">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtGVAge" Text='<%# Bind("Age") %>' runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblGVAge" Text='<%# Bind("Age") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField SortExpression="Sex" HeaderText="Gender">
                            <EditItemTemplate>
                                <asp:DropDownList ID="grdDDLGender" runat="server" />
                            </EditItemTemplate>
                            <ItemTemplate>


                                <asp:Label ID="lblSex" Text='<%# Bind("Sex") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:CommandField ShowEditButton="true" ButtonType="Image" CancelImageUrl="~/images/Close-2-icon.png" UpdateImageUrl="~/images/Save-icon.png" ControlStyle-Width="15px" ControlStyle-Height="15px" EditImageUrl="~/images/Pencil-icon.png" EditText="(E)">
                            <ControlStyle Height="15px" Width="15px"></ControlStyle>
                        </asp:CommandField>
                        <asp:CommandField ButtonType="Image" ControlStyle-Width="15px" ControlStyle-Height="15px" DeleteImageUrl="~/images/Trash-can-icon.png" ShowDeleteButton="true" DeleteText="X"
                            ControlStyle-ForeColor="Red" ControlStyle-Font-Size="9pt" ControlStyle-Font-Bold="true">
                            <ControlStyle Font-Bold="True" Font-Size="9pt" ForeColor="Red" Height="15px" Width="15px"></ControlStyle>
                        </asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

                </asp:GridView>

                

            </ContentTemplate>
        

        </asp:UpdatePanel>

        <asp:UpdatePanel ID="upCount" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Label ID="lblMessage" runat="server" Text="The total count of records: " />
                <asp:Label ID="lblCount" runat="server" />
                <asp:Label ID="lblLastUpdate" runat="server"></asp:Label>

                <asp:Timer ID="tmrCount" runat="server" OnTick="tmrCount_Tick"
                    Interval="5000"></asp:Timer>

            </ContentTemplate>

        </asp:UpdatePanel>


        <asp:UpdateProgress ID="upProgressGrid" AssociatedUpdatePanelID="upGrid" 
            runat="server">
            
            <ProgressTemplate>

                <div id="progressDiv" style="background-color: #99FF99; font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: small; font-style: italic; font-weight: bold; border-style: double" >
                <table>
                    <tr>
                        <td>
                            <img src="images/ajax-loader.gif" />

                        </td>
                        <td>
                            <div id="msgProgressDiv">Please Wait..</div>
                        </td>
                        
                    </tr>
                </table>
            </div>

            </ProgressTemplate>

        </asp:UpdateProgress>


        <asp:DataGrid ID="grdDetailsView" Visible="false" runat="server" OnSortCommand="grdDetailsView_SortCommand" ItemStyle-BackColor="#6699FF" ItemStyle-BorderColor="Black" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-ForeColor="#333333" AlternatingItemStyle-BackColor="#000099" AlternatingItemStyle-BorderColor="Black" AlternatingItemStyle-BorderStyle="Solid" AlternatingItemStyle-BorderWidth="1" AlternatingItemStyle-ForeColor="White" Font-Names="Verdana" Font-Size="10pt" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" AllowSorting="True">
        </asp:DataGrid>
        <asp:Button ID="btnPopulateGrid" Visible="false" OnClick="btnPopulateGrid_Click" Text="Populate Grid" runat="server" />
        <asp:Button ID="btnUpdate" Visible="false" OnClick="btnUpdate_Click" Text="Update" runat="server" />
    </div>

</asp:Content>
