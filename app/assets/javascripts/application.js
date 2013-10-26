// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery.ui.all
$(function() {

  $( "#dialog-form" ).dialog({
    autoOpen: true,
    height: 300,
    width: 350,
    modal: true,
    buttons: {
      "Submit": function() {
        var isRecruiter = $('#recruiter').prop('checked'),
            isCandidate = $('#candidate').prop('checked');
        
        if (isRecruiter || isCandidate) {
            document.location.href = '/questions';
        } else {
           window.alert('Need to choose either candidate or recruiter'); 
        }
      }
    },
    close: function() {
      allFields.val( "" ).removeClass( "ui-state-error" );
    }
  });

});
