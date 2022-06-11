function validateEditComment(){
    let comment = document.forms['formEditComment']['edited-comment'].value;
    let validate = true;

    let err = document.getElementById('err-edit1');
    if(comment == null || comment == ""){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    err = document.getElementById('err-edit2');
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

function editComment(){
    let form = document.getElementById('edit-comment-form');

    if(form.style.display == '' || form.style.display == 'none'){
        form.style.display = 'block';
    }
    else if(form.style.display == 'block'){
        form.style.display = 'none';
    }
}