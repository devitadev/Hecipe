function validatePostComment(){
    let comment = document.forms['formPostComment']['comment'].value;
    let validate = true;

    let err = document.getElementById('err1');
    if(comment == null || comment == ""){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    err = document.getElementById('err2');
    // ilangin space didepan dan belakang
    comment = comment.replace(/(^\s*)|(\s*$)/gi,"");
    // pastiin gk ad space double
    comment = comment.replace(/[ ]{2,}/gi," ");
    comment = comment.replace(/\n /,"\n");
    let numberOfWords = comment.split(' ').length;
    if(numberOfWords < 5){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    return validate;
}