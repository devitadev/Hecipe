<%@include file="../connect.jsp" %>

<%
    String userId = session.getAttribute("userId").toString();
    String foodId = request.getParameter("foodId");
    String comment = request.getParameter("comment");

    boolean validate = true;
    String err = "";

    if(comment.isEmpty()){
        if(err != "") err = err + "&";
        err = err + "errpost1=content must be filled";
        validate = false;
    }

    comment = comment.trim();
    int numberOfWords = comment.split("\\s+").length;
    if(numberOfWords < 5){
        if(err != "") err = err + "&";
        err = err + "errpost2=content must be at least 5 words";
        validate = false;
    }

    if(validate){
        String query = String.format("INSERT INTO Comment (user_id, food_id, content) VALUES (%s, %s, '%s')", userId, foodId, comment);
        st.executeUpdate(query);

        response.sendRedirect("../food_detail.jsp?id=" + foodId);
    }else{
        response.sendRedirect("../food_detail.jsp?id=" + foodId + '&' + err);
    }

    
%>