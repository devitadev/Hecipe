<%@include file="../connect.jsp" %>

<%
    String userId = session.getAttribute("userId").toString();
    String foodId = request.getParameter("foodId");
    String comment = request.getParameter("comment");

    String query = String.format("INSERT INTO Comment (user_id, food_id, content) VALUES (%s, %s, '%s')", userId, foodId, comment);
    st.executeUpdate(query);

    response.sendRedirect("../food_detail.jsp?id=" + foodId);
%>