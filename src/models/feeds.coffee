define ['chaplin'], (chaplin) ->

  class NewsFeed extends chaplin.Collection
    url: "#{chaplin.mediator.baseURL}/me/home"
    model: chaplin.Model

    parse: (response) ->
      @paging = response.paging
      response.data
