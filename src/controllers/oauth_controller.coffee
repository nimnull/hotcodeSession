define [
  'lostorage'
  'chaplin'
], (lostorage, chaplin) ->
  class OAuthController extends chaplin.Controller

    login: ->
      chaplin.mediator.oauth.auth()

    logout: ->
      lostorage.session.empty()
      @redirectToRoute 'index'

    callback: (params, route, options) ->
      chaplin.mediator.oauth.exchange params


