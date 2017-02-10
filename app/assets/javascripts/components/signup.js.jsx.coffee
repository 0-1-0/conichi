@SignUp = React.createClass(
    getInitialState: ->
        email: ''
        password: ''
        password_confirmation: ''
        app: @props.app
    handleSignInClick: ->
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
            React.DOM.input
                type: 'email'
                name: 'email'
                value: @state.email
                onChange: @handleChange
                placeholder: 'email'
            React.DOM.input
                type: 'password'
                name: 'password'
                value: @state.password
                onChange: @handleChange
                placeholder: 'password'
            React.DOM.input
                type: 'password'
                value: @state.password_confirmation
                onChange: @handleChange
                name: 'password_confirmation'
                placeholder: 'confirm password'
            React.DOM.input
                onClick: @handleSignInClick
                defaultValue: "sign up"

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