@App = React.createClass(
  componentWillMount: ->
    $.ajax(
      method: 'GET'
      url: '/auth/is_signed_in.json').done ((data) ->
      @setState signedIn: data.signed_in
      return
    ).bind(this)
    return
  getInitialState: ->
    { signedIn: null }
  login: ->
    @state.signedIn = true
    @forceUpdate()
  logout: ->
    @state.signedIn = false
    @forceUpdate()
  render: ->
    if @state.signedIn
      return `<Hotels app={this}/>`
    else
      return `<div><SignIn app={this}/><SignUp app={this}/></div>`
)