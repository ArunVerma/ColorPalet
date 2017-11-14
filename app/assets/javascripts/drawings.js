$(document).ready(function() {
  $('.color-palete-li').on('click', function(){
    var clr_code = $(this).data('code');
    var clr_id = $(this).data('color-id');
    $('.selected-color').css('background-color', clr_code);
    $('.selected-color').attr('data-code', clr_code);
    $('.selected-color').attr('data-color-id', clr_id);
  });

  $('.no-fill').on('click', function(){
    $('.selected-color').css('background-color', '');
    $('.selected-color').attr('data-code', 'no-fill');
    $('.selected-color').attr('data-color-id', '');
  });

  $('html').on('click', '.grid-cell', function(e){
    e.preventDefault();
    var clr_code = $('.selected-color').attr('data-code');
    if(clr_code){
      var userId = $('#user_id').val();
      var cellId = $(this).attr('data-cell-id');
      var colorId = $('.selected-color').attr('data-color-id');
      $.ajax({
        type: 'POST',
        url: '/drawings',
        data: {drawing : {user_id: userId, grid_square_id: cellId, color_id: colorId}}
      })
    }else{
      alert("You have not selected any color. Please select one.")
    }
  });

  $('html').on('mouseover', '.grid-cell', function(e){
    e.preventDefault();
    var clrId = $(this).attr('data-clr-id');
    var cellId = $(this).attr('data-cell-id');
    if(clrId){
      $.ajax({
        type: 'GET',
        url: 'cell_info/'+cellId,
        dataType: 'json',
        success: function(data) {
          $('#cell-info').css('background-color', data.color_code);
          var info = "Latest update for the cell: "
          info = info + 'Colored on: '+data.color_date+'; '
          info = info + 'Colored by: '+data.user+'; '
          info = info + 'Color: '+data.color_name+'; '
          $('#cell-info h5').text(info);
        }
      })
    }
  });

  $('html').on('mouseout', '.grid-cell', function(e){
    e.preventDefault();
    var clr_id = $(this).attr('data-clr-id');
    if(clr_id){
      $('#cell-info h5').text('');
      $('#cell-info').css('background-color', '');
    }
  });

})
