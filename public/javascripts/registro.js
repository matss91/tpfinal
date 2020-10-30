window.onload = function () {
    let form = document.querySelector('#register-form');
    form.addEventListener('submit',function (event) {
        event.preventDefault()
        
        let password = document.querySelector('#password');
        let rePassword = document.querySelector('#re-password');
    
        if(password.value != rePassword.value){
            UIkit.notification({
                message: "<span uk-icon=\'icon: close\'></span> Las contraseñas no coinciden",
                status: 'danger',
                pos: 'top-center',
                timeout: 5000
            });
        }else{
            form.submit()
        }
    })
}