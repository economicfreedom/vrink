<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/layout/header.jsp" %>


<script>

    $(document).ready(function () {
        $("#delete").click(function () {


        })

    })

    function update(id) {

        location.href = "/board/update-form/" + id;
    }

    function deleteBoard(id) {

        fetch('/board/del/' + id, {
            method: 'DELETE',

        })

            .then(response => {
                if (!response.ok) {
                    alert("");
                } else {
                    location.href = "/";
                }
            })
            .then(data => console.log(data))
            .catch(error => console.error('Error:', error));

    }
</script>

<div class="container">
    <div class="row">
        <div class="title">

            <h1>${dto.title}</h1>
            <span> ${dto.nickname}</span>
            <br>
            <small>${dto.createdAt}</small>

            <%--            <c:if test="${dto.userId ==3}">--%>

            <button type="button" style="float: right;margin-left: 10px " class="btn btn-default"
                    onclick="update(${dto.communityId})">
                수정
            </button>
            <button type="button" style="float: right;margin-left: 20px " class="btn btn-danger"
                    onclick="deleteBoard(${dto.communityId})">삭제
            </button>
            <%--            </c:if>--%>

            <hr>


        </div>
        <div class="content">
            <span>
                ${dto.content}
            </span>
        </div>
    </div>


</div>


<%@ include file="/WEB-INF/view/layout/footer.jsp" %>

