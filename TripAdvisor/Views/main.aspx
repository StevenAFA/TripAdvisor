<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="TripAdvisor.Views.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet"
        id="theme_link"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.1/lux/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <title>Trips</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
                <div class="container-fluid">
                    <a runat="server" id="UserNameIfLogged" class="navbar-brand" href="#">TripAdvisor</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarColor01">
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Home
                                    <span class="visually-hidden">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" href="#">Login</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Services</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="myTrips.aspx">My Trips</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
                            </li>
                        </ul>
                        <input runat="server" id="txtSearch" class="form-control me-sm-2" type="search" placeholder="Search" aria-label="Search" />
                        <button id="btnSearch" runat="server" class="btn btn-secondary my-2 my-sm-0" type="submit" onserverclick="btnSearch_ServerClick">Search</button>
                    </div>
                </div>
            </nav>

            <div class="container">
                <div class="row" style="margin-top: 20px">
                    <asp:Repeater ID="repTrips" runat="server">
                        <HeaderTemplate></HeaderTemplate>
                        <ItemTemplate>
                            <div class="card" style="width: 18rem; margin-left: 12px">
                                <img src="<%# Eval("PhotoPath")%>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Name")%></h5>
                                    <p class="card-text"><%# Eval("Description")%></p>
                                    <a href="tripDetail.aspx?id=<%# Eval("Id")%>" class="btn btn-primary">Book for $<%# Eval("Price")%> /p</a>
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate></FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
                <div class="offcanvas-header">
                    <h5 id="offcanvasRightLabel">Profile</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <div class="card">
                        <div class="card-header">
                            Login
                        </div>
                        <div id="divLogin" runat="server" class="card-body">
                            <div class="form-group">
                                <div class="form-floating mb-3">
                                    <input runat="server" type="email" class="form-control" id="txtEmail" placeholder="name@example.com" />
                                    <label for="txtEmail">Email address</label>
                                </div>
                                <div class="form-floating">
                                    <input runat="server" type="password" class="form-control" id="txtPwd" placeholder="Password" />
                                    <label for="txtPwd">Password</label>
                                </div>
                                <hr />
                                <div class="row">
                                    <button runat="server" id="btnLogin" class="btn btn-primary" onserverclick="btnLogin_ServerClick">Login</button>
                                    <hr />
                                    <a class="btn btn-primary" data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample">Sign Up</a>
                                </div>
                            </div>
                        </div>
                        <div id="divLogout" runat="server" class="card-body" hidden="hidden">
                            <button runat="server" id="btnLogout" class="btn btn-primary" onserverclick="btnLogout_ServerClick">Logout</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasLeftLabel">
                <div class="offcanvas-header">
                    <h5 id="offcanvasLeftLabel">Sign Up</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <div class="card">
                        <div class="card-header">
                            Set up your credentials
                        </div>
                        <div id="div1" runat="server" class="card-body">
                            <div class="form-group">
                                <div class="form-floating mb-3">
                                    <input runat="server" type="text" class="form-control" id="txtDisplayName" placeholder="John Doe" />
                                    <label for="txtDisplayName">Name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input runat="server" type="email" class="form-control" id="txtSignUpEmail" placeholder="name@example.com" />
                                    <label for="txtSignUpEmail">Email address</label>
                                </div>
                                <div class="form-floating">
                                    <input runat="server" type="password" class="form-control" id="txtSignUpPwd" placeholder="Password" />
                                    <label for="txtSignUpPwd">Password</label>
                                </div>
                                <hr />
                                <div class="row">
                                    <button runat="server" id="btnSignUp" class="btn btn-primary" onserverclick="btnSignUp_ServerClick">Sign Up</button>
                                </div>
                            </div>
                        </div>
                        <div id="div2" runat="server" class="card-body" hidden="hidden">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
