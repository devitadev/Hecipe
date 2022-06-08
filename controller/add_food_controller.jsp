<%@include file="../connect.jsp" %>

<%
    String name = request.getParameter("food_name");
    String category = request.getParameter("food_category");
    String description = request.getParameter("food_description");
    String image = request.getParameter("food_img");
    int price = Integer.parseInt(request.getParameter("food_price"));
    int qty = Integer.parseInt(request.getParameter("food_qty"));

    //out.println(name + category + description + price + qty);
    
    String query = String.format("INSERT INTO MsFood (food_name, food_description, food_category, food_price, food_quantity, food_image) VALUES ('%s', '%s', '%s', '%s', '%s', '%s')", name, description, category, price, qty, image);
    st.executeUpdate(query);

    response.sendRedirect("../food_list.jsp");

%>