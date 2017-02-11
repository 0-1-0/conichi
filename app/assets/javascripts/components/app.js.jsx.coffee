@App = React.createClass(
  fetchUser: ->
    return $.ajax(
      method: 'GET'
      url: '/auth/is_signed_in.json').done ((data) ->
      @setState 
        signedIn: data.signed_in
        user: data.user
    ).bind(this)
  componentWillMount: ->
    @fetchUser()
  getInitialState: ->
    { signedIn: null, user: null }
  getUserID: ->
    return @state.user.id
  login: (data) ->
    console.log data
    @state.signedIn = true
    @setState user: data
    @forceUpdate()
  logout: ->
    @state.signedIn = false
    @setState user: null
    @forceUpdate()
  render: ->
    console.log @state
    if @state.signedIn
      return `<Hotels app={this}/>`
    else
      return `<div><SignIn app={this}/><SignUp app={this}/></div>`
)