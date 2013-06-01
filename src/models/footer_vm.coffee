define ['chaplin'], (chaplin) ->
  oauth = chaplin.mediator.oauth

  class FooterViewModel extends chaplin.Model
    defaults:
      content: "<p>I'm for footer here</p>"
      message: null

    initialize: ->
      super
      @listenTo oauth, 'sync', @updateTokenInfo
      @listenTo oauth, 'error', @onRequestErrors
      @listenTo oauth, 'change:error', @updateTokenInfo

    updateTokenInfo: ->
      unless oauth.get 'error'
        @set message: "#{oauth.get 'application'}, #{oauth.get 'app_id'}"
      else
        @set message: oauth.get('error').message

    onRequestErrors: (model, response, request) ->
      @set message: response.responseJSON?.error?.message
