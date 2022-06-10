<%@include file="../connect.jsp" %>

<%
    String userId = session.getAttribute("userId").toString();

    String countDataQuery = "SELECT COUNT(*) FROM Cart WHERE user_id='%s'";
    ResultSet countDataRes = st.executeQuery(countDataQuery);

    if(countDataRes.next()){
        // insert tr transaction
        String query = String.format("INSERT INTO TrTransaction (user_id, transaction_date, transaction_processed) VALUES ('%s', CURDATE(), 'false')", userId);
        st.executeUpdate(query);

        // cari tau transation id
        String countTransactionQuery = "SELECT COUNT(*) FROM TrTransaction";
        ResultSet countTransactionRes = st.executeQuery(countTransactionQuery);
        Integer transactionId = 0;
        if(countTransactionRes.next()){
            transactionId = countTransactionRes.getInt(1);
        }

        // cari tau yang ada di cart apa aja
        query = String.format("SELECT * FROM Cart WHERE user_id='%s'", userId);
        ResultSet result = st.executeQuery(query);

        String insertDetailQuery = "INSERT INTO TransactionDetail VALUES ";
        boolean first = true;
        // insert transaction detail
        while(result.next()){
            String foodId = result.getString("food_id");
            String quantity = result.getString("quantity");

            if(first) first = false;
            else insertDetailQuery = insertDetailQuery + ", ";

            insertDetailQuery = insertDetailQuery + String.format("('%s', '%s', '%s')", transactionId, foodId, quantity); 
        }
        st.executeUpdate(insertDetailQuery);

        // drop semua dari Cart
        String deleteQuery = String.format("DELETE FROM Cart WHERE user_id=('%s')", userId);
        st.executeUpdate(deleteQuery);
    }

    response.sendRedirect("../view_cart.jsp");
%>