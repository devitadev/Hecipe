<%@include file="connect.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit food</title>
    <link rel="stylesheet" href="css/add_food_style.css">
</head>
<body>
    <jsp:include page="header.jsp"/>

    <section>
        <center>
            <p class="title">Edit Food</p>
        </center>
  
        <form class="add_form" action="controller/edit_food_controller.jsp" method="post">
            <table>
                <tr>
                    <td>
                        <label for="food_name">Name: </label>
                    </td>
                    <td>
                        <input type="hidden" name="id" value="<%= request.getParameter("food_id")%>" >
                        <input class="name" type="text" name="food_name" placeholder="Name" >
                        <p style="color: red; margin: 0;"><% if(request.getParameter("errName1") != null) out.println(request.getParameter("errName1")); %> </p> 
                        <p style="color: red; margin: 0;"><% if(request.getParameter("errName2") != null) out.println(request.getParameter("errName2")); %> </p> 
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="food_category">Category: </label>
                    </td>
                    <td>
                        <select name="food_category">
                            <option value="Meats">Meats</option>
                            <option value="Vegetarian">Vegetarian</option>
                            <option value="Snack">Snack</option>
                        </select>

                        <p style="color: red; margin: 0;"><% if(request.getParameter("errCategory") != null) out.println(request.getParameter("errCategory")); %> </p> 
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="food_description">Description: </label>
                    </td>
                    <td>
                        <textarea name="food_description" id="" cols="30" rows="10"></textarea>
                        <p style="color: red; margin: 0;"><% if(request.getParameter("errDesc1") != null) out.println(request.getParameter("errDesc1")); %> </p>
                        <p style="color: red; margin: 0;"><% if(request.getParameter("errDesc2") != null) out.println(request.getParameter("errDesc2")); %> </p>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="food_img">Image path: </label>
                    </td>
                    <td>
                        <input class="img" type="text" name="food_img" id="" placeholder="Image path" >
                        <p style="color: red; margin: 0;"><% if(request.getParameter("errImage1") != null) out.println(request.getParameter("errImage1")); %> </p>
                        <p style="color: red; margin: 0;"><% if(request.getParameter("errImage2") != null) out.println(request.getParameter("errImage2")); %> </p>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="food_price">Price: </label>
                    </td>
                    <td>
                        <input class="price" type="number" name="food_price" id="" placeholder="Price">
                        <p style="color: red; margin: 0;"><% if(request.getParameter("errPrice1") != null) out.println(request.getParameter("errPrice1")); %> </p> 
                        <p style="color: red; margin: 0;"><% if(request.getParameter("errPrice2") != null) out.println(request.getParameter("errPrice2")); %> </p> 
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="food_qty">Quantitiy: </label>
                    </td>
                    <td>
                        <input class="qty" type="number" name="food_qty" id="" placeholder="Quantity">
                        <p style="color: red; margin: 0;"><% if(request.getParameter("errQty1") != null) out.println(request.getParameter("errQty1")); %> </p>
                        <p style="color: red; margin: 0;"><% if(request.getParameter("errQty2") != null) out.println(request.getParameter("errQty2")); %> </p>
                    </td>
                </tr>

                <tr>
                    <td>
                        <button>Edit Food</button>
                    </td>
                </tr>
            </table>

        </form>

    </section>

    <jsp:include page="footer.jsp"/>
</body>
</html>