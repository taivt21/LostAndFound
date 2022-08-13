<%-- 
    Document   : postReportMgt
    Created on : Jul 31, 2022, 10:39:46 AM
    Author     : ASUS
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="utf-8">
        <title>POST REPORT MANAGEMENT</title>
        <link rel="stylesheet" href="css/styleAdmin.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">


        <link
            href='https://site-assets.fontawesome.com/releases/v6.0.0/css/all.css?fbclid=IwAR0zP-eGpeNIPDXxwVIGkEgfmGdz79xPZXfbalbDgXEsOSmbWdm2IeUnlJ4'
            rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.css" rel="stylesheet" />
        <!-- MDB -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                        <a href="./ViewList_dashboard" class="menu-btn ">
                            <i class="fas fa-desktop"></i><span>Dashboard</span>
                        </a>
                    </li>

                    <li class="item active">
                        <a href="./ViewList_user" class="menu-btn">
                            <i class="fa-light fa-users"></i><span>User</span>
                        </a>
                    </li>
                    <!--                    <li class="item">
                                            <a href="banned.jsp" class="menu-btn">
                                                <i class="fa-light fa-user-large-slash"></i><span>User banned</span>
                                            </a>
                                        </li>-->
                    <li class="item">
                        <a href="./ViewList_report" class="menu-btn active">
                            <i class="fa-light fa-newspaper"></i><span>Post report</span>
                        </a>
                    </li>
                </div>
            </div>
            <!--sidebar end-->
            <!--main container start-->
            <div class="main-container">
                <div class="my-5" style="font-weight: 700"><h3>Bài bị report</h3></div>
                <div class="sticky-table">
                    <table class="table table-striped myTable">
                        <thead>
                            <tr>
                                <th>Post-ID</th>
                                <th>UserName</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>post-status</th>
                                <th>Status report</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="post" items="${postList}">

                                    <tr>
                                        <td>${post.getItem_id()}</td>
                                        <td>${post.getMember_id()}</td>
                                        <td>${post.getTitle()}</td>
                                        <td>${post.getDescription()}</td>
                                        <td>${post.getStatus()}</td>
                                        <td>${post.isIsReport()}</td>
                                        <td>
                                            <!-- Form remove report and form remove post -->
                                            <form action="ViewList_report" method="post" class="mb-2">
                                                <input type="hidden" name="post_id" value="${post.getItem_id()}">
                                                <input type="hidden" name="action" value="removeReport">
                                                <input type="submit" class="btn btn-danger" style="width: 150px" value="Remove report">
                                            </form>
                                            <form action="ViewList_report" method="post">
                                                <input type="hidden" name="post_id" value="${post.getItem_id()}">
                                                <input type="hidden" name="action" value="removePost">
                                                <input type="submit" class="btn btn-danger" style="width: 150px" value="Remove post">
                                            </form>
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
            function myDeleteAlert() {
                Swal.fire({
                    title: 'Are you sure?',
                    text: "Hành động này sẽ delete Post",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire(
                                'Deleted!',
                                'Your file has been deleted.',
                                'success'
                                )
                    }
                })
            }
        </script>

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                
            });
        </script>
    </body>

</html>
