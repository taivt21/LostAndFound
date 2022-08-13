$("#loginButton").click(function () {
    $("#loginModal").modal("show");
});

$("#reserveButton").click(function () {
    $("#reserveModal").modal("show");
});
//
function toggleResetPswd(e) {
    e.preventDefault();
    $("#logreg-forms .form-signin").toggle();
    $("#logreg-forms .form-reset").toggle();
}

function toggleSignUp(e) {
    e.preventDefault();
    $("#logreg-forms .form-signin").toggle();
    $("#logreg-forms .form-signup").toggle();
}

$(() => {
    // Login Register Form
    $("#logreg-forms #forgot_pswd").click(toggleResetPswd);
    $("#logreg-forms #cancel_reset").click(toggleResetPswd);
    $("#logreg-forms #btn-signup").click(toggleSignUp);
    $("#logreg-forms #cancel_signup").click(toggleSignUp);
});

var password = document.getElementById("password"),
        confirm_password = document.getElementById("repeatpw");

function validatePassword() {
    if (password.value != repeatpw.value) {
        repeatpw.setCustomValidity("Passwords Don't Match");
    } else {
        repeatpw.setCustomValidity("");
    }
}

password.onchange = validatePassword;
repeatpw.onkeyup = validatePassword;

//Get the button
let mybutton = document.getElementById("btn-back-to-top");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {
    scrollFunction();
};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}
// When the user clicks on the button, scroll to the top of the document
mybutton.addEventListener("click", backToTop);

function backToTop() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}



function toggleNotifi() {
    var box = document.getElementById('box');
    var down = false;

    if (down) {
        box.style.height = '0px';
        box.style.opacity = 0;
        down = false;
    } else {
        box.style.height = '510px';
        box.style.opacity = 1;
        down = true;
    }
}

function liveSearch() {
    // Locate the card elements
    let cards = document.querySelectorAll('.cards')
    // Locate the search input
    let search_query = document.getElementById("searchbox").value;
    // Loop through the cards
    for (var i = 0; i < cards.length; i++) {
        // If the text is within the card...
        if (cards[i].innerText.toLowerCase()
                // ...and the text matches the search query...
                .includes(search_query.toLowerCase())) {
            // ...remove the `.is-hidden` class.
            cards[i].classList.remove("is-hidden");
        } else {
            // Otherwise, add the class.
            cards[i].classList.add("is-hidden");
        }
    }
}

function myAlertFunction() {
    Swal.fire("Tính năng này vẫn chưa phát hành");
}
const dateInput = document.getElementById('date');
            dateInput.value = formatDate();
            function padTo2Digits(num) {
                return num.toString().padStart(2, '0');
            }

            function formatDate(date = new Date()) {
                return [
                    date.getFullYear(),
                    padTo2Digits(date.getMonth() + 1),
                    padTo2Digits(date.getDate()),
                ].join('-');
            }