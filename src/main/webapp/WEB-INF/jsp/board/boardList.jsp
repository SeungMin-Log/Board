<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판</title>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Custom CommonJS -->
    <script src="/js/common.js"></script>
    <!-- Custom CommonCSS -->
    <link rel="stylesheet" type="text/css" href="/css/common.css">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        /* OnLoad 함수 */
        $(function(){
            goSearch(1);
        })

        /* 조회 */
        function goSearch(page){
            $("#currentPage").val(page);

            var params = $("#searchForm").serialize();

            var url = "/getList.do";
            var successFunction = function(result){
                createTable(result.result);
                createPaging(result);
            }
            var errorFunction = function(error){}
            var async = "";

            ajaxCall(url, params, successFunction, errorFunction, async)
        }

        /* 테이블 생성 */
        function createTable(list){
            $("#tableBody").empty();
            var html = "";
            for (var i=0; i<list.length; i++){
                html += "<tr style='cursor:pointer')>";
                /* 각 컬럼명 작성하면됨 */
                html += "<td>"+list[i].BOARD_NO+"</td>";
                html += "<td>"+list[i].BOARD_TITLE+"</td>";
                html += "<td>"+list[i].REG_DT+"</td>";
                html += "<td>"+list[i].REG_ID+"</td>";
                html += "</tr>";
            }
            $("#tableBody").append(html);
        }

        /* 페이지번호 및 버튼 생성 */
        function createPaging(result){
            $("#pagination").empty();
            var html = "";
            var pre = (result.currentPage)-1;
            var next = (result.currentPage)+1;
            var fst = 1;
            var end = (result.totalPage);

            /* 처음으로 버튼 생성여부 */
            if (result.fstBtn == true){
                //html += "<button onclick='ajaxCall("+fst+")'>"+'<<'+"</button>";
                html += "<li class='page-item'><a class='page-link' href='#' onclick='goSearch("+fst+")'><<</a></li>"
            }
            /* 이전버튼 생성여부 */
            if (result.preBtn == true){
                //html += "<button onclick='ajaxCall("+pre+")'>"+'<'+"</button>";
                html += "<li class='page-item'><a class='page-link' href='#' onclick='goSearch("+pre+")'><</a></li>"
            }
            for (var i=result.startPage; i<=result.endPage; i++){
                /!* 현재 페이지번호에 배경색 추가 *!/
                if (i == result.currentPage){
                    //html += "<button onclick='ajaxCall("+i+")' style='background-color: darkseagreen'>"+i+"</button>";
                    html += "<li class='page-item active' aria-current='page'><a class='page-link' href='#' onclick='goSearch("+i+")'>"+i+"</a></li>"
                }else{
                    //html += "<button onclick='ajaxCall("+i+")'>"+i+"</button>";
                    html += "<li class='page-item'><a class='page-link' href='#' onclick='goSearch("+i+")'>"+i+"</a></li>"
                }
            }
            /* 다음버튼 생성여부 */
            if (result.nextBtn == true){
                //html += "<button onclick='ajaxCall("+next+")'>"+'>'+"</button>";
                html += "<li class='page-item'><a class='page-link' href='#' onclick='goSearch("+next+")'>></a></li>"
            }
            /* 끝으로버튼 생성여부 */
            if (result.endBtn == true){
                //html += "<button onclick='ajaxCall("+end+")'>"+'>>'+"</button>";
                html += "<li class='page-item'><a class='page-link' href='#' onclick='goSearch("+end+")'>>></a></li>"
            }

            $("#pagination").append(html);
        }
    </script>
</head>
<body>
    <header>
        <div class="logo">
            <i class="fab fa-accusoft"></i>
            <h2>Board</h2>
        </div>
        <div class="menu">
            <a href="#" class="item item1">Menu</a>
            <a href="#" class="item item2">Menu</a>
            <a href="#" class="item item3">Menu</a>
            <a href="#" class="item item4">Menu</a>
            <a href="#" class="item item5">Menu</a>
        </div>
    </header>
    <div class="container" style="padding-top: 30px">
        <h1 style="padding-bottom: 10px;">테스트</h1>
        <form id="searchForm" action="">
            <!-- 현재 페이지 -->
            <input id="currentPage" name="currentPage" hidden="hidden">
            <!-- 검색 조건 -->
<%--            <div>
                <table class="table table-bordered" style="text-align: center;">
                    <colgroup>
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                        <col width="12.5%">
                    </colgroup>
                    <thead class="tableHead">
                        <tr>
                            <td>검색조건1</td>
                            <td>
                                <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                    <option selected>Open this select menu</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                            </td>
                            <td>검색조건2</td>
                            <td>
                                <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                                    <option selected>Open this select menu</option>
                                    <option value="1">One</option>
                                    <option value="2">Two</option>
                                    <option value="3">Three</option>
                                </select>
                            </td>
                            <td>검색조건3</td>
                            <td>
                                <input type="text" class="form-control-sm" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                            </td>
                            <td>검색조건4</td>
                            <td>
                                <input type="text" class="form-control-sm" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                            </td>
                        </tr>
                    </thead>
                </table>
            </div>--%>
            <!-- 상단 버튼 -->
<%--            <div style="text-align: right">
                <button type="button" class="btn btn-secondary btn-sm" style="width: 70px">조회</button>
                <button type="button" class="btn btn-secondary btn-sm" style="width: 70px">엑셀</button>
            </div>--%>
            <!-- 데이터 테이블 -->
            <div style="padding-top: 10px;">
                <p>-조회결과-</p>
                <table class="table table-bordered" style="text-align: center">
                    <thead class="tableHead">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성일</th>
                            <th scope="col">작성자</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody" class="tableBody"></tbody>
                </table>
            </div>
        </form>
        <!-- 페이지 -->
        <div id="pageDiv" class="pageDiv">
            <nav aria-label="...">
                <ul id="pagination" class="pagination pagination-sm" style="justify-content : center;"></ul>
            </nav>
        </div>
    </div>
</body>
</html>
