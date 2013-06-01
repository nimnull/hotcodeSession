define [
  'chaplin'
  'models/profile'
], (chaplin, Profile) ->
  class Friend extends chaplin.Profile
    urlRoot: 'https://graph.facebook.com/'

  class Friends extends chaplin.Collection
    url: 'https://graph.facebook.com/me/friends'

    parse: (response) ->
      @paging = response.paging
      response.data
