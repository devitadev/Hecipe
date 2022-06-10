<%@include file="../connect.jsp" %>

<%
    String userId = session.getAttribute("userId").toString();
    String foodId = request.getParameter("id");
    String quantity = request.getParameter("quantity");

    String query;
    if(Integer.parseInt(quantity) <= 0){
        query = String.format("DELETE FROM Cart WHERE user_id='%s' AND food_id='%s'", userId, foodId);
    } 
    else{
        query = String.format("UPDATE Cart SET quantity='%s' WHERE user_id='%s' AND food_id='%s'", quantity, userId, foodId);
    }

    st.executeUpdate(query);

    response.sendRedirect("../view_cart.jsp");
%>