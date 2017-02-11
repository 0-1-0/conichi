@SignUp = React.createClass
    getInitialState: ->
        email: ''
        password: ''
        password_confirmation: ''
        name: ''
        app: @props.app
    handleSignUpClick: (e) ->
        e.preventDefault()
        app = @state.app
        $.ajax(
            method: 'POST',
            url: '/users.json',
            data:
              user:
                email: @state.email,
                password: @state.password,
                password_confirmation: @state.password_confirmation,
                name: @state.name,
                provider: "email"
            authenticity_token: Functions.getMetaContent("csrf-token")        
        ).done(app.login)
    handleChange: (ev) ->
        nextState = _.cloneDeep(@state)
        nextState[ev.target.name] = ev.target.value
        @setState(nextState)
    render: ->
      React.DOM.form null,
          React.DOM.div
            className: 'form-group'
            React.DOM.h2 null,
              'Or register'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
                type: 'email'
                name: 'email'
                className: 'form-control'
                value: @state.email
                onChange: @handleChange
                placeholder: 'email'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
                type: 'text'
                className: 'form-control'
                name: 'name'
                value: @state.name
                onChange: @handleChange
                placeholder: 'username'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
                type: 'password'
                className: 'form-control'
                name: 'password'
                value: @state.password
                onChange: @handleChange
                placeholder: 'password'
          React.DOM.div
            className: 'form-group'
            React.DOM.input
                type: 'password'
                className: 'form-control'
                name: 'password_confirmation'
                value: @state.password_confirmation
                onChange: @handleChange
                placeholder: 'password confirmation'
          React.DOM.div
            className: 'form-group'
            React.DOM.button
                className: 'btn btn-default form-control'
                onClick: @handleSignUpClick
                'Sign Up'