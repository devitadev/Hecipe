<%@include file="connect.jsp" %>
<%@ page import = "java.text.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="css/home_style.css">
</head>
<body>
    <jsp:include page="header.jsp"/> 

    <section>
        <div class="box">
            <div class="bottom-border">
                <p class="title">Welcome to Hecipe !</p>
                <p>The place to satisty your belly needs.</p>
            </div>

            <div>
                <p>Trying to fill your belly? You came to the right place! With many foods to choose from, you can satisfy yourself in whatever way you want. And so without holding yourself back, why not see what we want to over by clicking this button?</p>
            </div>

            <button>See our's catalog</button>
        </div>
        
        <div class="display">
            <div class="purchase-food">
                <p class="title2">Purchase Foods</p>
                <p class="purchase-food-desc">Hecipe is the place where you can go to if you want to find a wide variety of cuisine around the world. And so, now is the time if you want to fill your belly with the greatest cuisine from around the world.</p>
                <a class="button" href="food_list.jsp">See what's we have to offer</a>
            </div>

            <div class="search-food">
                <p class="title2">Search Foods</p>
                <p>Want to search a specific food in mind? Try using our search engine to find the cuisine that can fill your belly with our greatest cuisine from all around the world.</p>
                <form class="search" action="food_list.jsp" type="get">
                    <input type="text" name="search">
                    <select name="searchBy">
                        <option value="name">Name</option>
                        <option value="category">Category</option>
                        <option value="description">Description</option>
                    </select>
                    <button>Search</button>
                </form>
            </div>

            <%  
                // buat cari tau current date
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String date = sdf.format(new java.util.Date());
                
                // buat cari tau number of user
                int numberOfUser = 0;
                String countDataQuery = String.format("SELECT COUNT(*) FROM MsUser WHERE user_role='%s' ", "member");
                ResultSet countDataRes = st.executeQuery(countDataQuery);
                if(countDataRes.next()){
                    numberOfUser = countDataRes.getInt(1);
                }

                // buat cari tau logged user tp gatau gimana
            %>

            <div class="site-status">
                <p class="title2">Site Status</p>
                <p class="status">Current date : <%=  date %></p>
                <p class="status">Number of user : <%= numberOfUser %></p>
                <p class="status">Logged user : </p>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp"/> 
</body>
</html>