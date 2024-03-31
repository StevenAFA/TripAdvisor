<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="tripDetail.aspx.cs" Inherits="TripAdvisor.Views.tripDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet"
        id="theme_link"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.3.1/lux/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <title>Trip Details</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--Menu--%>
            <nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
                <div class="container-fluid">
                    <a runat="server" id="UserNameIfLogged" class="navbar-brand" href="#">TripAdvisor</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarColor01">
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a class="nav-link active" href="main.aspx">Home
                        <span class="visually-hidden">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#">Separated link</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <%--Repetidor--%>
            <div class="row" style="margin-top: 20px; display: flex; justify-content: center; align-items: center;">
                <asp:Repeater ID="repTrip" runat="server">
                    <HeaderTemplate></HeaderTemplate>
                    <ItemTemplate>
                        <%--Detalle del trip--%>
                        <div class="card mb-3" style="width: 18rem; margin-left: 12px; height: auto">
                            <h3 class="card-header"><%# Eval("Name")%></h3>
                            <img src="<%# Eval("PhotoPath")%>" class="d-block w-100" alt="..." />
                            <div class="card-body">
                            </div>
                            <ul class="list-group list-group-flush">
                                <!-- Información del usuario -->
                                <li class="list-group-item">
                                    <div class="row">
                                        <div class="col-2">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-hearts" viewBox="0 0 16 16">
                                                <path fill-rule="evenodd" d="M11.5 1.246c.832-.855 2.913.642 0 2.566-2.913-1.924-.832-3.421 0-2.566M9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0m-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4m13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276ZM15 2.165c.555-.57 1.942.428 0 1.711-1.942-1.283-.555-2.281 0-1.71Z" />
                                            </svg>
                                        </div>
                                        <div class="col-10">
                                            9,836 opiniones
                                        </div>
                                    </div>
                                </li>

                                <!-- Ubicación del hotel -->
                                <li class="list-group-item">
                                    <div class="row">
                                        <div class="col-2">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                                <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10m0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6" />
                                            </svg>
                                        </div>
                                        <div class="col-10">
                                            N.º 4 de 95 hoteles en Legian
                                        </div>
                                    </div>
                                </li>

                                <!-- Número de contacto -->
                                <li class="list-group-item">
                                    <div class="row">
                                        <div class="col-2">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
                                                <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z" />
                                            </svg>
                                        </div>
                                        <div class="col-10">
                                            +160322508000
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <%--Carrousel de imagenes--%>
                        <div class="card" style="width: 50rem; margin-left: 12px; height: 35rem">
                            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="../Assets/images/<%# Eval("Id")%>/1.jpg" class="d-block w-100" alt="..." />
                                    </div>
                                    <div class="carousel-item">
                                        <img src="../Assets/images/<%# Eval("Id")%>/2.jpg" class="d-block w-100" alt="..." />
                                    </div>
                                    <div class="carousel-item">
                                        <img src="../Assets/images/<%# Eval("Id")%>/3.jpg" class="d-block w-100" alt="..." />
                                    </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate></FooterTemplate>
                </asp:Repeater>
                <%--Detalle de la reservacion--%>
                <div class="card" style="width: 30rem; margin-left: 12px; height: 35rem">
                    <div class="card-header">
                        Customize your trip                                
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="dtCheckin" class="form-label mt-4">Check In</label>
                                </div>
                                <div class="col">
                                    <input runat="server" type="date" class="form-control" id="dtCheckin" placeholder="date" autocomplete="off" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="checkout" class="form-label mt-4">Check Out</label>
                                </div>
                                <div class="col">
                                    <input runat="server" type="date" class="form-control" id="dtCheckOut" placeholder="date" autocomplete="off" />
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="form-group">
                            <div class="row">
                                <div class="col">
                                    <label for="checkout" class="form-label mt-4">Adults</label>
                                </div>
                                <div class="col">
                                    <select runat="server" class="form-select" id="selectAdults">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <hr />
                        <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                            <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked="" />
                            <label class="btn btn-outline-primary" for="btnradio1">9:30 am</label>
                            <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" checked="" />
                            <label class="btn btn-outline-primary" for="btnradio2">1:30 pm</label>
                            <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" checked="" />
                            <label class="btn btn-outline-primary" for="btnradio3">4:30 pm</label>
                        </div>
                        <hr />
                        <div class="form-group">
                            <div class="row">
                                <label for="checkout" class="form-label mt-4">3 Adults x $<label runat="server" id="tripPrice"></label></label>
                            </div>
                            <div class="row">
                                <h4>Total $234.00</h4>
                            </div>
                            <div class="row">
                                <h6>(no additional taxes or booking fees)</h6>
                            </div>
                            <div class="row">
                                <button runat="server" id="btnSaveBooked" class="btn btn-primary" onserverclick="btnSaveBooked_ServerClick">Reserve now</button>
                            </div>
                            <div runat="server" id="alertError" class="alert alert-danger" hidden="hidden" role="alert">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
