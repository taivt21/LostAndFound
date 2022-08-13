$(document).ready(function () {
  var scroll_start = 0;
  var startchange = $("#startchange");
  var offset = startchange.offset();
  $(document).scroll(function () {
    scroll_start = $(this).scrollTop();
    if (scroll_start > offset.top) {
      $("#navbar").css("background-color", "black");
      $(".drop__user__menu").css("background-color", "black");
    } else {
      $("#navbar").css("background-color", "transparent");
      $(".drop__user__menu").css("background-color", "transparent");
    }
  });
});
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

function myAlertFunction() {
  Swal.fire("Tính năng này vẫn chưa phát hành");
}
