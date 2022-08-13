<%-- 
    Document   : dashboard
    Created on : Jul 12, 2022, 1:25:02 PM
    Author     : daoma
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>ADMIN</title>
    <link rel="stylesheet" href="css/styleAdmin.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">


    <link
        href='https://site-assets.fontawesome.com/releases/v6.0.0/css/all.css?fbclid=IwAR0zP-eGpeNIPDXxwVIGkEgfmGdz79xPZXfbalbDgXEsOSmbWdm2IeUnlJ4'
        rel='stylesheet'>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.css" rel="stylesheet" />
    <!-- MDB -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>

</head>

<body>

    <!--wrapper start-->
    <div class="wrapper">
        <!--header menu start-->
        <%@include file="./components/navHeaderAdmin.jsp" %>
        <!--header menu end-->
        <!--sidebar start-->
        <div class="sidebar">
            <div class="sidebar-menu">
                <center class="profile">
                    <img src="https://source.unsplash.com/random" alt="" />
                    <p>ADMIN</p>
                </center>
                <li class="item">
                    <a href="./ViewList_dashboard" class="menu-btn active">
                        <i class="fas fa-desktop"></i><span>Dashboard</span>
                    </a>
                </li>

                <li class="item active">
                    <a href="./ViewList_user" class="menu-btn">
                        <i class="fa-light fa-users"></i><span>User</span>
                    </a>
                </li>
                <!--                    <li class="item">
                                            <a href="userbanMgt.html" class="menu-btn">
                                                <i class="fa-light fa-user-large-slash"></i><span>User banned</span>
                                            </a>
                                        </li>-->
                <li class="item">
                    <a href="./ViewList_report" class="menu-btn">
                        <i class="fa-light fa-newspaper"></i><span>Post report</span>
                    </a>
                </li>
            </div>
        </div>
        <!--sidebar end-->




        <!--main container start-->
        <div class="main-container">
            <div class="row">
                <div class="box col-sm-6 text-center py-5">
                    <i class="fa-light fa-users fa-2x pb-3"></i>
                    <p>User</p>
                    <p>${countUser}</p>
                </div>
                <div class="box col-sm-6 text-center py-5">
                    <i class="fa-light fa-newspaper fa-2x pb-3"></i>
                    <p>Post</p>
                    <p>${countItem}</p>
                </div>
                <div class="box col-sm-6 text-center py-5">
                    <i class="fa-light fa-eye fa-2x pb-3"></i>
                    <p>Muted</p>
                    <p>${countUserMute}</p>
                </div>
                <div class="box col-sm-6 text-center py-5">
                    <i class="fa-light fa-user-large-slash fa-2x pb-3"></i>
                    <p>Banned</p>
                    <p>${countUserBanned}</p>
                </div>
            </div>
            <div class="my-5" style="font-weight: 700">
                <h3>Bài post mới nhất</h3>
            </div>
            <div class="sticky-table">
                <table class="table table-striped myTable">
                    <thead>
                        <tr>
                            <th>Item Id</th>
                            <th>Title</th>
                            <th>Category Name</th>
                            <th>Location</th>
                            <th>Status</th>
                            <th>Member Id</th>
                            <th>Item Type</th>
                            <th>Hash tag</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${items}" var="item">
                            <tr>
                                <td>${item.getItem_id()}</td>
                                <td>
                                    ${item.getTitle()}
                                </td>
                                <td>
                                    ${item.getCategory_name()}
                                </td>
                                <td>
                                    ${item.getLocation_lost_found()}
                                </td>
                                <td>
                                    ${item.getStatus()}
                                </td>
                                <td>
                                    ${item.getMember_id()}
                                </td>
                                <td>
                                    ${item.getItem_type()}
                                </td>
                                <td>
                                    ${item.getHashTag()}
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>
            </div>
        </div>

        <!--main container end-->
    </div>
    <!--wrapper end-->
    <script>
        const menuItems = document.querySelectorAll(".item");
        menuItems.forEach((item) =>
            item.addEventListener("click", function (event) {
                menuItems.forEach((el) => el.classList.remove("active"));
                event.target.classList.add("active");
            })
        );
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.myTable').DataTable({
                "order": [
                    [0, "desc"]
                ]
            });
        });
    </script>
</body>

</html>