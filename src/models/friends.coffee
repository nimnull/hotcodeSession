define [
  'chaplin'
  'models/profile'
], (chaplin, Profile) ->

  class Friend extends chaplin.Profile
    urlRoot: chaplin.mediator.baseURL

  class Friends extends chaplin.Collection
    url: "#{chaplin.mediator.baseURL}/me/friends"

    parse: (response) ->
      @paging = response.paging
      response.data
