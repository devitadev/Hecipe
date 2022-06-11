<%@include file="../connect.jsp" %>

<%
    String id = request.getParameter("trId");
    String process = "true";
    
    
    String processQuery = String.format("UPDATE TrTransaction SET transaction_processed = ('%s') WHERE transaction_id = ('%s')", process, id );
    st.executeUpdate(processQuery);

    response.sendRedirect("../view_transactions.jsp");
%>