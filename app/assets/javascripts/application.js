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
// require responsiveslides.min
//= require owl.carousel
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

/* responsiveslides jQuery plugin
$(function() {
    $(".poster .rslides").responsiveSlides({
		prevText: '<span class="glyphicon glyphicon-chevron-left"></span>',
		nextText: '<span class="glyphicon glyphicon-chevron-right"></span>',
		pager: true,
		nav: true,
		pause: true,
		speed: 500,
		namespace: "btns"
	});
});
*/

$(document).ready(function() {
	$("#owl-slider").owlCarousel({

		navigation: true, // Show next and prev buttons
		slideSpeed: 300,
		paginationSpeed: 400,
		autoPlay: true,
		stopOnHover: true,
		navigationText: ['<span class="glyphicon glyphicon-chevron-left"></span>', '<span class="glyphicon glyphicon-chevron-right"></span>'],
		singleItem: true

		// "singleItem:true" is a shortcut for:
		// items : 1, 
		// itemsDesktop : false,
		// itemsDesktopSmall : false,
		// itemsTablet: false,
		// itemsMobile : false
	});
});
