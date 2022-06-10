<%@include file="../connect.jsp" %>

<%
    String userId = session.getAttribute("userId").toString();

    String query = String.format("DELETE FROM Cart WHERE user_id='%s'", userId);

    st.executeUpdate(query);

    response.sendRedirect("../view_cart.jsp");
%>