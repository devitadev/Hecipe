<%@include file="../connect.jsp" %>

<%
    String name = request.getParameter("food_name");
    String category = request.getParameter("food_category");
    String description = request.getParameter("food_description");
    String image = request.getParameter("food_img");
    String price = request.getParameter("food_price");
    String quantity = request.getParameter("food_qty");

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
    if(price.isEmpty()){
        if(err != "") err = err + "&";
        err = err + "errPrice=price must be filled";
        validate = false;
    } 

    if(Integer.parseInt(price) < 0){
        if(err != "") err = err + "&";
        err = err + "errPrice=price should be more than 0";
        validate = false;
    } 
    
    // validasi quantity
    if(quantity.isEmpty()){
        if(err != "") err = err + "&";
        err = err + "errQty=quantity must be filled";
        validate = false;
    }

    if(Integer.parseInt(quantity) <= 0){
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

   
    //kalo validasi udh sesuai semua
    if(validate){
        String query = String.format("INSERT INTO MsFood (food_name, food_description, food_category, food_price, food_quantity, food_image) VALUES ('%s', '%s', '%s', '%s', '%s', '%s')", name, description, category, price, quantity, image);
        st.executeUpdate(query);

        response.sendRedirect("../food_list.jsp");
    }else{
        response.sendRedirect("../add_food.jsp?" + err);
    }
    
    
%>