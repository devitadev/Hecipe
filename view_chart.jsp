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
    <link rel="stylesheet" href="css/view_chart_style.css">
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
                %>
                        <tr>
                            <td><img class="food-img" src="<%= result.getString("food_image") %>" alt=""></td>
                            <td><a class="food-name" href="food_detail.jsp?id=<%= result.getString("food_id") %>"><%= result.getString("food_name") %></a></td>
                            <td>
                                <form action="">
                                    <input class="input-qty" type="number" value="<%= result.getString("quantity") %>">
                                    <button class="btn-save">Save</button>
                                </form>
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
                <a class="btn-emptychart" href="">Empty Chart</a>
                <a class="btn-checkout" href="">Check Out</a>
            </div>

        </div>
        
    </section>

    <jsp:include page="footer.jsp"/> 
</body>
</html>