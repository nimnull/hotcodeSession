define [
  'chaplin'
], (chaplin) ->

  class Profile extends chaplin.Model
    urlRoot: "#{chaplin.mediator.baseURL}/me"
