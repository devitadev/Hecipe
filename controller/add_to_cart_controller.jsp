<%@include file="../connect.jsp" %>

<%
    String userId = session.getAttribute("userId").toString();
    String foodId = request.getParameter("id");
    String from = request.getParameter("from");

    String query = String.format("SELECT * FROM Cart WHERE food_id='%s' AND user_id='%s'", foodId, userId);
    out.println(query);

    ResultSet result = st.executeQuery(query);
    if(!result.next()){
        query = String.format("INSERT INTO Cart VALUES (%s, %s, 1)", userId, foodId);
        st.executeUpdate(query);
    }

    if(from.equals("food_list")){
        String temp = String.format("?page=%s", request.getParameter("page"));
        if(request.getParameter("search") != null){
            temp = temp + String.format("&search=%s&searchBy=%s", request.getParameter("search"), request.getParameter("searchBy"));
        }
        response.sendRedirect("../food_list.jsp" + temp);
    }
    else if(from.equals("food_detail")){
        response.sendRedirect("../food_detail.jsp?id=" + foodId);
    }
%>