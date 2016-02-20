function initScripts(){

  var initDatePicker = function() {

    $(".datepicker").datetimepicker({
      format:'d.m.Y H:i',
      mask: true,
      step: 30,
    });

  }

  initDatePicker();

  $('body').on('click', '.js-remove-field', function(e){
    $(this).prev('input[type=hidden]').val('1');
    $(this).parents('.event-row').hide();
    e.preventDefault();
  });

  $('body').on('click', '.js-add-field', function(e){
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + $(this).data("association"), "g")
    $("#event_fields").append($(this).data("fields").replace(regexp, new_id))
    initDatePicker();
    e.preventDefault();
  });

}

$(document).ready(function(){
  initScripts()
})

$(document).off('page:load').on('page:load', function(){
  initScripts()
})
