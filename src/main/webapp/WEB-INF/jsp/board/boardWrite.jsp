<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>등록</title>
    <%@include file="/WEB-INF/jsp/board/boardLayOut.jsp"%>
    <script>
        function goWrite(){
            if (!confirm("등록하시겠습니까?")) {
                return;
            } else {
                var params = $("#writeForm").serialize();
                var url = "/boardCud.do";
                var successFunction = function(result){
                    alert("등록이 완료되었습니다");
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
            <span>등록</span>
        </div>
        <div class="menu">
            <a class="item item2"></a>
            <a class="item item3"></a>
            <a class="item item4"></a>
        </div>
    </header>
    <form id="writeForm" action="">
        <input hidden="hidden" name="mode" value="write">
        <div style="padding-top: 20px; padding-left: 20px;">
            <span>제목</span>
            <input id="BOARD_TITLE" name="BOARD_TITLE"/>
            <span>작성일</span>
            <input id="REG_DT" name="REG_DT"/>
            <span>작성자</span>
            <input id="REG_ID" name="REG_ID"/>
            </br>
            </br>
            <span>내용</span>
            </br>
            <textarea id="BOARD_CONTENT" name="BOARD_CONTENT" style="width: 710px; height: 300px;"></textarea>
            </br>
            <button type="button" onclick="goWrite();" class="btn btn-primary btn-sm" style="margin-top: 10px;">등록</button>
        </div>
    </form>
</body>
</html>
