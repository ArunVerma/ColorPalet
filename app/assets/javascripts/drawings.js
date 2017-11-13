$(document).ready(function() {
  $('.color-palete-li').on('click', function(){
    var clr_code = $(this).data('code');
    $('.selected-color').css('background-color', clr_code);
    $('.selected-color').attr('data-code', clr_code);
  });

  $('.no-fill').on('click', function(){
    $('.selected-color').css('background-color', '');
    $('.selected-color').attr('data-code', '');
  });

  $('html').on('click', '.grid-cell', function(){
    var clr_code = $('.selected-color').attr('data-code');
    $(this).css('background-color', clr_code);

    $ajax()
  });
})
