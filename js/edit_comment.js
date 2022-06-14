function editComment(commentId){
    let form = document.getElementById("edit-comment-form-" + commentId);

    if(form.style.display == '' || form.style.display == 'none'){
        form.style.display = 'block';
    }
    else if(form.style.display == 'block'){
        form.style.display = 'none';
    }
}