<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="SuperUserPage.aspx.cs" Inherits="IBUSMedicalv2.SuperUserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="headerLinks" runat="server">
        <li><a href="Home.aspx">Home</a></li>
    <li><a href="UserLogin.aspx">Appointments</a></li>
    <li><a href="Reports.aspx">Patient Reports</a></li>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 col-xs-4 col-md-offset-4 col-xs-offset-4">
                <form runat="server">
                    <div>
                        <label for="ViewTables">View Database Tables:</label>
                        <asp:DropDownList ID="SelectDatabaseTables" runat="server" AutoPostBack="true" class="btn btn-default btn-sm form-control" OnSelectedIndexChanged="SelectTableNameForDisplay">
                            <asp:ListItem Value="Person">Person</asp:ListItem>
                            <asp:ListItem Value="Staff">Staff</asp:ListItem>
                            <asp:ListItem Value="Patient">Patient</asp:ListItem>
                            <asp:ListItem Value="Doctor">Doctor</asp:ListItem>
                            <asp:ListItem Value="Department">Department</asp:ListItem>
                            <asp:ListItem Value="Ward">Ward</asp:ListItem>
                            <asp:ListItem Value="Reports">Reports</asp:ListItem>
                            <asp:ListItem Value="Appointment">Appointment</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:GridView ID="ItemGrid" runat="server">
                    </asp:GridView>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
