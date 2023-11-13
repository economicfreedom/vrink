<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ include file="/WEB-INF/view/layout/admin_header.jsp" %>


<script>
    function deleteBoard(id) {
        Swal.fire({
            title             : "정말 삭제하시겠습니까?",
            text              : "되돌릴 수 없습니다!",
            icon              : "warning",
            showCancelButton  : true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor : "#d33",
            confirmButtonText : "삭제하기"
        }).then((result) => {
            if (result.isConfirmed) {
                fetch('/admin/notice-delete/' + id, {
                    method: 'DELETE',
                })
                    .then(response => {
                        if (!response.ok) {
                            Swal.fire({
                                icon: "error",
                                title: "에러입니다",
                            });
                        } else {
                            location.href = "/admin/notice";
                        }
                    })
                    .then(data => console.log(data))
                    .catch(error => console.error('Error:', error));
            }
        });
    }
</script>

<div class="card m-4">
    <div class="card-header"><h3><i class="fa-solid fa-clipboard-check"></i> 공지사항
        상세 ${noticeDetail.type == 'community' ? '<text style="color: blue; font-size:25px;">자유게시판 <i class="fa-solid fa-clipboard-list"></i></text>' : '<text style="color: red; font-size:25px;">의뢰게시판 <i class="fa-solid fa-clipboard-question"></i></text>'}
    </h3></div>
    <%--    <div class="container" style="margin: 50px auto;border: 1px solid black;">--%>
    <div class="row" style="margin: 10px;">
        <div class="title">
            <div>
                <span>작성자 : 관리자</span> <span>작성일 : ${noticeDetail.createdAt}</span></div>
            <div class="my-3">
                <h2>제목 : ${noticeDetail.title}
                    <button type="button" style="float: right;margin-left: 5px " class="btn btn-secondary btn-block"
                            onclick="deleteBoard(${noticeDetail.noticeId})">삭제
                    </button>
                    <button type="button" style="float: right;margin-left: 20px " class="btn btn-secondary btn-block"
                            onclick="location.href='/admin/notice-update?id=${noticeDetail.noticeId}'">수정
                    </button>
            </div>
            <hr>


        </div>
        <div class="content">
            <span>
                ${noticeDetail.content}
            </span>
        </div>
        <%--        <hr style="background-color: black;height: 2px">--%>
    </div>
</div>
<button type="button" style="margin-left: 25px; margin-top: -10px" class="btn btn-secondary btn-block"
        onclick="location.href='/admin/notice'">목록보기
</button>

<%@ include file="/WEB-INF/view/layout/admin_footer.jsp" %>