<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>tab标签选项卡切换jQuery特效</title>

<style>
*{margin:0;padding:0;list-style:none;}
body{font-size:12px;color:#666;text-align:left;}
h1{text-align:center;}

.tabbox{width:500px;height:140px;margin:100px auto;background:#f0f0f0;font-family:'微软雅黑';}
.tabbox .tab{overflow:hidden;background:#ccc;}
.tabbox .tab a{display:block;padding:10px 20px;float:left;text-decoration:none;color:#333;}
.tabbox .tab a:hover{background:#E64E3F;color:#fff;text-decoration:none;}
.tabbox .tab a.on{background:#E64E3F;color:#fff;text-decoration:none;}
.tabbox .content{overflow:hidden;width:500px;height:100px;position:relative;}
.tabbox .content ul{position:absolute;left:0;top:0;height:100px;}
.tabbox .content li{width:500px;height:100px;float:left;}
.tabbox .content li p{padding:10px;}
</style>

</head>
<body>

<!-- 代码部分begin -->
<div class="tabbox">
	<div class="tab">
    	<a href="javascript:;" class="on">tab1</a>
        <a href="javascript:;">tab2</a>
        <a href="javascript:;">tab3</a>
        <a href="javascript:;">tab4</a>
    </div>
    <div class="content">
    	<ul>
        	<li><p>tab1内容1</p></li>
            <li><p>tab1内容2</p></li>
            <li><p>tab1内容3</p></li>
            <li><p>tab1内容4</p></li>
        </ul>
    </div>
</div>

<h1><a href="tab3.jsp">效果一</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="tab2.jsp">效果二</a></h1>

<script src="js/jquery-1.9.1.js"></script>
<script>
$(function(){
	$('.tabbox .content ul').width(500*$('.tabbox .content li').length+'px');
	$(".tabbox .tab a").mouseover(function(){
		$(this).addClass('on').siblings().removeClass('on');
		var index = $(this).index();
		number = index;
		var distance = -500*index;
		$('.tabbox .content ul').stop().animate({
			left:distance
		});
	});
	
	var auto = 1;  //等于1则自动切换，其他任意数字则不自动切换
	if(auto ==1){
		var number = 0;
		var maxNumber = $('.tabbox .tab a').length;
		function autotab(){
			number++;
			number == maxNumber? number = 0 : number;
			$('.tabbox .tab a:eq('+number+')').addClass('on').siblings().removeClass('on');
			var distance = -500*number;
			$('.tabbox .content ul').stop().animate({
				left:distance
			});
		}
		var tabChange = setInterval(autotab,3000);
		//鼠标悬停暂停切换
		$('.tabbox').mouseover(function(){
			clearInterval(tabChange);
		});
		$('.tabbox').mouseout(function(){
			tabChange = setInterval(autotab,3000);
		});
	  }  
});
</script>
<!-- 代码部分end -->

</body>
</html>
