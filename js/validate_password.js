function validatePass(){
    let oldPassword = document.forms['formChangePass']['old'].value;
    let newPassword = document.forms['formChangePass']['new'].value;
    let confirmPassword = document.forms['formChangePass']['confirm'].value;

    let validate = true;

    // validasi old
    let err = document.getElementById('errOld1');
    if(oldPassword == null || oldPassword == ""){
        err.style.display = 'block';
        validate = false;
        
    } else err.style.display = 'none';

    // validasi new
    err = document.getElementById('errNew1');
    if(newPassword == null || newPassword == ""){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    err = document.getElementById('errNew2');
    if(newPassword.length < 6){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    err = document.getElementById('errNew3');
    if(!/[a-zA-Z]/.test(newPassword)){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    err = document.getElementById('errNew4');
    if(!/[0-9]/.test(newPassword)){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    // validasi confirm password
    err = document.getElementById('errConfirm1');
    if(newPassword != confirmPassword){
        err.style.display = 'block';
        validate = false;
    } else err.style.display = 'none';

    return validate;
}