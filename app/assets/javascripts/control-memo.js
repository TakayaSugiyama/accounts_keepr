$(function() {
  // limits the number of categories
  $('#memos').on('cocoon:after-insert', function() {
    check_to_hide_or_show_memo_link();
  });

  $('#memos').on('cocoon:after-remove', function() {
    check_to_hide_or_show_memo_link();
  });


  function check_to_hide_or_show_memo_link() {
    if ($('#memos .nested-fields').length == 2) {
      $('#add-memo').hide();
    } else {
      $('#add-memo').show();
    }
  }
})