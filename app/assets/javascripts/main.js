function initScripts(){

  var initDatePicker = function() {

    $(".datepicker").datetimepicker({
      format:'d.m.Y H:i',
      mask: true,
      step: 30,
    });

    var d = new Date(),
        date_now = d.getUTCDate()+'/'+d.getUTCMonth()+1+'/'+d.getUTCFullYear();
    $(".datepicker-date").datetimepicker({
      format:'d.m.Y',
      mask: true,
      timepicker: false,
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

  // Confirm modal | TODO: Some BUGS, when delete to offen
  //User click confirm button 
  $('body').on('confirm', function (event) {
    var element = $(event.target);
    var message = element.data("confirm");

    $.magnificPopup.open({
        items: {
            src: '<div class="modal center"><div class="m2"><h3>'+message+'</h3></div><p><a href="#" class="js-popup-modal-dismiss btn btn-outline green">Cancel</a><a href="#" class="js-popup-modal-accept btn-primary btn btn-outline bg-green">OK</a></p></div>' 
        },
        type: 'inline',
    })

    // cancel
    $('body').on('click', '.js-popup-modal-dismiss', function (e) {
      e.preventDefault();
      $.magnificPopup.close();
    });  

    // accept
    $('body').on('click', '.js-popup-modal-accept', function (e) {
      // User hits OK
      element.data("confirm", null);
      element.trigger("click.rails");
      e.preventDefault();
      $.magnificPopup.close();
    });      
    return false;
  });

}

$(document).ready(function(){
  initScripts()
})

$(document).off('page:load').on('page:load', function(){
  initScripts()
})
