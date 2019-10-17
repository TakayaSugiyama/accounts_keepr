$(function(){
  $("#review_images_attributes_0_image" ).on("change", function(e){
    let preview = $(".preview").eq(0);
    let image = e.target;
    let reader = new FileReader();
    preview.removeClass("none");
 
    reader.onload = function (e) {
        preview.attr('src', e.target.result);
    }
    
    reader.readAsDataURL(image.files[0]);
  })
})

$(function(){
  $("#review_images_attributes_1_image" ).on("change", function(e){
    let preview = $(".preview").eq(1);
    let image = e.target;
    let reader = new FileReader();
    preview.removeClass("none");
 
    reader.onload = function (e) {
        preview.attr('src', e.target.result);
    }
    
    reader.readAsDataURL(image.files[0]);
  })
})

$(function(){
  $("#review_images_attributes_2_image" ).on("change", function(e){
    let preview = $(".preview").eq(2);
    let image = e.target;
    let reader = new FileReader();
    preview.removeClass("none");
 
    reader.onload = function (e) {
        preview.attr('src', e.target.result);
    }
    
    reader.readAsDataURL(image.files[0]);
  })
})