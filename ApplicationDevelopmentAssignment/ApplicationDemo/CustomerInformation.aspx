<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerInformation.aspx.cs" Inherits="ApplicationDevelopmentAssignment.ApplicationDemo.CustomerInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: white;
            color: black;
        }

        tr:nth-child(even) {
            background-color: lightpink;
        }

        tr.sprtr {
            border-top: 2px solid;
            border-bottom: 2px solid;
        }

        .auto-style1 {
            --bs-card-spacer-y: 1rem;
            --bs-card-spacer-x: 1rem;
            --bs-card-title-spacer-y: 0.5rem;
            --bs-card-border-width: 1px;
            --bs-card-border-color: var(--bs-border-color-translucent);
            --bs-card-border-radius: 0.375rem;
            --bs-card-box-shadow;
            --bs-card-inner-border-radius: calc(0.375rem - 1px);
            --bs-card-cap-padding-y: 0.5rem;
            --bs-card-cap-padding-x: 1rem;
            --bs-card-cap-bg: rgba(0, 0, 0, 0.03);
            --bs-card-cap-color;
            --bs-card-height;
            --bs-card-color;
            --bs-card-bg: #fff;
            --bs-card-img-overlay-padding: 1rem;
            --bs-card-group-margin: 0.75rem;
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            height: var(--bs-card-height);
            word-wrap: break-word;
            background-clip: border-box;
            border-radius: .25rem;
            -ms-flex-direction: column;
            left: 0px;
            top: 0px;
            width: 1121px;
            background-color: #fff;
        }

        .auto-style2 {
            flex: 0 0 100%;
            width: 127%;
            position: relative;
            -ms-flex: 0 0 100%;
            max-width: 100%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }

        .auto-style3 {
            width: 1105px;
        }
    </style>

    <div class="container">
        <div class="modal fade" id="mymodal" data-backdrop="false" role="dialog">
            <div class=" modal-dialog modal-dailog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add New Customer Information</h4>
                        <asp:Label ID="lblmsg" Text="" runat="server" />
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <label>CustomerID</label>
                        <asp:TextBox ID="txtCustomerID" CssClass="form-control" placeholder="CustomerID" runat="server" />
                        <label>First Name</label>
                        <asp:TextBox ID="txtfname" CssClass="form-control" placeholder="First Name" runat="server" />
                        <label>Last Name</label>
                        <asp:TextBox ID="txtlname" CssClass="form-control" placeholder="Last Name" runat="server" />
                        <label>Middle Initial</label>
                        <asp:TextBox ID="txtminitial" CssClass="form-control" placeholder="Middle Initial" runat="server" />
                        <label>Age</label>
                        <asp:TextBox ID="txtage" CssClass="form-control" placeholder="Age" runat="server" />
                        <label>Contact Number</label>
                        <asp:TextBox ID="txtcontact" CssClass="form-control" placeholder="Contact Number" runat="server" />
                        <label>Address</label>
                        <asp:TextBox ID="txtaddress" CssClass="form-control" placeholder="Address" runat="server" />
                        <asp:HiddenField ID="hdid" runat="server" />
                      
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnsave" CssClass="btn btn-primary" OnClick="btnsave_Click" Text="Save" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section id="section">
        <div class="row match-height">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <asp:Button Text="Add New Customer Information" ID="modal" CssClass="btn btn-primary" OnClick="modal_Click" runat="server" />
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12 col-12">
                                    <table>
                                        <asp:Repeater ID="rptr1" DataSourceID="ds1" runat="server">
                                            <HeaderTemplate>
                                                <tr>
                                                    <th>CustomerID</th>
                                                    <th>First Name</th>
                                                    <th>Last Name</th>
                                                    <th>Middle Initial</th>
                                                    <th>Age</th>
                                                    <th>Contact Number</th>
                                                    <th>Address</th>
                                                    <th>Action</th>
                                                </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr class="separator">
                                                    <td><%# Eval("CustomerID") %></td>
                                                    <td><%# Eval("First Name") %></td>
                                                    <td><%# Eval("Last Name") %></td>
                                                    <td><%# Eval("Middle Initial") %></td>
                                                    <td><%# Eval("Age") %></td>
                                                    <td><%# Eval("Contact Number") %></td>
                                                    <td><%# Eval("Address") %></td>
                                                    <td>
                                                        <asp:LinkButton ID="btnupdate" CommandName="Update" OnCommand="btnupdate_Command" CommandArgument='<%#Eval("CustomerID") %>' CssClass="btn btn-sm brn-primary" runat="server"><i class="glyphicon glyphicon-pencil"></i></asp:LinkButton>
                                                        <asp:LinkButton CommandName="Delete" ID="btndlt" CommandArgument='<%#Eval("CustomerID") %>'
                                                            OnClientClick="return confirm('Are you sure you want to delete this !');"
                                                            OnCommand="btndlt_Command" CssClass="btn btn-sm brn-danger" runat="server"><i class="glyphicon glyphicon-trash"></i></asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <asp:SqlDataSource ID="ds1" ConnectionString="<%$ConnectionStrings:Application %>" runat="server" SelectCommand="select * from CustomerInformation_Application" />
</asp:Content>
