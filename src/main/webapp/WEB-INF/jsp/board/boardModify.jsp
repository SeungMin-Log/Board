<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정/삭제</title>
    <%@include file="/WEB-INF/jsp/board/boardLayOut.jsp"%>
    <script>
        function goModify(){
            if (!confirm("수정하시겠습니까?")) {
                return;
            } else {
                $("#mode").val("modify");

                var params = $("#modifyForm").serialize();
                var url = "/boardCud.do";
                var successFunction = function(result){
                    alert("수정이 완료되었습니다");
                    window.opener.location.reload();
                    window.close();
                }
                var errorFunction = function(error){
                    alert("오류가 발생했습니다");
                }
                var async = "";

                ajaxCall(url, params, successFunction, errorFunction, async)
            }
        }

        function goDelete(){
            if (!confirm("삭제하시겠습니까?")) {
                return;
            } else {
                $("#mode").val("delete");

                var params = $("#modifyForm").serialize();
                var url = "/boardCud.do";
                var successFunction = function(result){
                    alert("삭제가 완료되었습니다");
                    window.opener.location.reload();
                    window.close();
                }
                var errorFunction = function(error){
                    alert("오류가 발생했습니다");
                }
                var async = "";

                ajaxCall(url, params, successFunction, errorFunction, async)
            }
        }
    </script>
</head>
<body>
    <header>
        <div class="logo">
            <i class="fab fa-accusoft"></i>
            <span>수정/삭제</span>
        </div>
        <div class="menu">
            <a class="item item2"></a>
            <a class="item item3"></a>
            <a class="item item4"></a>
        </div>
    </header>
    <form id="modifyForm" action="">
        <input hidden="hidden" id="mode" name="mode" value="">
        <input hidden="hidden" name="BOARD_NO" value="${detailData.BOARD_NO}">
        <div style="padding-top: 20px; padding-left: 20px;">
            <span>제목</span>
            <input id="BOARD_TITLE" name="BOARD_TITLE" value="${detailData.BOARD_TITLE}"/>
            <span>작성일</span>
            <input id="REG_DT" name="REG_DT" value="${detailData.REG_DT}"/>
            <span>작성자</span>
            <input id="REG_ID" name="REG_ID" value="${detailData.REG_ID}"/>
            </br>
            </br>
            <span>내용</span>
            </br>
            <textarea id="BOARD_CONTENT" name="BOARD_CONTENT" style="width: 710px; height: 300px;">${detailData.BOARD_CONTENT}</textarea>
            </br>
            <button type="button" onclick="goModify();" class="btn btn-primary btn-sm" style="margin-top: 10px;">수정</button>
            <button type="button" onclick="goDelete();" class="btn btn-primary btn-sm" style="margin-top: 10px;">삭제</button>
        </div>
    </form>
</body>
</html>
