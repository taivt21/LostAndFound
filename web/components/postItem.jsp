<%-- 
    Document   : postItem
    Created on : Aug 2, 2022, 1:27:02 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:forEach items="${list}" var="m">
    <div class="modal fade" id="DetailModal${m.getItem_id()}">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">${m.getTitle()}</h4>
                    <span class="setting-button">
                        <button class="btn btn-warning fa fa-flag" onclick="reportPost(${m.getItem_id()})"> Report</button>
                    </span>
                    <button type="button" class="close close-button" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div class="container item-detail">
                        <div class="row">
                            <div class="col-12 col-sm-12 mb-4">
                                <div class="d-flex justify-content-center">
                                    <img src="images/${m.getImage()}" class="img-fluid" alt="">
                                </div>

                            </div>
                            <div class="col-12 col-sm-8 border-right">
                                <div class="row">
                                    <div class="col-6">
                                        <p><strong>Loại vật phẩm: </strong>${m.getItem_type()}</p>
                                    </div>
                                    <div class="col-6">
                                        <c:choose>
                                            <c:when test="${m.getCategory_name() == 'Lost'}">
                                                <p class="text-danger"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="text-success"><span class="fa fa-circle"></span> ${m.getCategory_name()} </p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <p><strong>Ngày: </strong>${m.getDate()}</p>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <p><strong>Địa điểm: </strong>${m.getLocation_lost_found()}</p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <p><strong>Mô tả thêm
                                            </strong></p>
                                    </div>
                                    <div class="col-12">
                                        <p>${m.getDescription()}</p>
                                    </div>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${sessionScope.member == null}">
                                    <div class="col-12 col-sm-4">
                                        <div class="row" class="text-center" style="font-weight: 600">
                                            <p>bạn cần đăng nhập để xem thông tin liên lạc với chủ bài post</p> 
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-12 col-sm-4">
                                        <c:forEach items="${listM}" var="ml">
                                            <c:if test="${m.getMember_id()==ml.getMember_id()}">
                                                <div class="row">
                                                    <div class="col-12 mb-3">
                                                        <span>
                                                            <i class="fa fa-phone"></i> ${ml.getContact()}
                                                        </span>
                                                    </div>
                                                    <div class="col-12 mb-3">
                                                        <span>
                                                            <i class="fa fa-envelope" aria-hidden="true"></i> ${ml.getEmail()}
                                                        </span>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
                </div>

            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
            </div>
        </div>

    </div>
</div>
</c:forEach>




<div class="row">

    <div class="col-12">
        <div id="post-bar" class="post-bar">
            <c:choose>
                <c:when test="${sessionScope.member !=null}">
                    <c:if test="${member.muted}">
                        <h2 class="text-danger">Bạn đã bị cấm đăng bài</h2>
                        <p class="text-danger">Liên hệ Admin để có thêm thông tin</p>
                    </c:if>
                    <c:if test="${!member.muted}"> 
                        <h2> Create new post</h2>  
                        <button href="#" type="button" class="btn btn-light post-button btn-lg" data-toggle="modal"
                                data-placement="left" title="Đăng bài" data-target="#myModal"><i class="fas fa-plus"></i></button>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                    <h2>Bạn cần đăng nhập để post bài</h2>
                </c:otherwise>
            </c:choose>

        </div>
        <!-- <button type="button" class="btn btn-primary btn-block"><i class="fa-solid fa-plus"></i> New post</button> -->
    </div>
</div>


<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="CreateItem" method="POST" enctype="multipart/form-data">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">POST</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">

                    <div class="row">
                        <div class="col-12 col-sm-2 mt-3">
                            <p>Title:</p>
                        </div>
                        <div class="col-12 col-sm-4 mt-3">
                            <input type="text" class="form-control" name="title">
                        </div>
                        <div class="col-12 col-sm-2 mt-3">
                            <p>Category:</p>
                        </div>
                        <div class="col-12 col-sm-4 mt-2">
                            <select name="category_name" class="custom-select mb-3">
                                <option selected>Category</option>
                                <option value="Found">Found</option>
                                <option value="Lost">Lost</option>
                            </select>
                        </div>

                        <div class="col-12 col-sm-2 mt-3">
                            <p>Local:</p>
                        </div>

                        <div class="col-12 col-sm-4 mt-3">
                            <input type="text" class="form-control" name="location_lost_found">
                        </div>

                        <div class="col-12 col-sm-2 mt-3">
                            <p>Type:</p>
                        </div>
                        <div class="col-12 col-sm-4 mt-2">
                            <select name="item_type" class="custom-select mb-3">
                                <option selected>Type</option>
                                <option value="Bình nước">Bình nước</option>
                                <option value="Chìa khóa">Chìa khóa</option>
                                <option value="CMND">CMND</option>
                                <option value="Linh kiện điện tử">Linh kiện điện tử</option>
                                <option value="Điện thoại">Điện thoại</option>
                                <option value="Thẻ">Thẻ</option>
                                <option value="Ví/bóp">Ví/bóp</option>
                                <option value="Khác">Khác</option>

                            </select>
                        </div>
                        <div class="col-sm-2 mt-3">
                            <label for="">Date:</label>
                        </div>
                        <div class="col-sm-4 mt-3">
                            <input style="border: none; cursor: pointer" type="date" id="date" name="date" required="">
                        </div>
                        <div class="col-12 mt-3">
                            <textarea class="ckeditor" name="description"></textarea>
                        </div>
                        <div class="input-group col-12 mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">#Hashtag</span>
                            </div>
                            <input type="text" class="form-control" name="hashTag">
                        </div>
                        <div class="input-group col-12 mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Image</span>
                            </div>
                            <input type="file" class="form-control" name="image">
                        </div>
                    </div>

                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit"  >Post</button>
                </div>
            </form>
        </div>

    </div>
</div>
