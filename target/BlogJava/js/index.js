let c =  (el) => document.querySelector(el);
let cs = (el) => document.querySelectorAll(el);

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
       c('#cadastro').style.display = 'none';
   }

}
