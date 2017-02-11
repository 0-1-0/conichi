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