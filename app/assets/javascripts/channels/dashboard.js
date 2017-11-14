// app/assets/javascripts/channels/dashboard  .js

//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();
