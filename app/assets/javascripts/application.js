// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require pickers
//= require turbolinks
//= require_tree .


function ready() {
  var url = window.location;
  // Will only work if string in href matches with location
  $('ul.nav a[href="'+ url +'"]').parent().addClass('active');

  // Will also work for relative and absolute hrefs
  $('ul.nav a').filter(function() {
      return this.href == url;
  }).parent().addClass('active');
}
  
$(document).ready(ready)
$(document).on('page:load', ready)