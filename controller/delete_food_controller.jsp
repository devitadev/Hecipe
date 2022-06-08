<%@include file="../connect.jsp" %>
<%
    String id = request.getParameter("food_id");

    String query = String.format("DELETE FROM msfood WHERE food_id = ('%s')", id);
    st.executeUpdate(query);

    response.sendRedirect("../food_list.jsp");
%>