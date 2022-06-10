function validateQty(stock){
    let quantity = document.forms['formSaveQuantity']['quantity'].value;
    let validate = true;

    // validasi quantity
    let err = document.getElementById('err1');
    if(quantity == null || quantity == ""){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    err = document.getElementById('err2');
    if(quantity > stock){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    return validate;
}