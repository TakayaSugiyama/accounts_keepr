$(function(){
  $("#star-edit-rating").raty({
    score: gon.edit_rating,
    path: '/assets/',
    number: 5,
    readOnly: false,
    click: function(score, e) {
      $("#review_rating").val(score)
      }
  }); 
  $("#star-edit-rating").raty('reload');
})