<%@include file="../connect.jsp" %>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("food_name");
    String category = request.getParameter("food_category");
    String description = request.getParameter("food_description");
    String image = request.getParameter("food_img");
    int price = Integer.parseInt(request.getParameter("food_price"));
    int quantity = Integer.parseInt(request.getParameter("food_qty"));

    boolean validate = true;
    String err = "";

    //validasi name
    if(name.isEmpty()){
        err = err + "errName=name must be filled";
        validate = false;
    } 

    if(name.length() < 3){
        if(err != "") err = err + "&";
        err = err + "errName=name should be at least 3 characters";
        validate = false;
    }

    // validasi description
    if(description.isEmpty()){
        if(err != "") err = err + "&";
        err = err + "errDesc=description must be filled";
        validate = false;
    }
    
    int wordCount = description.split(" ").length;
    if(wordCount < 5){
        if(err != "") err = err + "&";
        err = err + "errDesc=description should be at least 5 words";
        validate = false;
    }

    // validasi category
    if(category.isEmpty()){
        if(err != "") err = err + "&";
        err = err + "errCategory=category must be chosen";
        validate = false;
    } 

    // validasi price 
    if(request.getParameter("food_price").isEmpty()){
        err = err + "errPrice=price must be filled";
        validate = false;
    } 

    if(price< 0){
        if(err != "") err = err + "&";
        err = err + "errPrice=price should be more than 0";
        validate = false;
    } 
    
    // validasi quantity
    if(request.getParameter("food_qty").isEmpty()){
        err = err + "errQty=quantity must be filled";
        validate = false;
    }

    if(quantity <= 0){
        if(err != "") err = err + "&";
        err = err + "errQty=quantity should be more than or equal 0";
        validate = false;
    }

    // validasi image
    if(image.isEmpty()){
        if(err != "") err = err + "&";
        err = err + "errImage=image must be filled";
        validate = false;
    }

    if(validate){
        String query = String.format("UPDATE MsFood SET food_name = ('%s'), food_description = ('%s'), food_category = ('%s'), food_price = ('%d'), food_quantity = ('%d'), food_image = ('%s') WHERE food_id = ('%s')", name, description, category, price, quantity, image, id);
        st.executeUpdate(query);

        response.sendRedirect("../food_list.jsp");
    }else{
        response.sendRedirect("../edit_food.jsp?" + err);
    }
    

%>