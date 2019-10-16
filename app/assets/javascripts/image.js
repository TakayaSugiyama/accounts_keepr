$(function() {
   $("#images").on('cocoon:after-insert',function(){
      evaluate_images_field()
   })
   
   $("#images").on('cocoon:after-remove',function(){
     evaluate_images_field()
   })

   
   function evaluate_images_field(){
      let count = $("#images .nested-fields").length;
      if(count == 3){
        $("#add-image").fadeOut(); 
      }else{
        $("#add-image").show();
      }
   }
  
  });