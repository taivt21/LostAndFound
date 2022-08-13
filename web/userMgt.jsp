<%-- 
    Document   : userMgt
    Created on : Jul 17, 2022, 9:42:06 PM
    Author     : Tung
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

    <head>
        <meta charset="utf-8">
        <title>USER MANAGEMENT</title>
        <link rel="stylesheet" href="css/styleAdmin.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">


        <link
            href='https://site-assets.fontawesome.com/releases/v6.0.0/css/all.css?fbclid=IwAR0zP-eGpeNIPDXxwVIGkEgfmGdz79xPZXfbalbDgXEsOSmbWdm2IeUnlJ4'
            rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
                    <li class="item active">
                        <a href="./ViewList_dashboard" class="menu-btn">
                            <i class="fas fa-desktop"></i><span>Dashboard</span>
                        </a>
                    </li>

                    <li class="item">
                        <a href="./ViewList_user" class="menu-btn active">
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
                <div class="my-5" style="font-weight: 700"><h3>Quản lí thành viên</h3></div>
                <div class="sticky-table">
                    <table class="table table-striped myTable">
                        <thead>
                            <tr>
                                <th>Username</th>
                                <th>Fullname</th>
                                <th>Contact</th>
                                <th>Email</th>
                                <th>Not Banned</th>
                                <th>Mute</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${mem}" var="mn">
                                <c:if test="${mn.getRole_id() == 2}">
                                    <tr>
                                        <td>
                                            <div class="user">                                                
                                                <span>${mn.getUsername()}</span>
                                            </div>
                                        </td>
                                        <td>${mn.getFullName()}</td>
                                        <td>${mn.getContact()}</td>
                                        <td>${mn.getEmail()}</td>
                                        <td>
                                            <c:if test="${mn.isStatus()}">
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox" onchange="changeStatus(this)" 
                                                           name="darkmode" checked>
                                                    <input type="hidden" value="${mn.getMember_id()}" name="id" />
                                                    <input type="hidden" name="action" value="status" />
                                                </div>
                                            </c:if>
                                            <c:if test="${!mn.isStatus()}">
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox" onchange="changeStatus(this)"
                                                           name="darkmode">
                                                    <input type="hidden" value="${mn.getMember_id()}" name="id" />
                                                    <input type="hidden" name="action" value="status" />
                                                    <label class="form-check-label" for="statusSwitch"></label>
                                                </div>
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:if test="${mn.isMuted()}">
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox" onchange="changeMute(this)"
                                                           name="darkmode" checked>
                                                    <input type="hidden" value="${mn.getMember_id()}" name="id" />
                                                    <input type="hidden" name="action" value="mute" />
                                                    <label class="form-check-label" for="muteSwitch"></label>
                                                </div>
                                            </c:if>
                                            <c:if test="${!mn.isMuted()}">
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox" onchange="changeMute(this)"
                                                           name="darkmode">
                                                    <input type="hidden" value="${mn.getMember_id()}" name="id" />
                                                    <input type="hidden" name="action" value="mute" />
                                                    <label class="form-check-label" for="muteSwitch"></label>
                                                </div>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:if>

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
        <script type="text/javascript">

            function changeStatus(e) {
                console.log("statusSwitch");
                id = $(e).next().val();
                checked = $(e).is(":checked");
                action = $(e).next().next().val();
                if ($(e).is(":checked")) {
                    $.ajax({
                        url: "./ViewList_user",
                        type: "POST",
                        data: {
                            checked: "1",
                            id: id,
                            action: action
                        },
                        success: function (data) {
                            console.log(data);
                        },
                        error: function (error) {
                            console.log(error);
                        },
                    });
                } else {
                    $.ajax({
                        url: "./ViewList_user",
                        type: "POST",
                        data: {
                            checked: "0",
                            id: id,
                            action: action
                        },
                        success: function (data) {
                            console.log(data);
                        },
                        error: function (error) {
                            console.log(error);
                        },
                    });
                }
            }
            function changeMute(e)
            {
                console.log("muteSwitch");
                id = $(e).next().val();
                checked = $(e).is(":checked");
                action = $(e).next().next().val();
                if ($(e).is(":checked")) {
                    $.ajax({
                        url: "./ViewList_user",
                        type: "POST",
                        data: {
                            checked: "1",
                            id: id,
                            action: action
                        },
                        success: function (data) {
                            console.log(data);
                        },
                        error: function (error) {
                            console.log(error);
                        },
                    });
                } else {
                    $.ajax({
                        url: "./ViewList_user",
                        type: "POST",
                        data: {
                            checked: "0",
                            id: id,
                            action: action
                        },
                        success: function (data) {
                            console.log(data);
                        },
                        error: function (error) {
                            console.log(error);
                        },
                    });
                }
            }
        </script>

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.myTable').DataTable();
            });
        </script>
    </body>

</html>