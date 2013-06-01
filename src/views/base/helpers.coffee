define [
  'moment'
  'chaplin'
  'handlebars'
], (moment, chaplin, Handlebars) ->

  Handlebars.registerHelper 'ifLoggedIn', (options) ->
    if chaplin.mediator.oauth?.get 'access_token'
      options.fn(this)
    else
      options.inverse(this)

  Handlebars.registerHelper 'linkTo', (endpoint, options) ->
    response = ""
    chaplin.mediator.publish '!router:reverse', endpoint, options.hash, (path) ->
      response = new Handlebars.SafeString path
    response

  Handlebars.registerHelper 'asDate', (date, options) ->
    new Handlebars.SafeString moment(date).fromNow()
