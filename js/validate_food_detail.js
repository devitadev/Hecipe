function validatePostComment(){
    let comment = document.forms['formPostComment']['comment'].value;
    let validate = true;

    let err = document.getElementById('err1');
    if(comment == null || comment == ""){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    err = document.getElementById('err2');
    if(comment.value.split(' ').length < 5){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    return validate;
}