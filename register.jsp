<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="css/register_style.css">
</head>
<body>
    <jsp:include page="header.jsp"/> 

    <center>
        <div class="box">
            <p class="title">Register</p>
            <form action="home.jsp" name="formRegister" onsubmit="return(validateRegister())">
                <p>Name :</p>
                <input type="text" name="name" placeholder="Name">
                <p class="errMsg" id="errName1">name must be filled</p>
                <p class="errMsg" id="errName2">name should be at least 3 characters</p>
    
                <p>Email :</p>
                <input type="text" name="email" placeholder="Email">
                <p class="errMsg" id="errEmail1">email must be filled</p>
                <p class="errMsg" id="errEmail2">email should contain '@' and '.'</p>
                <p class="errMsg" id="errEmail3">email contain only one '@'</p>
                <p class="errMsg" id="errEmail4">'@' and '.' should not be side by side</p>
                <p class="errMsg" id="errEmail5">this email have been used before</p>
    
                <p>Password :</p>
                <input type="password" name="password" placeholder="Password">
                <p class="errMsg" id="errPass1">password must be filled</p>
                <p class="errMsg" id="errPass2">password should be at least 6 characters</p>
                <p class="errMsg" id="errPass3">password must contain at least one alphabet</p>
                <p class="errMsg" id="errPass4">password must contain at least one number</p>
                
                <p>Confirm Password :</p>
                <input type="password" name="confirm password" placeholder="Confirm Password">
                <p class="errMsg" id="errConfPass">confirm password must match password</p>

                <button>Register</button>
            </form>
        </div>
    </center>
    
    <jsp:include page="footer.jsp"/> 

    <script>
        function validateRegister(){
            let name = document.forms['formRegister']['name'].value;
            let email = document.forms['formRegister']['email'].value;
            let password = document.forms['formRegister']['password'].value;
            let confirmPassword = document.forms['formRegister']['confirm password'].value;

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

            err = document.getElementById('errPass2');
            if(password.length < 6){
                err.style.display = 'block';
                validate = false;
            } else err.style.display = 'none';

            err = document.getElementById('errPass3');
            if(!/[a-zA-Z]/.test(password)){
                err.style.display = 'block';
                validate = false;
            } else err.style.display = 'none';

            err = document.getElementById('errPass4');
            if(!/[0-9]/.test(password)){
                err.style.display = 'block';
                validate = false;
            } else err.style.display = 'none';

            // validasi confirm password
            err = document.getElementById('errConfPass');
            if(password != confirmPassword){
                err.style.display = 'block';
                validate = false;
            } else err.style.display = 'none';

            return validate;
        }
    </script>
</body>
</html>