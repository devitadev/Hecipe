<%@include file="../connect.jsp" %>

<%
    String commentId = request.getParameter("commentId");
    String foodId = request.getParameter("foodId");
    String comment = request.getParameter("edited-comment");

    String query = String.format("UPDATE Comment SET content='%s' WHERE comment_id='%s'", comment, commentId);
    st.executeUpdate(query);

    response.sendRedirect("../food_detail.jsp?id=" + foodId);
%>