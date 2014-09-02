$ ->
  $('button').click ->
    console.log 'sending images to the server...'
    $.ajax(
      url: '/image'
      type: 'GET'
      cache: false
      data: {
        image1: $('#image1').attr('src')
        image2: $('#image2').attr('src')
      }
    ).done (data) ->
      $('#output').html 'response from server:' + data
      console.log 'response from server:', data
