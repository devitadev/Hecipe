<%@include file="../connect.jsp" %>

<%
    String foodId = request.getParameter("id");
    String userId = session.getAttribute("userId").toString();

    String query = String.format("DELETE FROM Cart WHERE user_id='%s' AND food_id='%s'", userId, foodId);

    st.executeUpdate(query);

    response.sendRedirect("../view_chart.jsp");
%>