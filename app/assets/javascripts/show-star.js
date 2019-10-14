$(document).on("turbolinks:load", function(){
    for(id in gon.rating){
      $("#star_show_" + id ).raty({
        score: gon.rating[id],
        path: '/assets/',
        number: 5,
        readOnly: true
      }); 
      //reload stars/stop duplication
      $("#star_show_" +  id ).raty('reload');
    }
});

  
