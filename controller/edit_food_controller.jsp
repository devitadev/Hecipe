<%@include file="../connect.jsp" %>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("food_name");
    String category = request.getParameter("food_category");
    String description = request.getParameter("food_description");
    String image = request.getParameter("food_img");
    int price = Integer.parseInt(request.getParameter("food_price"));
    int qty = Integer.parseInt(request.getParameter("food_qty"));

    //out.println(name + category + description + price + qty + " " + id);

    String query = String.format("UPDATE MsFood SET food_name = ('%s'), food_description = ('%s'), food_category = ('%s'), food_price = ('%d'), food_quantity = ('%d'), food_image = ('%s') WHERE food_id = ('%s')", name, description, category, price, qty, image, id);
    st.executeUpdate(query);

    response.sendRedirect("../food_list.jsp");

%>