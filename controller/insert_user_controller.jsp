<%@include file="../connect.jsp" %>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirm password");
    String role = "member";

    boolean validate = true;
    String err = "";

    // validasi name
    if(name.isEmpty()){
        err = err + "errName1=name must be filled";
        validate = false;
    }
    if(name.length() < 3){
        if(err != "") err = err + "&";
        err = err + "errName2=name should be at least 3 characters";
        validate = false;
    }
    
    // validasi email
    if(email.isEmpty()){
        if(err != "") err = err + "&";
        err = err + "errEmail1=email must be filled";
        validate = false;
    }
    if(!email.contains("@") || !email.contains(".")){
        if(err != "") err = err + "&";
        err = err + "errEmail2=email should contain '@' and '.'";
        validate = false;
    }
    String temp = "a"+email+"a"; // biar cuma @@ pun bs kesplit
    if(temp.split("@").length > 2){
         if(err != "") err = err + "&";
        err = err + "errEmail3=email contain only one '@'";
        validate = false;
    }
    if(email.contains("@.") || email.contains(".@")){
        if(err != "") err = err + "&";
        err = err + "errEmail4='@' and '.' should not be side by side";
        validate = false;
    }
    
    // validasi password
    if(password.isEmpty()){
        if(err != "") err = err + "&";
        err = err + "errPass1=password must be filled";
        validate = false;
    }
    if(password.length() < 6){
        if(err != "") err = err + "&";
        err = err + "errPass2=password should be at least 6 characters";
        validate = false;
    }
    if(!password.matches(".*[0-9]+.*")){
        if(err != "") err = err + "&";
        err = err + "errPass3=password must contain at least one number";
        validate = false;
    }
    if(!password.matches(".*[a-zA-Z]+.*")){
        if(err != "") err = err + "&";
        err = err + "errPass4=password must contain at least one alphabet";
        validate = false;
    }

    // validasi confirm password
    if(!confirmPassword.equals(password)){
        if(err != "") err = err + "&";
        err = err + "errConfirmP=confirm password must match password";
        validate = false;
    } 

    if(validate){
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
    }else{
        response.sendRedirect("../register.jsp?" + err);
    }
    
%>