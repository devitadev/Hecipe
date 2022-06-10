function validateFood(){
    let name = document.forms['formFoodInput']['food_name'].value;
    let description = document.forms['formFoodInput']['food_description'].value;
    let category = document.forms['formFoodInput']['food_category'].value;
    let price = document.forms['formFoodInput']['food_price'].value;
    let quantity = document.forms['formFoodInput']['food_qty'].value;
    let image = document.forms['formFoodInput']['food_img'].value;

    let validate = true;

    // validasi name
    let err = document.getElementById('errName1');
    if(name == null || name == ""){
        err.style.display = 'block';
        validate = false;
        
    } else err.style.display = 'none';

    err = document.getElementById('errName2');
    if(name.length < 3){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';
    
    // validasi description
    err = document.getElementById('errDesc1');
    if(description == null || description == ""){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    //blm
    err = document.getElementById('errDesc2');
    let wordCount = description.split(" ").length;
    if(wordCount < 5){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';
    
    // validasi category
    err = document.getElementById('errCategory1');
    if(category == null || category == ""){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    // validasi price
    err = document.getElementById('errPrice1');
    if(price == null || price == ""){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    err = document.getElementById('errPrice2');
    if(price < 0){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';
    
    // validasi quantity
    err = document.getElementById('errQty1');
    if(quantity == null || quantity == ""){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    err = document.getElementById('errQty2');
    if(quantity <= 0){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    // validasi image
    err = document.getElementById('errImage1');
    if(image == null || image == ""){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    return validate;
}