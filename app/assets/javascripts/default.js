$(function(){
  if(gon.iamges !== undefined && gon.images.length > 0){
   for(i = 0;i < gon.images.length;i++){
    let preview = $(".preview").eq(i);
    preview.removeClass("none");
    preview.attr('src', gon.images[i]);
   }
  }
})