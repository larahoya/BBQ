// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function main () {
  var isJoining = false

  $('[data-hook~=join-bbq]').on('click', function (event) {
    if (isJoining) {
      return
    }

    isJoining = true
    var $button = $(event.target)
    var bbqId = $button.closest('[data-bbq]').data('bbq')

    var request = $.post('/api/barbecues/' + bbqId + '/join')

    request.fail(function () {
      alert('Couldn’t join the barbecue!')
      isJoining = false
    })

    request.done(function () {
      $button.fadeOut()
      isJoining = false
    })
  })

  if ($('[data-hook~=controller-barbecues][data-hook~=action-show]').length) {
    var $bbqContainer = $('[data-hook=bbq-info]')
    var bbqId = $bbqContainer.data('bbq')
    var request = $.get('/api/barbecues/' + bbqId)

    request.fail(function () {
      var htmlParts = [
        '<div class="alert alert-danger" role="alert">',
        '  There was a problem retrieving the BBQ info. Try again later.',
        '</div>'
      ]
      $bbqContainer.append(htmlParts.join('\n'))
    })

    request.done(function (bbq) {
      var bbqMoment = moment(bbq.date)
      var htmlParts = [
        '<h2>' + bbq.title + '</h2>',
        '<dl>',
        '  <dt>Date:</dt>',
        '  <dd>' + bbqMoment.format('MMMM, D YYYY [at] h:mm a') + '</dd>',
        '  <dt>Venue:</dt>',
        '  <dd>' + bbq.venue + '</dd>',
        '</dl>'
      ]

      $bbqContainer.append(htmlParts.join('\n'))
    })

    var guests_request = $.get('/api/barbecues/' + bbqId + '/guests')

    guests_request.fail(function() {

    })

    guests_request.done(function (users) {
      if (users.length > 0) {
        var htmlParts = ['<dl><dt>Guests</dt>']
        users.forEach(function(user) {
          htmlParts.push('<dd>' + user.name + '</dd>')
        })
        htmlParts.push('</dl>')
        $bbqContainer.after(htmlParts.join('\n'))
      } else {
        $bbqContainer.after('No guests!')
      }
      
    })

    var items_request = $.get('/api/barbecues/' + bbqId + '/items')

    items_request.fail(function(error) {
      console.log(error);
    })

    items_request.done(function (items) {
      if (items.length > 0) {
        var htmlParts = ['<div><dl id="item-container"><dt>Items</dt>']
        items.forEach(function(item) {
          htmlParts.push('<dd>' + item.name + '</dd>')
        })
        htmlParts.push('</dl></div>')
        $bbqContainer.after(htmlParts.join('\n'))
      } else {
        $bbqContainer.after('No items!')
      }
      
    })
  }
})()
