<%@include file="../connect.jsp" %>

<%
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("userId") || cookie.getName().equals("role")) {
                cookie.setMaxAge(0);
                cookie.setPath( "/Hecipe" );
                response.addCookie(cookie);
            }
        }
    }
    session.invalidate();

    response.sendRedirect("../home.jsp");
%>