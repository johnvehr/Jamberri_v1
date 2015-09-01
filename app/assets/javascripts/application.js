// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require materialize-sprockets
//= require_tree .


$(document).ready(function(){
  var x = document.getElementById("demo");
 function runThisTown(){
   $.get("http://ipinfo.io", function(response) {
     console.log(response.city, response.country);
     x.innerHTML = response.city + ", <small>"+response.loc+"</small>";
   }, "jsonp");
 }
 runThisTown();
  $(".button-collapse").sideNav();
  $('.parallax').parallax();
  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });
})
