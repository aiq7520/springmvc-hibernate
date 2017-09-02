<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>raphael</title>
<script type="text/javascript" src="js/raphael.min.js"></script>
</head>
       <body>
        <div id="raphael"></div>
        <script type="text/javascript">
            var paper = Raphael("raphael", 1000, 1000);//在 raphael div中创建一个1000*1000的画布
            var circle = paper.circle(100, 100, 10); //画圆 \

            /* 
            attrName,value 不解释
            params(一个json对象)
            attrName 传入一个属性名字它将返回对应的值
            attrNames(数组) 返回对应的数组中属性对应的值
            */
            circle.attr("fill", "#f00");
            circle.attr("stroke", "#fff");
            
            var ellipse = paper.ellipse(200, 100, 40, 20);//画椭圆
            ellipse.attr("fill", "#ccc");
            ellipse.attr("stroke", "#000");
            
            var image = paper.image("img/aaa.jpg", 300, 100, 80, 80);//贴图 图片请自带
            
            var path = paper.path("M400 100L500 300");//画路径 从10.10 移动到90.90
            
            var rect1 = paper.rect(500, 100, 50, 50);// 正常的方形
            
            var rect2 = paper.rect(600, 100, 50, 50, 10);// 带10弧度的方形

            
            

        </script>
    </body>
</html>
