<%@include file="../connect.jsp" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = "member";

    // cek apakah ada user yang udah pernah pake emailnya
    String query = String.format("SELECT * FROM MsUser WHERE email='%s'", email);

    ResultSet result = st.executeQuery(query);

    if(result.next()) {
        // kalo email udah dipake
       response.sendRedirect("../register.jsp?err=This email have been registered before");
    }
    else{
        // kalo email belum dipake
        String queryInsert = String.format("INSERT INTO MsUser (email, user_name, user_password, user_role) VALUES ('%s', '%s', '%s', '%s')", email, name, password, role);
        st.executeUpdate(queryInsert);
        response.sendRedirect("../login.jsp");
    }
%>