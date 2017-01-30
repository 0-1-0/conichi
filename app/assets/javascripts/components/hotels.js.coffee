@Hotels = React.createClass
    getInitialState: ->
        hotels: @props.data
    getDefaultProps: ->
        hotels: []
    render: ->
        console.log 'render'
        console.log @state
        React.DOM.div
            className: 'hotels'
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
