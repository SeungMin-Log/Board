<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>등록</title>
    <%@include file="/WEB-INF/jsp/board/boardLayOut.jsp"%>
    <script>
        function goWrite(){

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
    <form>
        <input hidden="hidden" name="mode" value="write">

        <div style="padding-top: 20px; padding-left: 20px;">
            <span>제목</span>
            <input id="BOARD_TITLE" name="BOARD_TITLE"/>
            <span>등록일</span>
            <input id="REG_DT" name="REG_DT"/>
            <span>등록자</span>
            <input id="REG_ID" name="REG_ID"/>
        </div>
    </form>
</body>
</html>
