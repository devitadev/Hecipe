<%@include file="../connect.jsp" %>

<%
    String userId = session.getAttribute("userId").toString();
    String foodId = request.getParameter("id");
    String quantity = request.getParameter("quantity");

    boolean validate = true;
    String err = "";

    String query1 = String.format("SELECT * FROM Cart JOIN Msfood ON Cart.food_id=Msfood.food_id WHERE user_id='%s'", userId);
    
    ResultSet result = st.executeQuery(query1);
    
    if(quantity.isEmpty()){
        err = err + "errQty1=quantity must be filled";
        validate = false;
    }

    while(result.next()){
        Integer stock = result.getInt("food_quantity");

        if(Integer.parseInt(quantity) > stock){
            if(err != "") err = err + "&";
            err = err + "errQty2=remaining stock = " + stock;
            validate = false;
        }
    }

    if(validate){
        String query;
        if(Integer.parseInt(quantity) <= 0){
            query = String.format("DELETE FROM Cart WHERE user_id='%s' AND food_id='%s'", userId, foodId);
        } 
        else{
            query = String.format("UPDATE Cart SET quantity='%s' WHERE user_id='%s' AND food_id='%s'", quantity, userId, foodId);
        }

        st.executeUpdate(query);

        response.sendRedirect("../view_cart.jsp");
    }else{
        response.sendRedirect("../view_cart.jsp?" + err);
    }

    
%>