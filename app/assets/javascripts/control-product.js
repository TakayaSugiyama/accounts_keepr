$(function(){
    $('#products').on('cocoon:after-insert', function() {
      check_to_hide_or_show_product_link()
    });

    $('#products').on('cocoon:after-remove', function() {
      check_to_hide_or_show_product_link()
    });



    function check_to_hide_or_show_product_link() {
      if ($('#products .nested-fields').length == 10) {
        $('#add-product').hide();
      } else {
        $('#add-product').show();
      }
    }
})