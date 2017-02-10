@SignIn = React.createClass(
    getInitialState: ->
        email: ''
        password: ''
        password_confirmation: ''
        app: @props.app
    handleSignInClick: ->
        app = @state.app
        $.ajax(
            method: 'POST',
            url: '/users/sign_in.json',
            data:
              user:
                email: @state.email,
                password: @state.password,
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
                type: 'password'
                className: 'form-control'
                name: 'password'
                value: @state.password
                onChange: @handleChange
                placeholder: 'password'
          React.DOM.div
            className: 'form-group'
            React.DOM.button
                className: 'btn btn-default form-control'
                onClick: @handleSignInClick
                'Sign In'

)
      #   """<form>
      #     <input type='email'
      #       name='email'
      #       placeholder='email'
      #       value={this.state.email}
      #       onChange={this._handleInputChange} />
      #     <input type='password'
      #       name='password'
      #       placeholder='password'
      #       value={this.state.password}
      #       onChange={this._handleInputChange} />
      #     <input type='submit' onClick={this._handleSignInClick} defaultValue='login' />
      # </form>""")