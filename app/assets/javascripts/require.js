$(function(){
  $("#require-login").on("click",function(){
    let  $required =  $("#required");
    if($required.hasClass("none")){
      $required.removeClass("none");
    }else{
      $required.addClass("none");
    }
  });
});