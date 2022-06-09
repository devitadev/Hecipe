<%@include file="../connect.jsp" %>

<%
    String commentId = request.getParameter("id");
    String foodId = request.getParameter("back");

    String query = String.format("DELETE FROM Comment WHERE comment_id=%s", commentId);
    st.executeUpdate(query);

    response.sendRedirect("../food_detail.jsp?id=" + foodId);
%>