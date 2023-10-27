<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp"%>



<div class="container">
    <div class="row">
        <div class="title">

            <h1>${dto.title}</h1>
            <span> ${dto.nickname}</span>
            <br>
            <small>${dto.createdAt}</small>
            <hr>

        </div>
        <div class="content">
            <span>
                ${dto.content}
            </span>
        </div>
    </div>


</div>



<%@ include file="/WEB-INF/view/layout/footer.jsp"%>

