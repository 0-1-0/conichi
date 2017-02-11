@App = React.createClass(
  fetchUser: ->
    return $.ajax(
      method: 'GET'
      url: '/auth/is_signed_in.json').done ((data) ->
      @setState 
        signedIn: data.signed_in
        user: data.user
      return
    ).bind(this)
  componentWillMount: ->
    @fetchUser()
  getInitialState: ->
    { signedIn: null, user: null }
  login: ->
    @state.signedIn = true
    @fetchUser()
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