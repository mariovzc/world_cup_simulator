$(document).on('turbolinks:load', function () {

  var reset = document.getElementById('reset')
  if (document.body.contains(reset)) {
    reset.addEventListener('click', function () {
      sweetAlert({
        title: '',
        text: 'Are you sure you want to restart the info',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!',
        closeOnConfirm: false
      },
      function () {
        axios({
          method: 'DELETE',
          url: '/api/v1/restart'
        })
        .then(function(response) {
          sweetAlert('', 'The data has been reset!.', 'success')
          document.location.reload()
        })
        .catch(function (error) {
          sweetAlert('', 'Please try again', 'danger')
        })
      })
    })
  }
  var start = document.getElementById('start')
  if (document.body.contains(reset)) {
    start.addEventListener('click', function () {
      start.parentElement.style.display = 'none'
      axios({
        method: 'POST',
        url: '/api/v1/create_matches'
      }).then(function (response) {
        sweetAlert({
          title: '',
          text: 'The world cup has ben created!!!',
          type: 'warning',
          showCancelButton: false,
          confirmButtonText: 'Great!',
          closeOnConfirm: false
        },
        function () {
          document.location.reload()
        })
      })
    })
  }
})
