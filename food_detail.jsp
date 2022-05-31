<%@include file="connect.jsp" %>

<%
    Connect connect = Connect.getConnection();

    String query = "SELECT * FROM MsFood WHERE food_id LIKE '" + request.getParameter("id") + "'";

    ResultSet result = connect.executeQuery(query);
    result.next();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Detail</title>
    <link rel="stylesheet" href="css/food_detail_style.css">
</head>
<body>
    <jsp:include page="header.jsp"/> 

    <section>
        <center>
            <p class="title"><%= result.getString("food_name")%></p>
        </center>

        <div class="box">
            <img src="<%= result.getString("food_image") %>" alt="">
            <div>
                <p class="bold">Category</p>
                <p><%= result.getString("food_category") %></p>
                <p class="bold">Description</p>
                <p><%= result.getString("food_description") %></p>
                <p class="bold">Price</p>
                <p><%= result.getInt("food_price") %></p>
                <p class="bold">Quantity</p>
                <p><%= result.getInt("food_quantity") %></p>
            </div>
        </div>

        <center>
            <p class="title2">Comments</p>
        </center>

        <div class="comments">
            <%
                query = "SELECT * FROM Comment INNER JOIN MsUser ON Comment.email=MsUser.email WHERE food_id LIKE '" + request.getParameter("id") + "'";

                ResultSet comment = connect.executeQuery(query);
                while(comment.next()){
            %>
                <p class="bold"><%= comment.getString("user_name") %></p>
                <p><%= comment.getString("content") %></p>
            <%
                }
            %>
        </div>

    </section>

    <jsp:include page="footer.jsp"/> 
</body>
</html>