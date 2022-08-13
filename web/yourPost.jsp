<%-- 
    Document   : yourPost
    Created on : Jul 26, 2022, 2:44:03 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="css/styleAdmin.css">
    <!-- 
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <link
        href='https://site-assets.fontawesome.com/releases/v6.0.0/css/all.css?fbclid=IwAR0zP-eGpeNIPDXxwVIGkEgfmGdz79xPZXfbalbDgXEsOSmbWdm2IeUnlJ4'
        rel='stylesheet'>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.css" rel="stylesheet" />
    <!-- MDB -->

    <title>MY POST</title>
    <link rel="stylesheet" href="css/styleProfile.css">
    <link href="css/profile.css" rel="stylesheet">
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
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="ViewList_index">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">My post</li>
            </ol>
        </nav>
        <div class="row">

            <div class="col-xl-3">
                <div class="card">
                    <div class="card-body h-100">
                        <div class="account-settings">
                            <div class="user-profile">
                                <div class="user-avatar">
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
                                </div>
                                <h4 class="user-name">${member.getUsername()}</h4>
                                <h5 class="user-email">${member.getEmail()}</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-9">
                <div class="card h-100">
                    <table class="table table-striped myTable">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Type</th>
                                <th>Item type</th>
                                <th>Description</th>
                                <th>Date</th>
                                <th>Location</th>
                                <th>Status</th>
                                <th>Hastag</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${posts}" var="post">
                                <tr>
                                    <td>${post.getItem_id()}</td>
                                    <td>${post.getTitle()}</td>
                                    <td>${post.getCategory_name()}</td>
                                    <td>${post.getItem_type()}</td>
                                    <td>${post.getDescription()}</td>
                                    <td>${post.getDate()}</td>
                                    <td>${post.getLocation_lost_found()}</td>
                                    <td>${post.getStatus()}</td>
                                    <td>${post.getHashTag()}</td>
                                    <td>
                                        <button style="border: none;" type="button" data-toggle="modal"
                                            data-target="#DetailModal" data-id="${post.getItem_id()}"
                                            data-title="${post.getTitle()}" data-type="${post.getCategory_name()}"
                                            data-item_type="${post.getItem_type()}"
                                            data-description="${post.getDescription()}" data-date="${post.getDate()}"
                                            data-location="${post.getLocation_lost_found()}"
                                            data-status="${post.getStatus()}" data-hashtag="${post.getHashTag()}"
                                            data-image = "images/${post.getImage()}">
                                            <i class="fa-light fa-pen-to-square fa-lg"></i> <%-- (Detail) --%>
                                        </button>
                                        <button onclick="myDeleteAlert(${post.getItem_id()})"
                                            style="border: none; color: red" type="button">
                                            <i class="fa-light fa-circle-trash fa-lg"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- detail modal-->
        <div class="modal fade" id="DetailModal">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Edit post</h4>
                        <button type="button" class="close close-button" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <form action="YourPost" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="action" id="action" value="update">
                            <div class="card h-100">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <h6 class="mb-2 text-primary">Post Details</h6>
                                        </div>
                                        <input type="hidden" name="id" id="id">
                                        <div class="col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>Title</label>
                                                <input type="text" class="form-control" id="title" name="title"
                                                    placeholder="Enter title">
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>Type</label>
                                                <select name="type" id="type" class="custom-select">
                                                    <option selected>Type</option>
                                                    <option value="Found">Found</option>
                                                    <option value="Lost">Lost</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-12">
                                            <!-- Print Image -->
                                            <img id="image" src="images/default.png" alt="your img"
                                                class="img-fluid">
                                        </div>
                                        <div class="col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>Image</label>
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" name="file_image"
                                                        id="customFile">
                                                    <label class="custom-file-label" for="customFile">Choose
                                                        image</label>
                                                </div>
                                            </div>
                                        </div>
