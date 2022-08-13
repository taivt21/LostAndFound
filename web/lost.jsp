<!doctype html>
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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
              integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
        <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
        <link
            href='https://site-assets.fontawesome.com/releases/v6.0.0/css/all.css?fbclid=IwAR0zP-eGpeNIPDXxwVIGkEgfmGdz79xPZXfbalbDgXEsOSmbWdm2IeUnlJ4'
            rel='stylesheet'>
        <title>Lost</title>
        <!-- <link rel="stylesheet" href="../css/style.css"> -->
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link href="css/profile.css" rel="stylesheet">


    </head>

    <body>
        <!--login-->
        <%@include file="./components/loginmodal.jsp" %>

        <!--navbar-->
        <nav class="navbar navbar-dark navbar-expand-sm fixed-top">
            <div class="container" id="nav_header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand mr-auto" href="ViewList_index"><img src="images/logo.svg" height="50"
                                                                           width="150"></a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item ">
                            <a class="nav-link" href="ViewList_index"><span class="fa fa-home fa-lg"></span> Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ViewList_found">Found</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="ViewList_lost"> Lost</a>
                        </li>
                    </ul>

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
                            <span class="navbar-text">
                                <a id="loginButton">
                                    <span class="fa fa-sign-in-alt "></span> Login</a>
                            </span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>
        <!-- Back to top button -->
        <button type="button" class="btn btn-danger btn-floating btn-lg" id="btn-back-to-top">
            <i class="fas fa-arrow-up"></i>
        </button>

        <%@include file="./components/postItem.jsp" %>

        <section class="container my-5">
            <div class="row">
                <div class="sw col search-bar">
                    <form class="">
                        <input type="search" class="search" placeholder="Search..." oninput="liveSearch()" id="searchbox">
                        <button class="go">
                            <svg enable-background="new 0 0 512 512" version="1.1" viewBox="0 0 512 512"
                                 xml:space="preserve" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink">
                            <path
                                d="M497.913,497.913c-18.782,18.782-49.225,18.782-68.008,0l-84.862-84.863c-34.889,22.382-76.13,35.717-120.659,35.717  C100.469,448.767,0,348.312,0,224.383S100.469,0,224.384,0c123.931,0,224.384,100.452,224.384,224.383  c0,44.514-13.352,85.771-35.718,120.676l84.863,84.863C516.695,448.704,516.695,479.131,497.913,497.913z M224.384,64.109  c-88.511,0-160.274,71.747-160.274,160.273c0,88.526,71.764,160.274,160.274,160.274c88.525,0,160.273-71.748,160.273-160.274  C384.657,135.856,312.909,64.109,224.384,64.109z">
                            </path>
                            </svg>
                        </button>

                    </form>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-lg-8 mx-auto text-center">
                    <h2 class="fs-1">All Lost Item</h2>
                    <p class="mb-0">Phân loại tìm kiếm</p>
                </div>
            </div>

            <ul class="nav nav-pills nav-pills-bg-soft justify-content-sm-center mb-4 px-3" id="item-pills-tab"
                role="tablist">
                <!-- Tab item -->
                <li class="nav-item me-2 me-sm-5">
                    <button class="nav-link mb-2 mb-md-0 active" data-toggle="pill" data-target="#item-pills-tabs-0"
                            type="button" role="tab" aria-controls="item-pills-tabs-0" aria-selected="false">All</button>
                </li>
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
                            <c:if test="${m.getCategory_name() == 'Lost'}">
                                <div class="col mb-4 cards" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0 card-body-size" style="overflow: hidden">
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
                <div class="tab-pane container" id="item-pills-tabs-1">
                    <div class="row row-cols-1 row-cols-md-3 g-4 ">
                        <c:forEach items="${list}" var="m">
                            <c:if test="${m.getItem_type() == 'Điện thoại' &&  m.getCategory_name() == 'Lost'}">
                                <div class="col mb-4 cards" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0 card-body-size" style="overflow: hidden">
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
                            <c:if test="${m.getItem_type() == 'Thẻ xe' &&  m.getCategory_name() == 'Lost' or m.getItem_type() == 'Thẻ sinh viên' &&  m.getCategory_name() == 'Lost'}">
                                <div class="col mb-4 cards" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0 card-body-size" style="overflow: hidden">
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
                            <c:if test="${m.getItem_type() == 'CMND' &&  m.getCategory_name() == 'Lost'}">
                                <div class="col mb-4 cards" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0 card-body-size" style="overflow: hidden">
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
                            <c:if test="${m.getItem_type() == 'Bình nước' &&  m.getCategory_name() == 'Lost'}">
                                <div class="col mb-4 cards" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0 card-body-size" style="overflow: hidden">
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
                            <c:if test="${m.getItem_type() == 'Linh kiện điện tử' &&  m.getCategory_name() == 'Lost'}">
                                <div class="col mb-4 cards" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0 card-body-size" style="overflow: hidden">
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
                            <c:if test="${m.getItem_type() == 'Ví/bóp' &&  m.getCategory_name() == 'Lost'}">
                                <div class="col mb-4 cards" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0 card-body-size" style="overflow: hidden">
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
                            <c:if test="${m.getItem_type() == 'Chìa khóa' &&  m.getCategory_name() == 'Lost'}">
                                <div class="col mb-4 cards" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0 card-body-size" style="overflow: hidden">
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
                            <c:if test="${m.getItem_type() == 'Khác' &&  m.getCategory_name() == 'Lost'}">
                                <div class="col mb-4 cards" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                    <div class="card shadow h-100 card-detail">
                                        <!-- Image -->
                                        <img src="images/${m.getImage()}" class="card-img-top" alt="...">

                                        <div class="card-body pb-0 card-body-size" style="overflow: hidden">
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
        <script src="js/jquery.js"></script>

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