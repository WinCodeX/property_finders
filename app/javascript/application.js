// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery_ujs
//= require_tree .




// function to show more details for a certain property
const details= document.getElementById("details");

details.addEventListener("click", () =>{
    let $this = $(this);
    const propDetails = document.getElementById("prop-details");
    
    console.log(propDetails.classList.toggle("open"));
    
    if(propDetails.hasClass("open")){
        // console.log($this.text("Show Less"));
        // console.log($this.innerText = "Show Less");
    }else{
        // console.log($this.text("Show More"));
    }
    
});



/* 
    Agent Profile
*/ 

// show telephone number
let show = document.getElementById("show-tele");
console.log(show);
show.addEventListener("click", function(){
    let $this = $(this);

    console.log($this.find("span").text($this.data("telephone")));
});



let emailBtnModal = document.getElementById("contact-modal");

// console.log(emailBtnModal);

emailBtnModal.addEventListener("click", function(){
    console.log("Modal has fire")
})

// $('#contact-modal').on('show.bs.modal', function (event) {
    //   var button = $(event.relatedTarget) // Button that triggered the modal
    //   // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
    //   // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
    //   let modal = $(this)
    //   modal.find('.modal-title').text('New message to ' + recipient)
    //   modal.find('.modal-body input').val(recipient)
    // })
    
    
    
    // send message
let sendMessage = document.getElementById("send-message");

console.log(sendMessage);












