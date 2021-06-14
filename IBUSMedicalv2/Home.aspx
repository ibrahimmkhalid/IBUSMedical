<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="IBUSMedicalv2.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="title" runat="server">
    IBUS::Home
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="headerLinks" runat="server">
    <li class="active"><a href="#">Home</a></li>
    <li><a href="UserLogin.aspx">Appointments</a></li>
    <li><a href="Reports.aspx">Patient Reports</a></li>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="jumbotron">
            <h1>Welcome to IBUS Medical</h1>
            <p>State of the art hospital and medical services, world wide recognized doctors, just a few clicks away.</p>
        </div>
    </div>
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="images/banner-1.png" style="width: 100%;">
                </div>

                <div class="item">
                    <img src="images/banner-2.png" style="width: 100%;">
                </div>

                <div class="item">
                    <img src="images/banner-3.png" style="width: 100%;">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</asp:Content>
