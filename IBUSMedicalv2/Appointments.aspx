<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Appointments.aspx.cs" Inherits="IBUSMedicalv2.Appointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(function () {
            $("#<%= InputAppointmentDate.ClientID %>").datepicker();
        });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="title" runat="server">
    IBUS::Appointments
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="headerLinks" runat="server">
    <li><a href="Home.aspx">Home</a></li>
    <li class="active"><a href="#">Appointments</a></li>
    <li><a href="Reports.aspx">Patient Reports</a></li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <form runat="server">
            <div class="row">
                <div class="col-md-4 col-xs-4 col-md-offset-4 col-xs-offset-4">
                    <h3>Appointment Details</h3>
                    <div class="form-group">
                        <label for="DoctorID">Doctor:</label>
                        <asp:DropDownList ID="SelectDoctorDropDownList" runat="server" class="btn btn-default btn-sm form-control">
                        </asp:DropDownList>

                        <label for="appointmentDate">Appointment Date:</label>
                        <asp:TextBox ID="InputAppointmentDate" runat="server" class="form-control"></asp:TextBox>

                        <label for="appointmentTime">Appointment Time:</label>
                        <asp:TextBox ID="InputAppointmentTime" runat="server" class="form-control"></asp:TextBox>

                        <label for="appointmentDetails">Details:</label>
                        <asp:TextBox ID="InputAppointmentDeatils" runat="server" class="form-control"></asp:TextBox>

                    </div>
                    <asp:Button runat="server" class="btn btn-default" Text="Submit" OnClick="CreateAppointment"/>

                </div>
            </div>
        </form>
    </div>
</asp:Content>
