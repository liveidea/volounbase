$('document').on('click', '.js-remove-field', function(e){
  $(this).prev('input[type=hidden]').val('1');
  console.log('remove row');
  $(this).parents('.event-row').hide();
  e.preventDefault();
});

$('document').on('click', '.js-add-field', function(e){
  console.log('add new row');
  e.preventDefault();
});