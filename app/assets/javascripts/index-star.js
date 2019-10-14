$(function(){
  for(key in gon.ratings){
    $("#star_index_" +  key ).raty({
      score: gon.ratings[key],
      path: '/assets/',
      readOnly: true
    }); 
  }
});