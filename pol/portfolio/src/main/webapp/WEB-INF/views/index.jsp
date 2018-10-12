<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
img {

margin: 0 auto;
}
</style>
<body>

  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" style="height: 600px;">

      <div class="item active">
        <img src="img/main/Img00.jpg" alt="Chania" style="margin: 0 auto;" >
        <div class="carousel-caption">
          <h3>복용법</h3>
          <p>올바른 복용법을 알려 드립니다</p>
        </div>
      </div>

      <div class="item">
        <img src="img/main/Img01.jpg" alt="Chania" width="460" height="345">
        <div class="carousel-caption">
          <h3>가까운 약국</h3>
          <p>운영중인 가까운 약국을 알려드립니다</p>
        </div>
      </div>
    
      <div class="item">
        <img src="img/main/Img02.jpg" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>게시판</h3>
          <p>궁금한 점을 물어 보세요.</p>
        </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

</body>
</html>