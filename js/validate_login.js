function validateLogin(){
    let email = document.forms['formLogin']['email'].value;
    let password = document.forms['formLogin']['password'].value;

    let validate = true;

    // validasi email
    err = document.getElementById('errEmail1');
    if(email == null || email == ""){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    err = document.getElementById('errEmail2');
    if(!email.includes("@") || !email.includes(".")){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    err = document.getElementById('errEmail3');
    let position = email.search("@");
    if(email.includes("@", (position+1))){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    err = document.getElementById('errEmail4');
    if(email.charAt(position+1) == '.' || email.charAt(position-1) == '.'){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';
    
    // validasi password
    err = document.getElementById('errPass1');
    if(password == null || password == ""){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    return validate;
}