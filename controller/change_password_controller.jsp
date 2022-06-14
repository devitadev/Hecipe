<%@include file="../connect.jsp" %>

<%
    String id = request.getParameter("id");
    String oldPassword = request.getParameter("old");
    String newPassword = request.getParameter("new");
    String confirmPassword = request.getParameter("confirm");

    boolean validate = true;
    String err = "";

    // validasi old
    if(oldPassword.isEmpty()){
        err = err + "errOld=old password must be filled";
        validate = false;
    } 

    // validasi new
    if(newPassword.isEmpty()){
        if(err != "") err = err + "&";
        err = err + "errNew=New password must be filled";
        validate = false;
    } 

    if(newPassword.length() < 6){
        if(err != "") err = err + "&";
        err = err + "errNew=New password length must be at least 6 characters";
        validate = false;
    }

    if(!newPassword.matches(".*[^a-z].*")){
        if(err != "") err = err + "&";
        err = err + "errNew=New password must contain at least 1 number";
        validate = false;
    } 

    if(!newPassword.matches(".*[^0-9].*")){
        if(err != "") err = err + "&";
        err = err + "errNew=New password must contain at least 1 alphabet";
        validate = false;
    }

    // validasi confirm password
    if(!newPassword.equals(confirmPassword)){
        if(err != "") err = err + "&";
        err = err + "errConfirm=Confirm password must be equals to New password";
        validate = false;
    }

    if(validate){
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
    }else{
        //out.println(newPassword + " " + confirmPassword);
        response.sendRedirect("../change_password.jsp?" + err);
    }
    
    
%>