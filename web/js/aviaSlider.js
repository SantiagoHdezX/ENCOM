$(document).ready(function(){

//activate the lightbox
//jQuery('a[href$=jpg], a[href$=png], a[href$=gif], a[href$=jpeg]').prettyPhoto({theme: "light_square"});

$('#galery').aviaSlider(
{blockSize: {height: 'full', width:50},
transition: 'drop',
display: 'topleft',
slides: '.featured',
slideControlls: 'items'
});					
																									
});









