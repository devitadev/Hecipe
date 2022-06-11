<%@include file="connect.jsp" %>

<%
    String role = session.getAttribute("role").toString();
    String userId = session.getAttribute("userId").toString();

    String query = "";

    if(role.equals("admin")){
        query = "SELECT * FROM TrTransaction";
    }
    else if(role.equals("member")){
        query = String.format("SELECT * FROM TrTransaction WHERE user_id='%s'", userId);
    }
    ResultSet result = st.executeQuery(query);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Transaction</title>
    <link rel="stylesheet" href="css/view_transaction_style.css">
</head>
<body>
    <jsp:include page="header.jsp"/> 

    <section>
        <p class="title">Transaction</p>

        <div class="wrapper">
            <table class="transaction-details">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Processed</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <%
                    while(result.next()){
                        String date = result.getString("transaction_date");
                        String processed = result.getString("transaction_processed");
                %>
                    <tr>
                        <td><p><%= date %></p></td>
                        <td><p><%= processed %></p></td>
                        <td><a class="see-detail" href="detail_transaction.jsp?id=<%= result.getString("transaction_id")%>">See detail</a></td>
                    </tr>
                <%
                    }
                %>
            </table>
        </div>
        
    </section>

    <jsp:include page="footer.jsp"/> 
</body>
</html>