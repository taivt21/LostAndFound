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
        <link
            href='https://site-assets.fontawesome.com/releases/v6.0.0/css/all.css?fbclid=IwAR0zP-eGpeNIPDXxwVIGkEgfmGdz79xPZXfbalbDgXEsOSmbWdm2IeUnlJ4'
            rel='stylesheet'>
        <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
        <title>My profile</title>
        <link rel="stylesheet" href="css/styleProfile.css">
        <link href="css/profile.css" rel="stylesheet">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>

    <body>       

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
                        <li class="nav-item ">
                            <a class="nav-link" href="ViewList_lost"> Lost</a>
                        </li>
                    </ul>


                    <ul id="main" class="nav-item">
                        <li>
                            <c:choose>

                                <c:when test="${member!=null}">Hello ${member.getUsername()}</c:when>
                            </c:choose>
                            <ul class="drop">
                                <div class="drop__user__menu">
                                    <li><a href="proFile.jsp">View Profile</a></li>
                                    <li><a href="YourPost">Your Post</a></li>
                                    <li><a href="Logout">Logout</a></li>
                                </div>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <nav aria-label="row breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="ViewList_index">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">My profile</li>
                </ol>
            </nav>

            <div class="row personal-info">
                <div class="col-xl-4 col-md-12 col-sm-12 col-12 left-col">
                    <div class="card h-100">
                        <div class="profile-body card-body">
                            <div class="account-settings">
                                <form action="updateProfileServlet" method="POST" enctype="multipart/form-data">
                                    <div class="user-profile">
                                        <input type="hidden" name="action" value="updateAvatar"/>
                                        <c:choose>
                                            <c:when test="${member.getAvatar() != null}">
                                                <div class="user-avatar mb-4">
                                                    <img id="img" src="images/${member.getAvatar()}" alt="your img">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="user-avatar mb-4">
                                                    <img id="img" src="https://source.unsplash.com/random" alt="random img">
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <button style="" class="btn btn-primary mb-3" id="upfile" type="button">Change image</button>
                                        <input type="submit" id="submitFile" style class="btn btn-primary d-none mb-3" value="Confirm Image"/>
                                        <input type="file" name="avatar" class="d-none" id="file" onChange="chooseF(this)">
                                        <h5 class="user-name mb-3">${member.getUsername()}</h5>
                                        <h6 class="user-email">${member.getEmail()}</h6>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8 col-md-12 col-sm-12 col-12 right-col">
                    <div class="card h-100"><form action="updateProfileServlet" method="POST">
                            <div class="profile-body card-body ">
                                <div class="row">
                                    <input type="hidden" name="action" value="updateProfile"/>
                                    <div class="col-12">
                                        <h3 class="mb-2 text-primary">Personal Details</h3>
                                    </div>
                                    <div class="col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input type="text" class="form-control" name="UName" placeholder="Enter full name" value="${member.getUsername()}">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>Fullname</label>
                                            <input type="text" class="form-control" name="fullName" required="" placeholder="Enter fullname" value="${member.getFullName()}">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>Phone</label>
                                            <input type="number" class="form-control" name="phone" required=""
                                                   placeholder="Enter phone number" value="${member.getContact()}">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>Email</label>
                                            <input type="email" class="form-control" id="" placeholder="Enter email" value="${member.getEmail()}" readonly="">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>Status</label>
                                            <input type="text" class="form-control" value="Active" readonly>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mt-3">
                                        <div class="text-right">
                                            <button type="submit" id="submit" name="submit"
                                                    class="btn btn-primary">Update</button>
                                        </div>
                                    </div>
                                </div>
                            </div></form>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <footer class="text-center text-lg-start bg-light text-muted mt-5 footer">
        <section class="">
            <div class="container text-center text-md-start mt-5">
                <!-- Grid row -->
                <div class="row mt-3">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                        <!-- Content -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            <i class="fas fa-location-arrow me-3"></i>Địa chỉ
                        </h6>
                        <p>
                            Lô E2a-7, Đường D1, Khu Công nghệ cao, P.Long Thạnh Mỹ, Tp. Thủ Đức, TP.HCM
                        </p>
                    </div>
                    <!-- Grid column -->


                    <!-- Grid column -->
                    <div class="col-md-5  col-xl-2 mx-auto mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Useful links
                        </h6>
                        <p>
                            <a href="ViewList_index" class="text-reset">Home</a>
                        </p>
                        <p>
                            <a href="ViewList_lost" class="text-reset">Lost</a>
                        </p>
                        <p>
                            <a href="ViewList_found" class="text-reset">Founds</a>
                        </p>
                    </div>
                    <!-- Grid column -->

                    <!-- Grid column -->
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                        <!-- Links -->
                        <h6 class="text-uppercase fw-bold mb-4">
                            Kết nối với chúng tôi
                        </h6>
                        <p>
                            <i class="fas fa-envelope me-3"></i>
                            daihoc.hcm@fpt.edu.vn
                        </p>
                        <p><i class="fas fa-phone me-3"></i> (028) 7300 5588</p>
                    </div>
                    <!-- Grid column -->
                </div>
                <!-- Grid row -->
            </div>
        </section>
        <!-- Section: Links  -->
    </footer>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
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
                                            $("#upfile").click(function () {
                                                $("#file").trigger('click');
                                            });
    </script>
    <script>
        function chooseF(fileInput) {
            if (fileInput.files && fileInput.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#img").attr("src", e.target.result);
                    $("#upfile").toggleClass("d-none");
                    $("#submitFile").toggleClass("d-none");
                }
                reader.readAsDataURL(fileInput.files[0]);
            }
        }

    </script>
    <script>
        $(document).ready(function () {
        <c:choose>
            <c:when test="${err!=null}">
            alert('${err}');
            </c:when>
        </c:choose>
        });
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
    </script>
</body>

</html>