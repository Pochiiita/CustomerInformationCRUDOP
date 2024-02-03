<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ApplicationDevelopmentAssignment.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Your contact page.</h3>
        <address>
            #24 Retelco Drive, Bagong Ilog, Pasig City<br />
            <abbr title="Phone">P:</abbr>
            +639 515291127
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:annalynpelaez26@gmail.com">annalynpelaez26@gmail.com</a><br />
        </address>
    </main>
</asp:Content>
