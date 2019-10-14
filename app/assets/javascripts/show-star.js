document.addEventListener("turbolinks:load", function(){
    for(id in gon.rating){
      $("#star_show_" +  id ).raty({
        score: gon.rating[id],
        path: '/assets/',
        readOnly: true
      }); 
    }
});

  
