@UserBookings = React.createClass
    getInitialState: ->
        bookings: []
    componentDidMount: ->
        state = @state
        $.ajax(
            method: 'GET'
            url: '/api/v1/bookings/3'
        ).done((data)->
            state.bookings = data
            console.log data
        )
    render: ->
        React.DOM.div
            className: 'user_bookings'
            for booking in @state.bookings
                React.DOM.div
                    className: 'row'
                    React.DOM.div
                        className: 'user_booking'
                        booking.hotel + ', from ' + booking.start_date + ' to ' + booking.end_date