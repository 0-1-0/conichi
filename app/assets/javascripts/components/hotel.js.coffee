@Hotel = React.createClass
    getInitialState: ->
        parent_state: null
    render: ->
        hname = @props.hotel.name
        hadress = @props.hotel.address
        state = @props.parent_state
        React.DOM.tr null,
            React.DOM.td null, @props.hotel.name
            React.DOM.td null, @props.hotel.address
            React.DOM.td null, @props.hotel.rating
            React.DOM.td null,
                for photo_url in @props.hotel.photos
                    React.DOM.img src: '/img/' + photo_url
            React.DOM.td null,
                React.DOM.button
                    className: 'btn btn-default' 
                    onClick: ->
                        console.log state
                        $.ajax(
                            type: 'POST'
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
                            error: (e)->
                                alert('Booking start date overlaps with another record')
                            charset: 'utf-8')
                    'Book'
        # React.DOM.td null, @props.record.title
        # React.DOM.td null, amountFormat(@props.record.amount)