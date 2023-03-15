<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>게시판</title>
    <%@include file="/WEB-INF/jsp/board/boardLayOut.jsp"%>
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
                html += "<tr style='cursor:pointer' onclick='goModify("+list[i].BOARD_NO+")')>";
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

        /* 등록팝업 출력 */
        function goWrite(){
            var url = "/boardWritePop.do";
            var name = "writePop";
            callPopUp(url, 1000, 500);
        }

        /* 수정팝업 출력 */
        function goModify(BOARD_NO){
            var url = "/boardModifyPop.do?BOARD_NO=" + BOARD_NO;
            var name = "modifyPop";
            callPopUp(url, 1000, 500);
        }

        /* 차트 */
        function goChart(){
            alert("차트 기능 준비중입니다");
        }

        /* 지도 */
        function goMap(){
            alert("지도 기능 준비중입니다");
        }

        /* 관리자 */
        function goAdmin(){
            alert("관리자 기능 준비중입니다");
        }
    </script>
</head>
<body>
    <header>
        <div class="logo">
            <i class="fab fa-accusoft"></i>
            <span>포트폴리오</span>
        </div>
        <div class="menu">
            <a href="/boardList.do" class="item item1">게시판</a>
            <a href="#" onclick="goChart();" class="item item2">차트</a>
            <a href="#" onclick="goMap();" class="item item3">지도</a>
            <a href="#" onclick="goAdmin();" class="item item4">관리자</a>
        </div>
    </header>
    <div class="container" style="padding-top: 100px">
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
                <h3>-게시판-</h3>
                <table class="table table-striped table-hover table-bordered" style="text-align: center">
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
        <!-- 하단 버튼 -->
        <div>
            <button type="button" onclick="goWrite();" class="btn btn-primary btn-sm" style="width: 50px; display :inline-block; float: right;">등록</button>
        </div>
        <!-- 페이지 -->
        <div id="pageDiv" class="pageDiv">
            <nav aria-label="...">
                <ul id="pagination" class="pagination pagination-sm" style="justify-content : center; text-align: center"></ul>
            </nav>
        </div>
    </div>
</body>
</html>
