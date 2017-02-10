@Hotels = React.createClass
    getInitialState: ->
        hotels: []#@props.data
        app: @props.app
    getDefaultProps: ->
        hotels: []
    handleSignOut: ->
        app = @state.app
        $.ajax(
            method: 'DELETE',
            url: '/users/sign_out.json',
            data:
                authenticity_token: Functions.getMetaContent("csrf-token")
            ).done(app.logout)
    render: ->
        React.DOM.div
            className: 'hotels'
            React.DOM.a
                href: 'javascript:void()'
                onClick: @handleSignOut
                'Sign Out'
            React.DOM.h2
                className: 'title'
                'Hotels'
            React.DOM.table
                className: 'table table-bordered'
                React.DOM.thead null,
                    React.DOM.tr null,
                        React.DOM.th null, 'Name'
                        React.DOM.th null, 'Address'
                        React.DOM.th null, 'Rating'
                        React.DOM.th null, 'Photo'
                        React.DOM.th null, ''
                React.DOM.tbody null,
                    for hotel in @state.hotels
                        console.log hotel.name
                        React.createElement Hotel, key: hotel.name, hotel: hotel

    componentDidMount: ->
        that = this
        if navigator.geolocation
            navigator.geolocation.getCurrentPosition (position) ->
              $.ajax(
                type: 'GET'
                url: '/places/location'
                data:
                  lat: position.coords.latitude
                  lng: position.coords.longitude
                contentType: 'application/json'
                dataType: 'json').done (data) ->
                    that.setState({'hotels': data.data})
