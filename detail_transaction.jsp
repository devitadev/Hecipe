<%@include file="connect.jsp" %>

<%
    String transactionId = request.getParameter("id");
    String query = String.format("SELECT * FROM TransactionDetail JOIN Msfood ON TransactionDetail.food_id=Msfood.food_id WHERE transaction_id='%s'", transactionId);

    ResultSet result = st.executeQuery(query);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Chart</title>
    <link rel="stylesheet" href="css/detail_transaction_style.css">
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
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <%
                    Integer total = 0;
                    while(result.next()){
                        Integer subtotal = result.getInt("food_price") * result.getInt("TransactionDetail.food_quantity");
                        total = total + subtotal;
                        Integer stock = result.getInt("TransactionDetail.food_quantity");
                %>
                        <tr>
                            <td><img class="food-img" src="<%= result.getString("food_image") %>" alt=""></td>
                            <td><a class="food-name" href="food_detail.jsp?id=<%= result.getString("food_id") %>"><%= result.getString("food_name") %></a></td>
                            <td><%= stock %></td>
                            <td><p><%= result.getString("food_price") %></p></td>
                            <td><p><%= subtotal %></p></td>
                        </tr>
                <%
                    }
                %>
            </table>
            <p class="total"><span>Total : </span><%= total %></p>

        </div>
    </section>

    <jsp:include page="footer.jsp"/> 
</body>
</html>