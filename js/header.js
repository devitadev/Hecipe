function toogleNavbar() {
    let navbar = document.getElementById('navbar')

    console.log(navbar.style.display)
    if(navbar.style.display == '' || navbar.style.display == 'none'){
        navbar.style.display = 'flex'
    }
    else{
        navbar.style.display = 'none'
    }
}