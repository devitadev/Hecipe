<%@include file="../connect.jsp" %>

<%
    String commentId = request.getParameter("commentId");
    String foodId = request.getParameter("foodId");
    String comment = request.getParameter("edited-comment");

    boolean validate = true;
    String err = "";
    
    if(comment.isEmpty()){
        if(err != "") err = err + "&";
        err = err + "err1=content must be filled";
        validate = false;
    } 
/* ini belom
    // ilangin space didepan dan belakang
    comment = comment.replace(/(^\s*)|(\s*$)/gi,"");
    // pastiin gk ad space double
    comment = comment.replace(/[ ]{2,}/gi," ");
    comment = comment.replace(/\n /,"\n");*/
    int numberOfWords = comment.split(" ").length;
    if(numberOfWords < 5){
        if(err != "") err = err + "&";
        err = err + "err1=content must be at least 5 words";
        validate = false;
    }

    if(validate){
        String query = String.format("UPDATE Comment SET content='%s' WHERE comment_id='%s'", comment, commentId);
        st.executeUpdate(query);

        response.sendRedirect("../food_detail.jsp?id=" + foodId);
    }else{

    }
    
%>