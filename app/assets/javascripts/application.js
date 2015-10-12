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
//= require jquery.touchSwipe
//= require jquery_ujs
//= require private_pub
//= require foundation/foundation
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function(){
	 $("#potential_match_avatar").swipe( {
    swipe:function(event, direction, distance, duration, fingerCount, fingerData) {
      if (direction == "left"){
      	// alert("I dont like you");
      	$.ajax({
      		url: "/matches/create",
      		method: "POST",
      		data: ""
      	}).done(function(data){
      		alert(data)
      	}).fail(funcction(data){
      		alert("error")
      	})
      } else if (direction == "right"){
      	// alert("I'll give you a shot")
      }
    },threshold:75
  });
})

