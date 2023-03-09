<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BoardList</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="/js/common.js"></script>
</head>
<body>
    <script>
        $(function(){
            goSearch();
        })

        function goSearch(){
            var url = "/getList.do";
            var successFunction = function(result){

            }
            var errorFunction = function(error){

            }
            var async = "";

            ajaxCall(url, "", successFunction, errorFunction, async)
        }
    </script>
</body>
</html>
