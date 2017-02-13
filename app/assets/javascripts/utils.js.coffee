@Functions = 
    getMetaContent: (name) ->
      metas = document.getElementsByTagName('meta')
      i = 0
      while i < metas.length
        if metas[i].getAttribute('name') == name
          return metas[i].getAttribute('content')
        i++
    isEmail: (email) ->
        regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/
        regex.test email

# Override window.alert with Bootstrap modal
window.alert = (message, title) ->
  if $('#bootstrap-alert-box-modal').length == 0
    $('body').append '<div id="bootstrap-alert-box-modal" class="modal fade">\
                        <div class="modal-dialog">\
                        <div class="modal-content"> \
                          <div class="modal-header" style="min-height:40px;">\
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>\
                          <h4 class="modal-title"></h4> \
                        </div>\
                        <div class="modal-body"><p></p></div> \
                        <div class="modal-footer">\
                        <a href="#" data-dismiss="modal" class="btn btn-default">Close</a>\
                        </div>\
                        </div></div></div>'
  $('#bootstrap-alert-box-modal .modal-header h4').text title or ''
  $('#bootstrap-alert-box-modal .modal-body p').text message or ''
  $('#bootstrap-alert-box-modal').modal 'show'
  return