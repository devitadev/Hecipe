<%@include file="connect.jsp" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = "member";

    // cek apakah ada user yang udah pernah pake emailnya
    Connect connect = Connect.getConnection();
    String query = "SELECT * FROM MsUser WHERE email='" + email + "'"; 

    ResultSet result = connect.executeQuery(query);

    if(result.next()) {
        // kalo email udah dipake
       response.sendRedirect("register.jsp?err=This email have been registered before");
    }
    else{
        // kalo email belum dipake
        String queryInsert = "INSERT INTO MsUser VALUES ('" + email + "', '" + name + "', '" + password + "', '" + role + "')";
        Integer resultInsert = connect.executeUpdate(queryInsert);
        response.sendRedirect("login.jsp");
    }
    
%>