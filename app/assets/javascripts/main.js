function initScripts(){

  // ProgerssBar
  Turbolinks.enableProgressBar();

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
      timepicker: false
      // TODO: add date now
    });    

  }

  initDatePicker();
  // TODO: Have some bug can remove last event!!!
  function isEventLast(){
    if($('#event_fields .event-row').length === 1) {
      $('#event_fields').find('.js-remove-field').hide();
    }
    else {
      $('#event_fields').find('.js-remove-field').show();
    }
  }
  isEventLast()
  
  $('body').on('click', '.js-remove-field', function(e){
    
    $(this).prev('input[type=hidden]').val('1');
    $(this).parents('.event-row').remove();
    isEventLast();
    e.preventDefault();
  });

  $('body').on('click', '.js-add-field', function(e){
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + $(this).data("association"), "g")
    $("#event_fields").append($(this).data("fields").replace(regexp, new_id))
    initDatePicker();
    isEventLast();
    e.preventDefault();
  });

  // Confirm modal
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

    // User click cancel
    $('body').on('click', '.js-popup-modal-dismiss', function (e) {
      e.preventDefault();
      $.magnificPopup.close();
    });  

    // User click ok
    $('body').on('click', '.js-popup-modal-accept', function (e) {
      element.data("confirm", null);
      element.trigger("click.rails");
      e.preventDefault();

      // Dont need close popup page reload
      // $.magnificPopup.close();
    });      
    return false;
  });

  // Magnific image zoom
  $('.js-image-zoom').magnificPopup({
    type: 'image',
    closeOnContentClick: true,
    closeBtnInside: false,
    mainClass: 'mfp-no-margins mfp-with-zoom',
    image: {
      verticalFit: true
    },
    zoom: {
      enabled: true,
      duration: 300
    }
  });

  // Magnific gallery 
  var gallery = $('.js-gallery');
  if (gallery.length) {
    gallery.each(function() {
        $(this).magnificPopup({
            delegate: 'a',
            type: 'image',
            gallery: {
              enabled: true
            }
        });
    });
  }

  // Tabs 
  $('body').on('click', '.js-tab-link', function (e) {
    $('.js-tab-link.active').removeClass('active');
    var active = $(this).data("link");
    $(this).addClass('active')
    $('.js-tab').hide();
    console.log(active);
    $(active).show();
    e.preventDefault();
  });  


}

$(document).ready(function(){
  initScripts()
})

$(document).off('page:load').on('page:load', function(){
  initScripts()
})
