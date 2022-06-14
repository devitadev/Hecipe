<%@include file="../connect.jsp" %>

<%
    String commentId = request.getParameter("commentId");
    String foodId = request.getParameter("foodId");
    String comment = request.getParameter("edited-comment");

    boolean validate = true;
    String err = "";
    
    if(comment.isEmpty()){
        if(err != "") err = err + "&";
        err = err + "erredit1-"+commentId+"=content must be filled";
        validate = false;
    } 

    comment = comment.trim();
    int numberOfWords = comment.split("\\s+").length;
    if(numberOfWords < 5){
        if(err != "") err = err + "&";
        err = err + "erredit2-"+commentId+"=content must be at least 5 words";
        validate = false;
    }

    if(validate){
        String query = String.format("UPDATE Comment SET content='%s' WHERE comment_id='%s'", comment, commentId);
        st.executeUpdate(query);

        response.sendRedirect("../food_detail.jsp?id=" + foodId);
    }else{
        response.sendRedirect("../food_detail.jsp?id=" + foodId + '&' + err);
    }
    
%>