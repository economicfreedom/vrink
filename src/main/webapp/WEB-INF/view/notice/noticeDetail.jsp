<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>
<div class="container">
    <div class="row">
        <div class="title mt-5">

            <h1>${notice.title}</h1>
            <span>관리자</span>
            <br>
            <small>${notice.createdAt}</small>

            <%--            <c:if test="${dto.userId ==3}">--%>

            <%--            </c:if>--%>

            <hr>


        </div>
        <div class="content">
            <span>
                ${notice.content}
            </span>
        </div>
        <%--        <hr style="background-color: black;height: 2px">--%>
        <hr>
    </div>

</div>

<style>
    .custom-list-group {
        border: none;
    }

    .custom-list-item {
        border: none;
        background-color: transparent;
        padding: 10px 0;
    }

    .custom-textarea {
        resize: none;
        border: none;
        background-color: transparent;
        box-shadow: none;
        width: 100%;
        overflow: hidden;
        margin: 10px 0;
    }

    .comment-nickname {
        display: inline;
        margin-right: 5px;
    }

    .comment-date {
        display: inline;
        font-size: 0.9em;
        color: #777;
        margin-left: 5px;
    }

    .comment-buttons {
        margin-top: 10px;
    }

    .comment-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
    }
</style>

<%@ include file="/WEB-INF/view/layout/footer.jsp" %>




