// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('#btn-new-item').on('click', function(event) {
  event.preventDefault();
  var bbqId = $('#btn-new-item').data('bbq');
  var name = $('#new-item').val();
  $.ajax({
    url: '/api/barbecues/'+ bbqId + '/items',
    type: 'POST',
    data: {"name" : name},
    datatype: 'json',
    success: function(item) {
      $('#item-container').append('<dd>' + item['name'] + '  (' + item['user'] + ')</dd>')
    }
  })
})