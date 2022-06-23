<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
	<!-- 스클립틀릿에 내부에서 사용할 수 있는 내장 객체 -->
	<!-- 내장 객체 타입 - 참조명 -->
	<!-- JspWriter - out -->
	<!-- HttpServletRequest - request -->
	<!-- HttpServletResponse - response -->
	<!-- HttpSession - session -->
	<!-- ServletContext - application -->
	<!-- ServletConfig - config  -->
	<!-- Object(this) - page   -->
	
	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	//스클립틀릿. 자바 코드 영역으로 자바 로직을 짤 수 있다.
	//jsp는 view단으로 이용되므로 out.print(),out.println()만 알아두자.
	%>
	
	
	<%-- jsp page에서만 사용가능한 속성을 추가 --%>
	<% pageContext.setAttribute("pageAttribute","jspPage속성"); %>
	
	<%-- ${스코프 한정사.속성명} = 현재 스코프의 속성만 찾게된다. --%>
	Page Attribute: ${pageScope.pageAttribute}<br>
	Request Attribute: ${requestScope.requestAttribute}<br> 
	Session Attribute: ${sessionScope.sessionAttribute}<br> 
	Application Attribute: ${applicationScope.applicationAttribute}<br>
	<br>
	
	<%-- ${속성명} = 페이지,요청,세션,애플리케이션(서블릿컨텍스트)순서로 속성 탐색 --%>
	Page Attribute: ${pageAttribute}<br>
	Request Attribute: ${requestAttribute}<br> 
	Session Attribute: ${sessionAttribute}<br> 
	Application Attribute: ${applicationAttribute}<br>
	<br>
		
	<%-- 속성에 담겨져 있는 것이 Array또는 List객체인 경우 속성[인덱스]로 사용가능하다 --%>
	속성에 들어있는 것이 배열 객체인 경우: ${stringArray[0]}, ${stringArray[1]}, ${stringArray[2]}<br>
	속성에 들어있는 것이 리스트 객체인 경우: ${stringList[0]},${stringList[1]},${stringList[2]}<br>
	<%-- 속성에 담겨져 있는 것이 Map객체인 경우 속성.키이름 으로 사용가능하다 --%>
	속성에 들어있는 것이 맵 객체인 경우: ${map.key1},${map.key2},${map.key3}<br><br>
	<%-- 스크립틀릿의 getAttribute의 경우 어느 스코프 저장소에서 꺼내올 것인지 해당 객체를 명시해야했다. --%>
	<%-- ${속성}을 사용하면 자동으로 넓은 스코프에 속성이 있는지 자동으로 탐색해줌 --%>
	<%-- ${속성}을 사용하면 setAttribute시의 타입으로 자동 형변환 해줌 (getAttribute()메서드 사용시 return타입 Object) --%>
	
	
	
	<%-- View단에서 요청 쿼리 파라메터들,요청 헤더,쿠키, 컨텍스트 초기화 파라메터 저장소 한정사를 사용할 수 있다. --%>
	userId 쿼리 파라메터 첫번째것만(el): ${param.userId}<br>
	userId 쿼리 파라메터 여러개 존재한다면 다뽑음(el): ${paramValues.useId[0]},${paramValues.useId[1]}<br>
	<%
	//첫번째에 해당하는 쿼리 파라메터만 뽑는 메서드
	String queryParam= request.getParameter("userId"); 
	out.println("userId 쿼리 파라메터(스크립트릿): "+queryParam+"<br>");
	%>
	<%--  쿼리 파라메터가 여러개라면 아래의 EL은 첫번째 파라메터를 리턴함 --%>
	
	userId 쿼리 파라메터 여러개 존재한다면 다뽑음:
	<%
	//같은 쿼리 파라메터가 여러개일 때 사용하는 메서드
	String[] queryParams = request.getParameterValues("userId");
	//쿼리 파라메터가 안넘어올 수 있으므로 null체크 꼭들어가야함
	if(queryParams!=null){
		for(int i=0;i<queryParams.length;i++){
			out.print(queryParams[i]+",");
		}
	}else{
		out.print("userId 쿼리 파라메터 없음");
	}
	%><br><br>
	
	
	<%-- http요청 헤더 --%>
	<%-- ${header.헤더명} or 헤더명에 특수문자가 포함되는 경우 ${header["헤더명"]}  --%>
	
	<%
	out.println("http요청 헤더<br>");
	Enumeration<String> headers = request.getHeaderNames();
	while(headers.hasMoreElements()){
		String headerName = headers.nextElement();
		out.println(headerName +": "+ request.getHeader(headerName) +"<br>");
	}
	out.println("<br>");
	%>
	
	속성이 null이면 EL은 아무것도 출력하지 않는다: ${noAttribute}<br>	
		
	문자열:${"test3"}<br>
	문자열:${'test4'}<br>
	정수:${1+1}<br>
	부동소수점:${1+1.1}<br>
	
</body>
</html>