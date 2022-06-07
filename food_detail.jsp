<%@include file="connect.jsp" %>

<%
    String query = String.format("SELECT * FROM MsFood WHERE food_id LIKE '%s'", request.getParameter("id"));

    ResultSet result = st.executeQuery(query);
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
            <div class="detail">
                <p class="bold">Category</p>
                <p><%= result.getString("food_category") %></p>
                <p class="bold">Description</p>
                <p><%= result.getString("food_description") %></p>
                <p class="bold">Price</p>
                <p><%= result.getInt("food_price") %></p>
                <p class="bold">Quantity</p>
                <p><%= result.getInt("food_quantity") %></p>
                <%
                    if(session.getAttribute("userId") != null && session.getAttribute("role").equals("member")){
                        // kalo member
                %>
                        <form action="controller/add_to_cart_controller.jsp" type="get">
                            <input type="hidden" name="from" value="food_detail">
                            <input type="hidden" name="id" value="<%= result.getString("food_id") %>">
                            <button>Add to Cart</button>
                        </form>
                <%
                    }
                %>
                
            </div>
        </div>

        <center>
            <p class="title2">Comments</p>
        </center>

        <div class="comments">
            <%
                query = String.format("SELECT * FROM Comment INNER JOIN MsUser ON Comment.user_id=MsUser.user_id WHERE food_id LIKE '%s'", request.getParameter("id"));

                ResultSet comment = st.executeQuery(query);
                while(comment.next()){
            %>
                    <div class="comment">
                        <div>
                            <p class="bold"><%= comment.getString("user_name") %></p>
                            <p><%= comment.getString("content") %></p>
                        </div>
                        <%
                            if(session.getAttribute("userId") != null && comment.getString("user_id").equals(session.getAttribute("userId"))){
                        %>
                                <div class="btn-edit-delete">
                                    <a class="btn-edit" href="">Edit</a>
                                    <a class="btn-delete" href="">Delete</a>
                                </div>  
                        <%
                            }
                        %>
                    </div>
            <%
                }
            %>
        </div>

        <%
            if(session.getAttribute("userId") != null && session.getAttribute("role").equals("member")){
        %>
                <form class="comment-form" action="controller/add_to_cart_controller.jsp" type="get">
                    <textarea name="comment" id="" rows="3" placeholder="Write your comment.."></textarea>
                    <button>Post Comment</button>
                </form>
        <%
            }
        %>

    </section>

    <jsp:include page="footer.jsp"/> 
</body>
</html>