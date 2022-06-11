<%@include file="connect.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add food</title>
    <link rel="stylesheet" href="css/add_food_style.css">
</head>
<body>
    <jsp:include page="header.jsp"/>

    <section>
        <center>
            <p class="title">Add Food</p>
        </center>

        <form class="add_form" action="controller/add_food_controller.jsp" method="post" name="formFoodInput" onsubmit="return(validateFood())">
            <table>
                <tr>
                    <td>
                        <label for="food_name">Name: </label>
                    </td>
                    <td>
                        <input class="name" type="text" name="food_name" placeholder="Name" >
                        <p class="errMsg" id="errName1">name must be filled</p>
                        <p class="errMsg" id="errName2">name should be at least 3 characters</p>
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

                        <p class="errMsg" id="errCategory1">category must be chosen</p>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="food_description">Description: </label>
                    </td>
                    <td>
                        <textarea name="food_description" id="" cols="30" rows="10"></textarea>
                        <p class="errMsg" id="errDesc1">description must be filled</p>
                        <p class="errMsg" id="errDesc2">description should be at least 5 words</p>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="food_img">Image path: </label>
                    </td>
                    <td>
                        <input class="img" type="text" name="food_img" id="" placeholder="Image path" >
                        <p class="errMsg" id="errImage1">image must be filled</p>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="food_price">Price: </label>
                    </td>
                    <td>
                        <input class="price" type="number" name="food_price" id="" placeholder="Price">
                        <p class="errMsg" id="errPrice1">price must be filled</p>
                        <p class="errMsg" id="errPrice2">price should be more than 0 </p>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label for="food_qty">Quantitiy: </label>
                    </td>
                    <td>
                        <input class="qty" type="number" name="food_qty" id="" placeholder="Quantity">
                        <p class="errMsg" id="errQty1">quantity must be filled</p>
                        <p class="errMsg" id="errQty2">quantity should be more than or equal 0 </p>
                    </td>
                </tr>

                <tr>
                    <td>
                        <button>Add Food</button>
                    </td>
                </tr>
            </table>

        </form>

    </section>

    <jsp:include page="footer.jsp"/>
    
    <script src="js/validate_food.js"></script>
    
</body>
</html>