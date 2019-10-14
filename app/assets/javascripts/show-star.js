$(function(){
  document.addEventListener("turbolinks:load", function(){
    $('.star_show').raty({
      score: gon.rating,
      path: '/assets/',
      readOnly: true
    });
  })
});