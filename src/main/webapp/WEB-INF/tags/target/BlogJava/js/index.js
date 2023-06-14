let c =  (el) => document.querySelector(el);
let cs = (el) => document.querySelectorAll(el);

// const formLogin = c('#login');
// console.log("teste");
// (() =>{
//     console.log("kevin bonito")
// })();

function reverseForm(choose){
    if(choose == 'cadastro'){
        c('form').setAttribute('action', "register");
        c('.formTemplate').classList.add('flex-row-reverse');
        c('#login').style.display = 'none';
        c('#cadastro').style.display = 'flex';
    }else{
        c('form').setAttribute('action', "login");
        c('.formTemplate').classList.remove('flex-row-reverse');
        c('#login').style.display = 'flex';
        c('#cadastro').style.display = 'block';
    }

}

// formLogin.addEventListener('submit', (e) => {
//     e.preventDefault();
//     console.log("legal");
//     let user = c('#Usuario');
//     let password = c('#Senha');
//     console.log(user);
//     console.log(password);
//     let form = new FormData();
//     form.append('Usuario', user.value);
//     form.append('Senha', password.value);
//
//
//     let body = {
//         Usuario: user.value,
//         Senha: password.value,
//     }
//
//
//     fetch('http://localhost:8080/BlogJava/login', {
//         method: 'POST',
//         body: form
//     }).then(data => {
//         console.log(data);
//     }).catch(err => console.log(err));
//
// })
