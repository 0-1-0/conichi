@Hotels = React.createClass
    getInitialState: ->
        hotels: []
        app: @props.app
        start: ''
        finish: ''
    getDefaultProps: ->
        hotels: []
    handleSignOut: (e)->
        e.preventDefault()
        app = @state.app
        $.ajax
            method: 'DELETE'
            url: '/users/sign_out.json'
            data:
                authenticity_token: Functions.getMetaContent("csrf-token")
        .done app.logout()
    showCurrentBookings: (e)->
        e.preventDefault()
        app = @state.app
        $.ajax
            method: 'GET'
            url: '/api/v1/bookings/' + app.state.user.id
        .done (bookings)->
            res = ''
            for booking in bookings
                res += booking.hotel + ', from ' + booking.start_date + ' to ' + booking.end_date + '\n'
            alert res
    render: ->
        React.DOM.div
            className: 'hotels row'
            React.DOM.div
                className: 'row'
                React.DOM.a
                    className: 'pull-right'
                    href: 'javascript:void()'
                    onClick: @handleSignOut
                    'Sign Out'
                React.DOM.h2
                    className: 'title'
                    'Book hotels nearby'
            React.DOM.div
                className: 'row'
                React.DOM.a
                    className: 'currentBookings'
                    href: 'javascript:void()'
                    onClick: @showCurrentBookings
                    'Show my current bookings'
            React.DOM.div
                className: 'row'
                React.DOM.label
                    'Select booking dates'
            React.DOM.div
                className: 'row'
                React.DOM.input
                    type: 'text'
                    className: 'daterange'
                React.DOM.div
                    className: 'row top-space'
                    React.DOM.table
                        className: 'table'
                        React.DOM.thead null,
                            React.DOM.tr null,
                                React.DOM.th null, 'Name'
                                React.DOM.th null, 'Address'
                                React.DOM.th null, 'Rating'
                                React.DOM.th null, 'Photo'
                                React.DOM.th null, ''
                        React.DOM.tbody null,
                            for hotel, i in @state.hotels
                                React.createElement Hotel, key: i, hotel: hotel, parent_state: @state

    componentDidMount: ->
        that = this
        $('input[class="daterange"]').daterangepicker(
            {},
            (start, finish, label) ->
                that.state.start = start.format('YYYY-MM-DD')
                that.state.finish = finish.format('YYYY-MM-DD')
        )
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
        else
            alert 'Location data is unavailable'
