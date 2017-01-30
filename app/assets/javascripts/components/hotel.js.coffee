@Hotel = React.createClass
    render: ->
        console.log @props.hotel
        React.DOM.tr null,
            React.DOM.td null, @props.hotel.name
            React.DOM.td null, @props.hotel.address
            React.DOM.td null, @props.hotel.rating
            React.DOM.td null,
                for photo_url in @props.hotel.photos
                    React.DOM.img src: '/img/' + photo_url
            React.DOM.td null,
                React.DOM.button 
                    onClick: ->
                        alert '!',
                    'Book'
        # React.DOM.td null, @props.record.title
        # React.DOM.td null, amountFormat(@props.record.amount)