<!--                                        <div class="col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>Item</label>
                                                <select name="" class="custom-select">
                                                    <option value="" selected>Bình nước</option>
                                                    <option value="">Thẻ</option>
                                                    <option value="">Cmnd</option>
                                                    <option value="">Chìa khóa</option>
                                                    <option value="">linh kiện điện tử</option>
                                                    <option value="">Ví/bóp</option>
                                                    <option value="">Điện thoại</option>
                                                    <option value="">Khác</option>
                                                </select>
                                            </div>
                                        </div>-->
                                        <div class="col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>Item</label>
                                                <select name="item_type" class="custom-select">
                                                    <option value="Bình nước" selected>Bình nước</option>
                                                    <option value="Thẻ">Thẻ</option>
                                                    <option value="Cmnd">Cmnd</option>
                                                    <option value="Chìa khóa">Chìa khóa</option>
                                                    <option value="Linh kiện điện tử">linh kiện điện tử</option>
                                                    <option value="Ví/bóp">Ví/bóp</option>
                                                    <option value="Điện thoại">Điện thoại</option>
                                                    <option value="Khác">Khác</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>Date</label>
                                                <input type="date" class="form-control" name="date_z" id="date"
                                                    placeholder="Enter date">
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-12">
                                            <div class="form-group">
                                                <label>Location</label>
                                                <input type="text" class="form-control" id="location" name="location"
                                                    placeholder="Enter location">
                                            </div>
                                        </div>
                                        <div class="col-sm-6 col-12" style="display: none">
                                            <div class="form-group">
                                                <label>Status</label>
                                                <select name="status" id="status" name="status" class="custom-select">
                                                    <option value="" selected>Status</option>
                                                    <option value="1">Active</option>
                                                    <option value="0">Inactive</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label>Hastag</label>
                                                <input type="text" class="form-control" id="hashtag" name="hashtag"
                                                    placeholder="Enter hastag">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <label class="d-block">Description</label>
                                            <textarea class="ckeditor" id="description" name="description"></textarea>
                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                            <div class="text-right">
                                                <button type="submit" id="submit" name="submit"
                                                    class="btn btn-primary">Update</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                    </div>
                </div>

            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous">
        </script>
        <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
            integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous">
        </script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js">
        </script>
        <script src="https://cdn.ckeditor.com/ckeditor5/34.2.0/classic/ckeditor.js"></script>
        <script>
            var editor;
            ClassicEditor
                .create(document.querySelector('#description'), {
                    toolbar: [
                        'heading',
                        '|',
                        'bold',
                        'italic',
                        'link',
                        'bulletedList',
                        'numberedList',
                        'blockQuote'
                    ]
                })
                .then(newEditor => {
                    editor = newEditor;
                })
                .catch(error => {
                    console.error(error);
                });
        </script>


        <script>
            $(document).ready(function () {
                $('.myTable').DataTable({
                    "order": [
                        [0, "desc"]
                    ]
                });
            });

            function myDeleteAlert($id) {
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
                        $.ajax({
                            url: "YourPost",
                            type: "POST",
                            data: {
                                id: $id,
                                action: 'delete'
                            },
                            success: function (data) {
                                if (data.success)   {
                                    // data.message
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Deleted!',
                                        text: data.message,
                                    }).then(function () {
                                        location.reload();
                                    });
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Oops...',
                                        text: data.message,
                                    }).then(function () {
                                        location.reload();
                                    });
                                }
                            }
                        });
                    }
                })
            }
        </script>
        <script>
            $(document).ready(function () {
                $('#DetailModal').on('show.bs.modal', function (event) {

                    var button = $(event.relatedTarget)

                    var id = button.data('id')
                    var title = button.data('title')
                    var type = button.data('type')
                    var item_type = button.data('item_type')
                    var description = button.data('description')
                    var date = button.data('date')
                    var location = button.data('location')
                    var status = button.data('status')
                    var hastag = button.data('hashtag')
                    var image = button.data('image')
                    var modal = $(this)
                    modal.find('.modal-body #id').val(id)
                    modal.find('.modal-body #title').val(title)
                    modal.find('.modal-body #type').val(type)
                    modal.find('.modal-body #item_type').val(item_type)
                    modal.find('.modal-body #description').val(description)
                    modal.find('.modal-body #date').val(date)
                    modal.find('.modal-body #location').val(location)
                    modal.find('.modal-body #status').val(status)
                    modal.find('.modal-body #hashtag').val(hastag)
                    // src image
                    modal.find('.modal-body #image').attr('src', image)

                    editor.setData(description);




                })
            });
        </script>

</body>

</html>