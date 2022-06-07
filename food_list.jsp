<%@include file="connect.jsp" %>

<%
    int dataPerPage = 2;
    int totalData = 0;

    String countDataQuery = "SELECT COUNT(*) FROM MsFood";

    if(request.getParameter("search") != null){
        if(request.getParameter("searchBy").equals("name")){
            // search by name
            String value = request.getParameter("search");
            countDataQuery = String.format("SELECT COUNT(*) FROM MsFood WHERE food_name LIKE '%%%s%%'", value);
        }
        else if(request.getParameter("searchBy").equals("category")){
            // search by category
            String value = request.getParameter("search");
            countDataQuery = String.format("SELECT COUNT(*) FROM MsFood WHERE food_category LIKE '%%%s%%'", value);
        }
        else if(request.getParameter("searchBy").equals("description")){
            // search by description
            String value = request.getParameter("search");
            countDataQuery = String.format("SELECT COUNT(*) FROM MsFood WHERE food_description LIKE '%%%s%%'", value);
        }
    }

    ResultSet countDataRes = st.executeQuery(countDataQuery);
    if(countDataRes.next()){
        totalData = countDataRes.getInt(1);
    }

    // tentuin total halaman
    int totalPages = (totalData % dataPerPage == 0) ? totalData / dataPerPage : totalData / dataPerPage + 1;

    // tentuin sekarang kira ada di halaman berapa
    int currentPage = (request.getParameter("page") == null) ? 1 : Integer.parseInt(request.getParameter("page"));
    
    // tentuin startData
    int startData = (currentPage - 1) * dataPerPage;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food List</title>
    <link rel="stylesheet" href="css/food_list_style.css">
</head>
<body>
    <jsp:include page="header.jsp"/> 

    <section>
        <center>
            <p class="title">Foods</p>
        </center>

        <form class="search" action="food_list.jsp" type="get">
            <input type="text" name="search">
            <select name="searchBy">
                <option value="name">Name</option>
                <option value="category">Category</option>
                <option value="description">Description</option>
            </select>
            <button>Search</button>
        </form>
        
        <div class="wrapper">
            <table class="foods">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <%
                            if(session.getAttribute("userId") != null){
                                // kalo bukan guest
                        %>
                            <th>Action</th>
                        <%
                            }
                        %>
                    </tr>
                </thead>
                <%  
                    String query = String.format("SELECT * FROM MsFood LIMIT %d OFFSET %d", dataPerPage, startData);

                    if(request.getParameter("search") != null){
                        if(request.getParameter("searchBy").equals("name")){
                            // search by name
                            String value = request.getParameter("search");
                            query = String.format("SELECT * FROM MsFood WHERE food_name LIKE '%%%s%%' LIMIT %d OFFSET %d", value, dataPerPage, startData);
                        }
                        else if(request.getParameter("searchBy").equals("category")){
                            // search by category
                            String value = request.getParameter("search");
                            query = String.format("SELECT * FROM MsFood WHERE food_category LIKE '%%%s%%' LIMIT %d OFFSET %d", value, dataPerPage, startData);
                        }
                        else if(request.getParameter("searchBy").equals("description")){
                            // search by description
                            String value = request.getParameter("search");
                            query = String.format("SELECT * FROM MsFood WHERE food_description LIKE '%%%s%%' LIMIT %d OFFSET %d", value, dataPerPage, startData);
                        }
                    }  

                    ResultSet result = st.executeQuery(query);

                    while(result.next()){
                %>
                <tr>
                    <td><img class="food-img" src="<%= result.getString("food_image") %>" alt=""></td>
                    <td><a href="food_detail.jsp?id=<%= result.getString("food_id") %>"><%= result.getString("food_name") %></a></td>
                    <td><%= result.getString("food_category") %></td>
                    <td><%= result.getInt("food_price") %></td>
                    <%
                        if(session.getAttribute("userId") != null && session.getAttribute("role").equals("admin")){
                            // kalo rolenya admin

                        }
                        else if(session.getAttribute("userId") != null && session.getAttribute("role").equals("member")){
                            // kalo rolenya member
                    %>
                            <td>
                                <form action="controller/add_to_cart_controller.jsp" type="get">
                                    <input type="hidden" name="from" value="food_list">
                                    <input type="hidden" name="search" value="<%= request.getParameter("search") %>">
                                    <input type="hidden" name="searchBy" value="<%= request.getParameter("searchBy") %>">
                                    <input type="hidden" name="page" value="<%= currentPage %>">
                                    <input type="hidden" name="id" value="<%= result.getString("food_id") %>">
                                    <button>Add to Cart</button>
                                </form>
                                <p></p>
                            </td>
                    <%
                        }
                    %>
                </tr>
                <%
                    }
                %>
            </table>
        </div>

        <table class="pagination">
            <%
                String search = request.getParameter("search");
                String searchBy = request.getParameter("searchBy");
                String pagination = "";
                if(search != null){
                    pagination = "&search=" + search + "&searchBy=" + searchBy;
                }
            %>
            <tr>
                <td><a class="first" href="food_list.jsp?page=1<%= pagination %>">First</a></td>
                <td><a class="prev" href="food_list.jsp?page=<%= (currentPage == 1) ? 1 : currentPage-1%><%= pagination %>">Prev</a></td>
                <%
                    int from = (currentPage <= 2) ? 1 : currentPage - 2;
                    int until = (currentPage > totalPages - 2) ? totalPages : currentPage + 2;

                    for(int i = from; i<= until; i++) {
                        if(i == currentPage){
                %>
                            <td class="current-page"><a class="number current-number" href="food_list.jsp?page=<%= i %><%= pagination %>"> <%= i %> </a></td>
                <%
                        }
                        else{
                %>
                            <td><a class="number" href="food_list.jsp?page=<%= i %><%= pagination %>"> <%= i %> </a></td>
                <%
                        }
                    }
                %>
                <td><a class="next" href="food_list.jsp?page=<%= (currentPage == totalPages ? totalPages : currentPage+1) %><%= pagination %>">Next</a></td>
                <td><a class="prev" href="food_list.jsp?page=<%= totalPages %><%= pagination %>">Last</a></td>
            </tr>
        </table>

    </section>

    <jsp:include page="footer.jsp"/> 
</body>
</html>