<%@include file="connect.jsp" %>

<%
    String userId = session.getAttribute("userId").toString();
    String query = String.format("SELECT * FROM Cart JOIN Msfood ON Cart.food_id=Msfood.food_id WHERE user_id='%s'", userId);
    
    ResultSet result = st.executeQuery(query);
    Integer total = 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Chart</title>
    <link rel="stylesheet" href="css/view_cart_style.css">
</head>
<body>
    <jsp:include page="header.jsp"/> 

    <section>
        <p class="title">Cart</p>

        <div class="wrapper">
            <table class="foods">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Quality</th>
                        <th>Price</th>
                        <th>Subtotal</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <%
                    while(result.next()){
                        Integer subtotal = result.getInt("food_price") * result.getInt("quantity");
                        total = total + subtotal;
                        Integer stock = result.getInt("food_quantity");
                %>
                        <tr>
                            <td><img class="food-img" src="<%= result.getString("food_image") %>" alt=""></td>
                            <td><a class="food-name" href="food_detail.jsp?id=<%= result.getString("food_id") %>"><%= result.getString("food_name") %></a></td>
                            <td>
                                <form action="controller/save_quantity_controller.jsp" method="post" name="formSaveQuantity" onsubmit="return(validateQty(<%= stock %>))">
                                    <input type="hidden" name="id" value="<%= result.getString("food_id") %>">
                                    <input class="input-qty" name="quantity" type="number" value="<%= result.getString("quantity") %>">
                                    <button class="btn-save">Save</button>
                                </form>
                                <p class="errMsg" id="err1">quantity must be filled</p>
                                <p class="errMsg" id="err2">remaining stock = <%= stock %></p>
                            </td>
                            <td><p><%= result.getString("food_price") %></p></td>
                            <td><p><%= subtotal %></p></td>
                            <td><a class="btn-delete" href="controller/delete_cart_controller.jsp?id=<%= result.getString("food_id") %></a>">Delete</a></td>
                        </tr>
                <%
                    }
                %>
            </table>
            <p class="total"><span>Total : </span><%= total %></p>
            <div class="section-ec-co">
                <a class="btn-emptycart" href="controller/empty_cart_controller.jsp">Empty Cart</a>
                <a class="btn-checkout" href="controller/check_out_controller.jsp">Check Out</a>
            </div>

        </div>
        
    </section>

    <script src="js/validate_save_quantity.js"></script>
    <jsp:include page="footer.jsp"/> 
</body>
</html>