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
        err = err + "errName=name must be filled";
        validate = false;
    }
    if(name.length() < 3){
        if(err != "") err = err + "&";
        err = err + "errName=name should be at least 3 characters";
        validate = false;
    }
    
    // validasi email
    if(email.isEmpty()){
        if(err != "") err = err + "&";
        err = err + "errEmail=email must be filled";
        validate = false;
    }
    if(!email.contains("@") || !email.contains(".")){
        if(err != "") err = err + "&";
        err = err + "errEmail=email should contain '@' and '.'";
        validate = false;
    }
    int position = email.indexOf("@");/* ini belom
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
    if(password.length() < 6){
        if(err != "") err = err + "&";
        err = err + "errPass=password should be at least 6 characters";
        validate = false;
    }
    if(!password.matches(".*[^a-z].*")){
        if(err != "") err = err + "&";
        err = err + "errPass=password must contain at least one number";
        validate = false;
    }
    if(!password.matches(".*[^a-z].*")){
        if(err != "") err = err + "&";
        err = err + "errPass=password must contain at least one alphabet";
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