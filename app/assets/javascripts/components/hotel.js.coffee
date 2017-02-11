@Hotel = React.createClass
    getInitialState: ->
        parent_state: null
    render: ->
        hname = @props.hotel.name
        hadress = @props.hotel.address
        state = @props.parent_state
        @state.parent_state = state
        React.DOM.tr null,
            React.DOM.td null, @props.hotel.name
            React.DOM.td null, @props.hotel.address
            React.DOM.td null, @props.hotel.rating
            React.DOM.td null,
                for photo_url, i in @props.hotel.photos
                    React.DOM.img src: '/img/' + photo_url, key: i
            React.DOM.td null,
                React.DOM.button
                    className: 'btn btn-default' 
                    onClick: ->
                        if !state.start or !state.finish
                            alert('Please select booking dates first')
                        else
                            $.ajax
                                type: 'POST'
                                charset: 'utf-8'
                                url: '/bookings'
                                data:
                                    hotel_name: hname
                                    name: hname
                                    start_date: state.start
                                    end_date: state.finish
                                    address: hadress
                                contentType: 'application/json'
                                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                                success: ->
                                    alert('Booking confirmed!')
                                error: (e) ->
                                    alert('Booking dates overlap with another record')
                    'Book'