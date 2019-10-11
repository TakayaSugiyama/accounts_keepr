$('#star-rating').raty({
  path: '/assets/',
 click: function(score, e) {
  $("#review_rating").val(score)
}
});