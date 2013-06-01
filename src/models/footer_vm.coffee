define ['chaplin'], (chaplin) ->
  class FooterViewModel extends chaplin.Model
    defaults:
      content: "<p>I'm for footer here</p>"
      message: null

    initialize: ->
      super
      @listenTo chaplin.mediator.oauth, 'sync', @updateTokenInfo
      @listenTo chaplin.mediator.oauth, 'error', @onRequestErrors
      @listenTo chaplin.mediator.oauth, 'change:error', @updateTokenInfo

    updateTokenInfo: ->
      unless chaplin.mediator.oauth.get 'error'
        @set message: "#{chaplin.mediator.oauth.get 'application'}, #{chaplin.mediator.oauth.get 'app_id'}"
      else
        @set message: chaplin.mediator.oauth.get('error').message

    onRequestErrors: (model, response, request) ->
      @set message: response.responseJSON?.error?.message
