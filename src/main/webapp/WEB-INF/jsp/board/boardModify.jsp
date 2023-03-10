<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정/삭제</title>
    <%@include file="/WEB-INF/jsp/board/boardLayOut.jsp"%>
    <script>
        function goModify(){
            $("#mode").val("modify");
        }

        function goDelete(){
            $("#mode").val("delete");
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
    <form>
        <input hidden="hidden" id="mode" name="mode" value="">
    </form>
</body>
</html>
