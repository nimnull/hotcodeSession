define ['chaplin', 'lostorage'], (chaplin, lostorage) ->

  class OAuthModel extends chaplin.Model
    urlRoot:  "#{chaplin.mediator.baseURL}/debug_token"
    urlAuthorize: 'https://www.facebook.com/dialog/oauth'
    urlExchange: "#{chaplin.mediator.baseURL}/oauth/access_token"

    defaults:
      client_id: '145596468960818'
      client_secret: 'b95c2dc4f5d3cbc8a2ff36239043ffce'
      redirect_uri: window.location.origin + '/callback'
      scope: [
          'email'
          'publish_actions'
          'friends_actions:hotcodeapp'
          'read_stream'
        ].join ','
      code: null

    initialize: ->
      super
      @set lostorage.session.all()

    parse: (response, options) ->
      response.data

    auth: ->
      window.location = "#{@urlAuthorize}?#{@encodeParams ['client_id', 'redirect_uri', 'scope']}"

    exchange: (params) ->
      if params.code
        @set {code: params.code}
        deffered = $.get @urlExchange, @serialize()
        deffered.then (data, status, jqXHR) =>
          parsedData = @decodeParams data
          @set parsedData
          lostorage.session.set parsedData
          @publishEvent "!router:routeByName", "profile"

    encodeParams: (attributes) ->
      args = ("#{encodeURIComponent(name)}=#{encodeURIComponent(@get name)}" for name in attributes)
      args.join '&'

    decodeParams: (params) ->
      preObject = (val.split('=') for val in params.split('&'))
      _.object(preObject)

    debug: ->
      @fetch
        data:
          access_token: @get 'access_token'
          input_token: @get 'access_token'
        error: (args...) ->
          console.log "OAuthModel#debug", args
        # input_token: @get 'access_token'

