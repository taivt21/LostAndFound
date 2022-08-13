<%-- 
    Document   : searchItem
    Created on : Jul 25, 2022, 10:36:01 PM
    Author     : Tung
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

        <title>Search</title>
        <!-- <link rel="stylesheet" href="css/style.css"> -->
        <link href="css/profile.css" rel="stylesheet">
        <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
    </head>

    <body>
        <!-- Back to top button -->
        <button type="button" class="btn btn-danger btn-floating btn-lg" id="btn-back-to-top">
            <i class="fas fa-arrow-up"></i>
        </button>

        <!-- Detail -->
        <%@include file="./components/postItem.jsp" %>


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
                        <li class="nav-item ">
                            <a class="nav-link" href="ViewList_found">Found</a>
                        </li>
                        <li class="nav-item ">
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
                                    <span class="fa fa-sign-in-alt "></span>Login</a>
                            </span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>
        <%@include file="./components/loginmodal.jsp" %>
        <section class="container my-5">
            <div class="row">
                <c:if test="${listF.size()!=0}">
                    <div class="alert alert-info  col search-bar" role="alert">
                        Found ${listF.size()} out of ${list.size()} results
                    </div></c:if>
                <c:if test="${listF.size()==0}">
                    <div class="alert alert-danger  col search-bar" role="alert">
                        Found ${listF.size()} out of ${list.size()} results!<br>Please check your input or create a post.
                    </div></c:if>
                </div>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane container active" id="item-pills-tabs-1">
                        <div class="row row-cols-1 row-cols-md-3 g-4 ">
                        <c:forEach items="${listF}" var="m">
                            <div class="col mb-4" data-toggle="modal" data-target="#DetailModal${m.getItem_id()}">
                                <div class="card shadow h-100 card-detail">
                                    <!-- Image -->
                                    <img src="https://image.thanhnien.vn/w1024/Uploaded/2022/yfrph/2022_04_12/47cb7a75-7dd8-45e5-b0be-989eedf68d4c-4196.jpeg"
                                         class="card-img-top" alt="course image">
                                    <div class="card-body pb-0">
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
            </div>



        </section>

            <%@include file="./components/footer.jsp" %>





        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
        <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
                integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
        crossorigin="anonymous"></script>
        <script src="js/jquery.js"></script>
        <script>
            DecoupledEditor
                    .create(document.querySelector('.document-editor__editable'), {

                    })
                    .then(editor => {
                        const toolbarContainer = document.querySelector('.document-editor__toolbar');

                        toolbarContainer.appendChild(editor.ui.view.toolbar.element);

                        window.editor = editor;
                    })
                    .catch(err => {
                        console.error(err);
                    });
        </script>
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
                alert('${err}');
                </c:when>
            </c:choose>
            });
        </script>
    </body>

</html>
