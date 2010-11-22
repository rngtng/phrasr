// http://buildinternet.com/2009/03/sliding-boxes-and-captions-with-jquery/

$(document).ready(function(){
  //To switch directions up/down and left/right just place a "-" in front of the top/left attribute
  //Vertical Sliding
  $('.boxgrid.slidedown').hover(function(){
    $(".cover", this).stop().animate({top:'-260px'},{queue:false,duration:300});
  }, function() {
    $(".cover", this).stop().animate({top:'0px'},{queue:false,duration:300});
  });
  //Horizontal Sliding
  $('.boxgrid.slideright').hover(function(){
    $(".cover", this).stop().animate({left:'325px'},{queue:false,duration:300});
  }, function() {
    $(".cover", this).stop().animate({left:'0px'},{queue:false,duration:300});
  });
  //Diagnal Sliding
  $('.boxgrid.thecombo').hover(function(){
    $(".cover", this).stop().animate({top:'260px', left:'325px'},{queue:false,duration:300});
  }, function() {
    $(".cover", this).stop().animate({top:'0px', left:'0px'},{queue:false,duration:300});
  });
  //Partial Sliding (Only show some of background)
  $('.boxgrid.peek').hover(function(){
    $(".cover", this).stop().animate({top:'90px'},{queue:false,duration:160});
  }, function() {
    $(".cover", this).stop().animate({top:'0px'},{queue:false,duration:160});
  });

  //Full Caption Sliding (Hidden to Visible)
  $('.boxgrid.captionfull').hover(function(){
    $(".cover", this).stop().animate({top:'120px'},{queue:false,duration:200});
  }, function() {
    $(".cover", this).stop().animate({top:'330px'},{queue:false,duration:160});
  });

  //Caption Sliding (Partially Hidden to Visible)
  $('.boxgrid.caption').hover(function(){
    $(".cover", this).stop().animate({top:'160px'},{queue:false,duration:160});
  }, function() {
    $(".cover", this).stop().animate({top:'220px'},{queue:false,duration:160});
  });
});