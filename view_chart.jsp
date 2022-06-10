<%@include file="connect.jsp" %>

<%
    String userId = session.getAttribute("userId").toString();
    String query = String.format("SELECT * FROM Cart WHERE user_id='%s'", userId);

    ResultSet result = st.executeQuery(query);
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
        <%
        
            while(result.next()){

            }
        %>
    </section>

    <jsp:include page="footer.jsp"/> 
</body>
</html>