<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <link
            href='https://site-assets.fontawesome.com/releases/v6.0.0/css/all.css?fbclid=IwAR0zP-eGpeNIPDXxwVIGkEgfmGdz79xPZXfbalbDgXEsOSmbWdm2IeUnlJ4'
            rel='stylesheet'>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
        <title>Lost and Found on FPT University</title>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <button type="button" class="btn btn-danger btn-floating btn-lg" id="btn-back-to-top" data-toggle="tooltip"
                data-placement="left" title="back to top">
            <i class="fas fa-arrow-up"></i>
        </button>


        <nav class="navbar navbar-default navbar-expand-sm fixed-top" id="navbar">
            <!-- navbar-dark -->
            <div class="container" id="nav_header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand mr-auto" href="ViewList_index"><img src="images/logo.svg" height="50" width="150"></a>
                <div class="collapse navbar-collapse" id="Navbar">
                    <ul class="navbar-nav mr-auto nav-header-bar">
                        <li class="nav-item active" id="nav-item">
                            <a class="nav-link" href="ViewList_index"><span class="fa fa-home fa-lg"></span> Home</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="ViewList_found">Found</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ViewList_lost"> Lost</a>
                        </li>
                    </ul>
                    <form action="SearchServlet" method="POST">
                        <div class="input-group">
                            <input type="text" class="form-control" name="search" aria-label="Recipient's username" aria-describedby="button-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-light" type="submit" id="button-addon2">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <c:choose>
                        <c:when test="${sessionScope.member!=null}">
                            <ul id="main" class="nav-item">
                                <li>
                                    Hello ${member.getUsername()}                                    
                                    <ul class="drop">
                                        <div class="drop__user__menu">
                                            <li><a href="proFile.jsp">View Profile</a></li>
                                            <li><a href="YourPost">Your Post</a></li>
                                            <li><a href="Logout">Logout</a></li>
                                        </div>
                                    </ul>
                                </li>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <span class="ml-4 navbar-text">
                                <a id="loginButton">
                                    <span class="fa fa-sign-in-alt "></span> Login
                                </a>
                            </span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>

        <%@include file="./components/loginmodal.jsp" %>


        <header class="header" id="startchange">
            <div class="d-flex flex-column min-vh-100 bg-black-50 pt-10 pt-md-8 pb-7 pb-md-0"
                 style="background-color: rgba(0, 0, 0, 0.7);">
                <div class="container my-auto mx-auto">
                    <div class="row justify-content-center">
                        <div class="col-12 col-md-8 col-lg-8 text-center">
                            <!-- Preheading -->
                            <h3 class="text-xs text-light">
                                <h2 class="text-light">FPT University</h2>
                            </h3>
                            <!-- Heading -->
                            <h4 class="display-1 text-light mb-4 title-heading">
                                <strong>Lost and Found</strong>
                            </h4>
                            <a class="btn btn-outline-light btn-lg m-2" href="ViewList_found" role="button" rel="nofollow"
                               target="_blank">Bạn mất đồ?</a>
                            <a class="btn btn-outline-light btn-lg m-2" href="ViewList_lost" target="_blank" role="button">Bạn nhặt được
                                đồ?</a>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <section class="container my-5">


            <%@include file="./components/postItem.jsp" %>


            <div class="row mb-4">
                <div class="col-lg-8 mx-auto text-center">
                    <h2 class="fs-1">All Item here</h2>
                    <p class="mb-2">Phân loại tìm kiếm</p>
                </div>
            </div>

            <ul class="nav nav-pills nav-pills-bg-soft justify-content-sm-center mb-4 px-3" id="item-pills-tab"
                role="tablist">
                <!-- Tab item -->
                <li class="nav-item me-2 me-sm-5">
                    <button class="nav-link mb-2 mb-md-0 active" data-toggle="pill" data-target="#item-pills-tabs-0"
                            type="button" role="tab" aria-controls="item-pills-tabs-0" aria-selected="false">All</button>
                </li>
                <!-- Tab item -->
                <li class="nav-item me-2 me-sm-5">
                    <button class="nav-link mb-2 mb-md-0" data-toggle="pill" data-target="#item-pills-tabs-1"
                            type="button" role="tab" aria-controls="item-pills-tabs-1" aria-selected="false">Điện thoại</button>
                </li>
                <!-- Tab item -->
                <li class="nav-item me-2 me-sm-5">
                    <button class="nav-link mb-2 mb-md-0 " data-toggle="pill" data-target="#item-pills-tabs-2" type="button"
                            role="tab" aria-controls="item-pills-tabs-2" aria-selected="true">Thẻ</button>
                </li>
                <!-- Tab item -->
                <li class="nav-item me-2 me-sm-5 ">
                    <button class="nav-link mb-2 mb-md-0 " data-toggle="pill" data-target="#item-pills-tabs-3" type="button"
                            role="tab" aria-controls="item-pills-tabs-3" aria-selected="false">CMND/CCCD</button>
                </li>

                <!-- Tab item -->
                <li class="nav-item me-2 me-sm-5">
                    <button class="nav-link mb-2 mb-md-0" data-toggle="pill" data-target="#item-pills-tabs-4" type="button"
                            role="tab" aria-controls="item-pills-tabs-5" aria-selected="false">Bình nước</button>
                </li>
                <!-- Tab item -->
                <li class="nav-item me-2 me-sm-5">
                    <button class="nav-link mb-2 mb-md-0" data-toggle="pill" data-target="#item-pills-tabs-5" type="button"
                            role="tab" aria-controls="item-pills-tabs-6" aria-selected="false">Linh kiện</button>
                </li>
                <!-- Tab item -->
                <li class="nav-item me-2 me-sm-5">
                    <button class="nav-link mb-2 mb-md-0" data-toggle="pill" data-target="#item-pills-tabs-6" type="button"
                            role="tab" aria-controls="item-pills-tabs-7" aria-selected="false">Ví/bóp</button>
                </li>
                <!-- Tab item -->
                <li class="nav-item me-2 me-sm-5">
                    <button class="nav-link mb-2 mb-md-0" data-toggle="pill" data-target="#item-pills-tabs-7" type="button"
                            role="tab" aria-controls="item-pills-tabs-7" aria-selected="false">Chìa khóa</button>
                </li>
                <!-- Tab item -->
                <li class="nav-item me-2 me-sm-5">
                    <button class="nav-link mb-2 mb-md-0" data-toggle="pill" data-target="#item-pills-tabs-8" type="button"
                            role="tab" aria-controls="item-pills-tabs-7" aria-selected="false">Khác</button>
                </li>
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane container active" id="item-pills-tabs-0">
                    <div class="row row-cols-1 row-cols-md-3 g-4 ">
                        <c:forEach items="${list}" var="m">
                            <div class="col mb-4" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                <div class="card shadow h-100 card-detail">
                                    <!-- Image -->
                                    <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                    <div class="card-body pb-0" style="overflow: hidden">
                                        <!-- Badge and favorite -->
                                        <div class="d-flex justify-content-between mb-2">
                                            <a href="#" class="badge bg-purple bg-opacity-10 text-purple">#${m.getHashTag()}</a>
                                            <c:choose>
                                                <c:when test="${m.getCategory_name() == 'Lost'}">
                                                    <p class="text-danger"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                </c:when>
                                                <c:otherwise>
                                                    <p class="text-success"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <!-- Title -->
                                        <h5 class="card-title fw-normal"><a href="#">${m.getTitle()}</a></h5>
                                        <p class="text-truncate-2 mb-2">${m.getDescription()}</p>
                                    </div>
                                    <!-- Card footer -->
                                    <div class="card-footer pt-0 pb-3">
                                        <hr>
                                        <div class="d-flex justify-content-between">
                                            <span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>${m.getDate()}</span>
                                            <span class="h6 fw-light mb-0"><i
                                                    class="fas fa-location-arrow text-orange me-2"></i>${m.getLocation_lost_found()}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>

                    </div>
                </div>
                <div class="tab-pane container" id="item-pills-tabs-1">
                    <div class="row row-cols-1 row-cols-md-3 g-4 ">
                        <c:forEach items="${list}" var="m">
                            <c:if test="${m.getItem_type() == 'Điện thoại'}">
                                <div class="col mb-4" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0" style="overflow: hidden">
                                            <!-- Badge and favorite -->
                                            <div class="d-flex justify-content-between mb-2">
                                                <a href="#" class="badge bg-purple bg-opacity-10 text-purple">#${m.getHashTag()}</a>
                                                <c:choose>
                                                    <c:when test="${m.getCategory_name() == 'Lost'}">
                                                        <p class="text-danger"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="text-success"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <!-- Title -->
                                            <h5 class="card-title fw-normal"><a href="#">${m.getTitle()}</a></h5>
                                            <p class="text-truncate-2 mb-2">${m.getDescription()}</p>
                                        </div>
                                        <!-- Card footer -->
                                        <div class="card-footer pt-0 pb-3">
                                            <hr>
                                            <div class="d-flex justify-content-between">
                                                <span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>${m.getDate()}</span>
                                                <span class="h6 fw-light mb-0"><i
                                                        class="fas fa-location-arrow text-orange me-2"></i>${m.getLocation_lost_found()}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>    
                        </c:forEach>

                    </div>
                </div>
                <div class="tab-pane container " id="item-pills-tabs-2">
                    <div class="row row-cols-1 row-cols-md-3 g-4 ">
                        <c:forEach items="${list}" var="m">
                            <c:if test="${m.getItem_type() == 'Thẻ'}">


                                <div class="col mb-4" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0" style="overflow: hidden">
                                            <!-- Badge and favorite -->
                                            <div class="d-flex justify-content-between mb-2">
                                                <a href="#" class="badge bg-purple bg-opacity-10 text-purple">#${m.getHashTag()}</a>
                                                <c:choose>
                                                    <c:when test="${m.getCategory_name() == 'Lost'}">
                                                        <p class="text-danger"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="text-success"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <!-- Title -->
                                            <h5 class="card-title fw-normal"><a href="#">${m.getTitle()}</a></h5>
                                            <p class="text-truncate-2 mb-2">${m.getDescription()}</p>
                                        </div>
                                        <!-- Card footer -->
                                        <div class="card-footer pt-0 pb-3">
                                            <hr>
                                            <div class="d-flex justify-content-between">
                                                <span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>${m.getDate()}</span>
                                                <span class="h6 fw-light mb-0"><i
                                                        class="fas fa-location-arrow text-orange me-2"></i>${m.getLocation_lost_found()}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>    
                        </c:forEach>

                    </div>
                </div>
                <div class="tab-pane container " id="item-pills-tabs-3">
                    <div class="row row-cols-1 row-cols-md-3 g-4 ">
                        <c:forEach items="${list}" var="m">
                            <c:if test="${m.getItem_type() == 'CMND'}">
                                <div class="col mb-4" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0" style="overflow: hidden">
                                            <!-- Badge and favorite -->
                                            <div class="d-flex justify-content-between mb-2">
                                                <a href="#" class="badge bg-purple bg-opacity-10 text-purple">#${m.getHashTag()}</a>
                                                <c:choose>
                                                    <c:when test="${m.getCategory_name() == 'Lost'}">
                                                        <p class="text-danger"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="text-success"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <!-- Title -->
                                            <h5 class="card-title fw-normal"><a href="#">${m.getTitle()}</a></h5>
                                            <p class="text-truncate-2 mb-2">${m.getDescription()}</p>
                                        </div>
                                        <!-- Card footer -->
                                        <div class="card-footer pt-0 pb-3">
                                            <hr>
                                            <div class="d-flex justify-content-between">
                                                <span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>${m.getDate()}</span>
                                                <span class="h6 fw-light mb-0"><i
                                                        class="fas fa-location-arrow text-orange me-2"></i>${m.getLocation_lost_found()}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>    
                        </c:forEach>

                    </div>
                </div>
                <div class="tab-pane container " id="item-pills-tabs-4">
                    <div class="row row-cols-1 row-cols-md-3 g-4 ">
                        <c:forEach items="${list}" var="m">
                            <c:if test="${m.getItem_type() == 'Bình nước'}">
                                <div class="col mb-4" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0" style="overflow: hidden">
                                            <!-- Badge and favorite -->
                                            <div class="d-flex justify-content-between mb-2">
                                                <a href="#" class="badge bg-purple bg-opacity-10 text-purple">#${m.getHashTag()}</a>
                                                <c:choose>
                                                    <c:when test="${m.getCategory_name() == 'Lost'}">
                                                        <p class="text-danger"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="text-success"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <!-- Title -->
                                            <h5 class="card-title fw-normal"><a href="#">${m.getTitle()}</a></h5>
                                            <p class="text-truncate-2 mb-2">${m.getDescription()}</p>
                                        </div>
                                        <!-- Card footer -->
                                        <div class="card-footer pt-0 pb-3">
                                            <hr>
                                            <div class="d-flex justify-content-between">
                                                <span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>${m.getDate()}</span>
                                                <span class="h6 fw-light mb-0"><i
                                                        class="fas fa-location-arrow text-orange me-2"></i>${m.getLocation_lost_found()}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>    
                        </c:forEach>

                    </div>
                </div>
                <div class="tab-pane container " id="item-pills-tabs-5">
                    <div class="row row-cols-1 row-cols-md-3 g-4 ">
                        <c:forEach items="${list}" var="m">
                            <c:if test="${m.getItem_type() == 'Linh kiện điện tử'}">
                                <div class="col mb-4" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0" style="overflow: hidden">
                                            <!-- Badge and favorite -->
                                            <div class="d-flex justify-content-between mb-2">
                                                <a href="#" class="badge bg-purple bg-opacity-10 text-purple">#${m.getHashTag()}</a>
                                                <c:choose>
                                                    <c:when test="${m.getCategory_name() == 'Lost'}">
                                                        <p class="text-danger"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="text-success"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <!-- Title -->
                                            <h5 class="card-title fw-normal"><a href="#">${m.getTitle()}</a></h5>
                                            <p class="text-truncate-2 mb-2">${m.getDescription()}</p>
                                        </div>
                                        <!-- Card footer -->
                                        <div class="card-footer pt-0 pb-3">
                                            <hr>
                                            <div class="d-flex justify-content-between">
                                                <span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>${m.getDate()}</span>
                                                <span class="h6 fw-light mb-0"><i
                                                        class="fas fa-location-arrow text-orange me-2"></i>${m.getLocation_lost_found()}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>    
                        </c:forEach>

                    </div>
                </div>
                <div class="tab-pane container " id="item-pills-tabs-6">
                    <div class="row row-cols-1 row-cols-md-3 g-4 ">
                        <c:forEach items="${list}" var="m">
                            <c:if test="${m.getItem_type() == 'Ví/bóp'}">
                                <div class="col mb-4" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0" style="overflow: hidden">
                                            <!-- Badge and favorite -->
                                            <div class="d-flex justify-content-between mb-2">
                                                <a href="#" class="badge bg-purple bg-opacity-10 text-purple">#${m.getHashTag()}</a>
                                                <c:choose>
                                                    <c:when test="${m.getCategory_name() == 'Lost'}">
                                                        <p class="text-danger"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="text-success"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <!-- Title -->
                                            <h5 class="card-title fw-normal"><a href="#">${m.getTitle()}</a></h5>
                                            <p class="text-truncate-2 mb-2">${m.getDescription()}</p>
                                        </div>
                                        <!-- Card footer -->
                                        <div class="card-footer pt-0 pb-3">
                                            <hr>
                                            <div class="d-flex justify-content-between">
                                                <span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>${m.getDate()}</span>
                                                <span class="h6 fw-light mb-0"><i
                                                        class="fas fa-location-arrow text-orange me-2"></i>${m.getLocation_lost_found()}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>    
                        </c:forEach>

                    </div>
                </div>
                <div class="tab-pane container " id="item-pills-tabs-7">
                    <div class="row row-cols-1 row-cols-md-3 g-4 ">
                        <c:forEach items="${list}" var="m">
                            <c:if test="${m.getItem_type() == 'Chìa khóa'}">
                                <div class="col mb-4" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0" style="overflow: hidden">
                                            <!-- Badge and favorite -->
                                            <div class="d-flex justify-content-between mb-2">
                                                <a href="#" class="badge bg-purple bg-opacity-10 text-purple">#${m.getHashTag()}</a>
                                                <c:choose>
                                                    <c:when test="${m.getCategory_name() == 'Lost'}">
                                                        <p class="text-danger"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="text-success"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <!-- Title -->
                                            <h5 class="card-title fw-normal"><a href="#">${m.getTitle()}</a></h5>
                                            <p class="text-truncate-2 mb-2">${m.getDescription()}</p>
                                        </div>
                                        <!-- Card footer -->
                                        <div class="card-footer pt-0 pb-3">
                                            <hr>
                                            <div class="d-flex justify-content-between">
                                                <span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>${m.getDate()}</span>
                                                <span class="h6 fw-light mb-0"><i
                                                        class="fas fa-location-arrow text-orange me-2"></i>${m.getLocation_lost_found()}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>    
                        </c:forEach>

                    </div>
                </div>

                <div class="tab-pane container " id="item-pills-tabs-8">
                    <div class="row row-cols-1 row-cols-md-3 g-4 ">
                        <c:forEach items="${list}" var="m">
                            <c:if test="${m.getItem_type() == 'Khác'}">
                                <div class="col mb-4" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0" style="overflow: hidden">
                                            <!-- Badge and favorite -->
                                            <div class="d-flex justify-content-between mb-2">
                                                <a href="#" class="badge bg-purple bg-opacity-10 text-purple">#${m.getHashTag()}</a>
                                                <c:choose>
                                                    <c:when test="${m.getCategory_name() == 'Lost'}">
                                                        <p class="text-danger"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="text-success"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <!-- Title -->
                                            <h5 class="card-title fw-normal"><a href="#">${m.getTitle()}</a></h5>
                                            <p class="text-truncate-2 mb-2">${m.getDescription()}</p>
                                        </div>
                                        <!-- Card footer -->
                                        <div class="card-footer pt-0 pb-3">
                                            <hr>
                                            <div class="d-flex justify-content-between">
                                                <span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>${m.getDate()}</span>
                                                <span class="h6 fw-light mb-0"><i
                                                        class="fas fa-location-arrow text-orange me-2"></i>${m.getLocation_lost_found()}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>    
                        </c:forEach>

                    </div>
                </div>
            </div>



        </section>


        <!-- Footer -->
        <%@include file="./components/footer.jsp" %>




        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
                integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous">
        </script>
        <script src="js/myApp.js"></script>
        <script>
                    document.querySelectorAll('.ckeditor').forEach(e => {
                        ClassicEditor
                                .create(e)
                                .then(editor => {
                                    editor.model.document.on('change:data', () => {
                                        e.value = editor.getData();
                                    });
                                })
                                .catch(error => {
                                    console.error(error);
                                });
                    })
        </script>
        <script>
            $(document).ready(function () {
            <c:choose>
                <c:when test="${err!=null}">
                Swal.fire({
                    icon: 'warning',
                    title: '${err}',
                })
                </c:when>
                <c:when test="${msg!=null}">
                Swal.fire({
                    icon: 'success',
                    title: '${msg}',
                })
                </c:when>
            </c:choose>
            });
            const dateInput = document.getElementById('date');
            dateInput.value = formatDate();
            function padTo2Digits(num) {
                return num.toString().padStart(2, '0');
            }

            function formatDate(date = new Date()) {
                return [
                    date.getFullYear(),
                    padTo2Digits(date.getMonth() + 1),
                    padTo2Digits(date.getDate()),
                ].join('-');
            }
        </script>
        <script>

            function reportPost(id) {
                Swal.fire({
                    title: 'Báo cáo',
                    text: "Bạn có chắc chắn muốn báo cáo?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Đồng ý'
                }).then((result) => {
                    if (result.value) {
                        $.ajax({
                            url: 'ViewList_index',
                            type: 'POST',
                            data: {
                                postId: id,
                                action: 'report'
                            },
                            success: function (data) {
                                console.log(data);
                                if (data.success) {
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Thành công',
                                        text: data.message
                                    })
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Thất bại',
                                        text: data.message
                                    })
                                }
                            }
                        });
                    }
                })
            }


            $(".carousel-item:first-child").toggleClass("active");
        </script>

    </body>

</html>