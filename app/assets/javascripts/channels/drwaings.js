App.drwaings = App.cable.subscriptions.create('DrawingsChannel', {
  received: function(data) {
    $('#cell-'+data.cell_id).css('background-color', data.color_code);
  }
});
