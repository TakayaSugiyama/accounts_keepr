$(function(){
  let field = $("#user_password_check").on("change", function(){
    let input_type = $("#user_password").prop("type");
    if(input_type == "password"){
      $("#user_password").attr("type", "text");
    }else if(input_type == "text"){
      $("#user_password").attr("type", "password");
    }
  })
})

$(function(){
  let confirmation_field = $("#user_password_confirmation_check") 
  confirmation_field.on("change", function(){
     let input_type = $("#user_password_confirmation").prop("type");
    if(input_type == "password"){
      $("#user_password_confirmation").attr("type", "text")
    }else if(input_type == "text"){
      $("#user_password_confirmation").attr("type", "password")
    }
  })
})