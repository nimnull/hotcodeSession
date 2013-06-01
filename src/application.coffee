define [
  'jquery'
  'chaplin'
  'views/base/layout'
  'models/oauth'
], (BB, chaplin, Layout, OAuthModel) ->

  class Application extends chaplin.Application

    title: 'Sample app'

    constructor: (options) -> @initialize options

    initialize: ->
      super
      @patchRequest()

    initLayout: (options = {}) ->
      options.title ?= @title
      @layout = new Layout options

    patchRequest: ->
      # patch to sign all requests with FB access token
      $(document).ajaxSend (event, jqXHR, ajaxOptions) ->
        if chaplin.mediator.oauth?.get 'access_token'
          token_arg = $.param
            access_token: chaplin.mediator.oauth.get 'access_token'
          connector = if ajaxOptions.url.indexOf('?') > 0 then "&" else "?"
          ajaxOptions.url = ajaxOptions.url + connector + token_arg

    initMediator: ->
      chaplin.mediator.baseURL = "https://graph.facebook.com"
      chaplin.mediator.oauth = new OAuthModel
      chaplin.mediator.seal()
