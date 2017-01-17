
var $j = jQuery.noConflict();

$j(document).ready(function() {
	"use strict";

	$j('.map-menu>li>a').click(function(){
console.log($j(this));
if($j(this).hasClass('all')){
$j('.map-menu>li>a').removeClass('active');
$j(this).addClass('active');
$j('.country').fadeIn(500);
} else {
var active = $j(this).attr('class').split('-')[0];
$j('.country').fadeOut(500);
$j('.' + active).fadeIn(500);
$j('.map-menu>li>a').removeClass('active');
$j(this).addClass('active');
}
return false;
});});
