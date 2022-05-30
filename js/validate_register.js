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