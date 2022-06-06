<%@include file="../connect.jsp" %>

<% 
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String rememberMe = request.getParameter("rememberMe");

    Connect connect = Connect.getConnection();
    String query = String.format("SELECT * FROM MsUser WHERE email='%s' AND user_password='%s'", email, password);

    ResultSet result = connect.executeQuery(query);

    if(result.next()) {
        // kalo email dan password sesuai
        // cari tau member atau admin
        String role = result.getString("user_role");
        String userId = result.getString("user_id");

        if(rememberMe != null && rememberMe.equals("remember")) {
            // buat cookie
            Cookie rememberId = new Cookie("userId", userId);
            Cookie rememberRole = new Cookie("role", role);

            // set age dari cookie
            // 24 JAM INI PERLU DIUBAH :)
            rememberId.setMaxAge(10 * 60);
            rememberRole.setMaxAge(10 * 60);

            rememberId.setPath( "/Hecipe");
            rememberRole.setPath( "/Hecipe" );

            // save cookie ke browser
            response.addCookie(rememberId);
            response.addCookie(rememberRole);
        }
        else{
            session.setAttribute("userId", userId);
            session.setAttribute("role", role);
        }

        response.sendRedirect("../home.jsp");
    }
    else{
        // kalo email atau password tidak sesuai
        response.sendRedirect("../login.jsp?err=Incorrect email or password");
    }

%>