<%@include file="../connect.jsp" %>

<%
    //ambil inputan
    String id = request.getParameter("id");
    String oldPassword = request.getParameter("old");
    String newPassword = request.getParameter("new");
    
    String query = String.format("SELECT * FROM MsUser WHERE user_password='%s'", oldPassword);
    ResultSet rs = st.executeQuery(query);

    if(rs.next()){
        //kalo ketemu passwordnya
        String queryChange = String.format("UPDATE MsUser SET user_password='%s' WHERE user_id='%s' ", newPassword, id);
        st.executeUpdate(queryChange);

        response.sendRedirect("../profile.jsp");
    }
    else{
        response.sendRedirect("../change_password.jsp?err=Incorrect old password");
    
    }
    
%>