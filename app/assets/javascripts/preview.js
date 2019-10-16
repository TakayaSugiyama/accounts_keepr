$(function(){
  $(".image_field" ).on("change", function(e){
    let preview = $(".preview");
    let image = e.target;
    let reader = new FileReader();
    preview.removeClass("none");
 
    reader.onload = function (e) {
        $('.preview').attr('src', e.target.result);
    }
    
    reader.readAsDataURL(image.files[0]);
  })
})