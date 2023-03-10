<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CSS TEST</title>
  <style>
    @import url(https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css);

    html,body {
      width: 1920px;
      height: 929px;
      margin: 0;
      padding: 0;
      font-family: 'NanumSquare', sans-serif;
    }

    .topTitle{
      width: 12%;
      height: 60px;
      float: left;
      text-align: center;
      background-color: #3A5870;
    }

    .topMenu{
      width: 88%;
      height: 60px;
      float: right;
      background-color: #3A5870;
    }

    .left{
      width: 12%;
      height: 869px;
      float: left;
      background-color: #5e5e5e;
    }

    .right{
      width: 88%;
      height: 864px;
      float: right;
    }

    .title{
      margin: 0;
      padding: 0;
      font-size: 18px;
      color: white;
      line-height: 60px;
      font-weight: bold;
    }

    a{
      text-decoration: none;
      outline: none;
    }

    header ul {
      list-style: none;
    }

    header li{
      float: left;
      margin-left: 30px;
      text-align: center;
      padding-top: 5px;
    }

    header a{
      font-size: 18px;
      color: white;
      font-weight: bold;
    }

    .leftMenu ul{
      list-style: none;
    }

    .leftMenu li{
      padding-top: 25px;
      margin-right: 60px;
    }

    .leftMenu a{
      width: 100%;
      font-size: 18px;
      color: white;
      font-weight: bold;
    }

    .topRight{
      padding-left: 850px;
    }

    .smallTitle{
      margin-top: 3%;
      margin-left: 3%;
    }

    .searchDiv {
      width: 93%;
      height: 100px;
      margin-top: 2%;
      margin-left: 3%;
      background-color: white;
      border: 1px solid #999999;
      border-radius: 1em;
    }

    .tableDiv{
      width: 93%;
      height: 500px;
      margin-top: 2%;
      margin-left: 3%;
      background-color: white;
      border: 1px solid #999999;
      border-radius: 1em;
    }

    img{
      margin-right: 15px;
    }

  </style>
</head>
<body>
  <div class="container">
    <div class="topTitle">
      <a class="title" href="#">통합정보관리시스템</a>
    </div>
    <diV class="topMenu">
      <header>
        <nav>
          <ul>
            <li><a href="#">GIS</a></li>
            <li><a href="#">실시간데이터</a></li>
            <li><a href="#">관측소정보</a></li>
            <li><a href="#">관측소통계</a></li>

            <li class="topRight"><img src="/images/board/tnb_home.png" alt="TEST" width="12px" height="12px"><a href="#">Home</a></li>
            <li><img src="/images/board/tnb_admin.png" alt="TEST" width="12px" height="12px"><a href="#">Login</a></li>
            <li><img src="/images/board/tnb_admin.png" alt="TEST" width="12px" height="12px"><a href="#">Admin</a></li>
          </ul>
        </nav>
      </header>
    </diV>
    <div class="left">
      <div class="leftMenu">
<%--        <nav>
          <ul>
            <li><img src="/images/board/tnb_home.png" alt="TEST" width="12px" height="12px"><a href="#">GIS</a></li>
            <li><img src="/images/board/tnb_home.png" alt="TEST" width="12px" height="12px"><a href="#">실시간데이터</a></li>
            <li><img src="/images/board/tnb_home.png" alt="TEST" width="12px" height="12px"><a href="#">관측소정보</a></li>
            <li><img src="/images/board/tnb_home.png" alt="TEST" width="12px" height="12px"><a href="#">관측소통계</a></li>
          </ul>
        </nav>--%>
      </div>
    </div>
    <div class="right">
      <h1 class="smallTitle">실시간데이터</h1>
      <div class="searchDiv">

      </div>
      <div class="tableDiv">

      </div>
    </div>
  </div>
</body>
</html>
