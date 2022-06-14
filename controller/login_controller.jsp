<%@include file="../connect.jsp" %>

<% 
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String rememberMe = request.getParameter("rememberMe");

    boolean validate = true;
    String err = "";

    // validasi email
    if(email.isEmpty()){
        err = err + "errEmail=email must be filled";
        validate = false;
    }
    if(!email.contains("@") || !email.contains(".")){
        if(err != "") err = err + "&";
        err = err + "errEmail=email should contain '@' and '.'";
        validate = false;
    }/* ini belom
    let position = email.search("@");
    if(email.includes("@", (position+1))){
        if(err != "") err = err + "&";
        err = err + "errEmail=email contain only one '@'";
        validate = false;
    }
    if(email.charAt(position+1) == '.' || email.charAt(position-1) == '.'){
        if(err != "") err = err + "&";
        err = err + "errEmail='@' and '.' should not be side by side";
        validate = false;
    }*/
    
    // validasi password
    if(password.isEmpty()){
        if(err != "") err = err + "&";
        err = err + "errPass=password must be filled";
        validate = false;
    }

    if(validate){
        String query = String.format("SELECT * FROM MsUser WHERE email='%s' AND user_password='%s'", email, password);

        ResultSet result = st.executeQuery(query);

        if(result.next()) {
            // kalo email dan password sesuai
            // cari tau member atau admin
            String role = result.getString("user_role");
            String userId = result.getString("user_id");

            if(rememberMe != null && rememberMe.equals("remember")) {
                // buat cookie
                Cookie rememberId = new Cookie("userId", userId);
                Cookie rememberRole = new Cookie("role", role);

                // set age dari cookie -> 24 jam
                rememberId.setMaxAge(24 * 60 * 60);
                rememberRole.setMaxAge(24 * 60 * 60);

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
    }else{
        response.sendRedirect("../login.jsp?" + err);
    }
    

%>