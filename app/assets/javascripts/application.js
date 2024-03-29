// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery.masonry.min.js
//= require jquery-ui-slider-pips-min.js
//= require jquery.ui.datepicker
//= require jquery.geocomplete.min.js
//= require_tree .
$(function () {
    $("[rel='tooltip']").tooltip();
		$(".alert").fadeOut(6000);
		$(".front").find("path").attr("fill", "#4e526a");
		$('input.ui-date-picker').datepicker({
			showAnim: "slideDown",
			minDate: 0,
			showOtherMonths: true,
			selectOtherMonths: true,
			dateFormat: "DD, d MM, yy"
		});
		
		// Gecode
		$("#referral_location").geocomplete()
      .bind("geocode:result", function(event, result){
        $.log("Result: " + result.formatted_address);
      })
    $("#find").click(function(){
      $("#referral_location").trigger("geocode");
    });
		$("#user_location").geocomplete()
      .bind("geocode:result", function(event, result){
        $.log("Result: " + result.formatted_address);
      })
    $("#find").click(function(){
      $("#user_location").trigger("geocode");
    });

});