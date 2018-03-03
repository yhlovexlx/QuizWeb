<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--使EL表达式${}生效，小心坑啊--%>
<%@page isELIgnored="false" %>
<%--使JSTL <c: forEach>这样的标签生效--%>
<%--
  Created by IntelliJ IDEA.
  User: jiaqi
  Date: 2018/1/17
  Time: 上午11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="resources/js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script src="resources/js/jquery.nav.js" type="text/javascript"></script>
    <script src="resources/js/canvas-particle.js" type="text/javascript"></script>
    <link href="resources/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/flat-ui.min.css" rel="stylesheet">
    <link href="resources/css/votepage.css" rel="stylesheet">
    <title>测评页</title>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#nav').onePageNav();
        });
        window.onload = function() {
            //配置
            var config = {
                vx: 4,	//小球x轴速度,正为右，负为左
                vy: 4,	//小球y轴速度
                height: 2,	//小球高宽，其实为正方形，所以不宜太大
                width: 2,
                count: 200,		//点个数
                // color: "121, 162, 185", 	//点颜色
                // stroke: "130,255,255", 		//线条颜色
                color: "121, 162, 185", 	//点颜色
                stroke: "130,255,255", 		//线条颜色
                dist: 6000, 	//点吸附距离
                e_dist: 20000, 	//鼠标吸附加速距离
                max_conn: 10 	//点到点最大连接数
            }

            //调用
            CanvasParticle(config);
        }

    </script>
</head>
<body>
<h3 class="headline">请对以下人员进行测评</h3>
<ul id="nav">
    <c:forEach items="${names}" var="name" varStatus="nStatus">
        <li><a href="#section${nStatus.count}">${name}</a></li>
    </c:forEach>
</ul>
<div id="mydiv" style="height:1000px;">
<div id="container">

    <div class="form-group">
        <form method="POST" action="submit">
            <c:forEach items="${names}" var="name" varStatus="nStatus">
                <div class="section" id="section${nStatus.count}">
                    <p class="name">
                            ${nStatus.count}. ${name}：
                    </p>
                    <input type="hidden" name="name${nStatus.count}" value="${name}" />
                    <input type="hidden" name="id${nStatus.count}" value="${ids[nStatus.count-1]}" />
                    <c:forEach items="${titles}" var="title" varStatus="tStatus">
                        <div class="question">
                            <span class="questionSpan">${title}</span>
                            <c:forEach items="${options[tStatus.count-1]}" var="option" varStatus="oStatus">
                                <label class="radio myLable" for="radio${nStatus.count}.${tStatus.count}.${oStatus.count}" >
                                    <input type="radio" name="option${nStatus.count}.${tStatus.count}" value="${oStatus.count-1}" id="radio${nStatus.count}.${tStatus.count}.${oStatus.count}" data-toggle="radio" class="custom-radio" required />
                                    <span class="icons"><span class="icon-unchecked"></span><span class="icon-checked"></span></span>
                                        ${option}
                                </label>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </div>
            </c:forEach>
            <button type="submit" id="btnSubmit" class="btn btn-hg btn-primary btn-wide">提交</button>
        </form>
    </div>

</div>
</div>
</body>
</html>
