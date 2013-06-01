define [
  'chaplin'
  'models/feeds'
], (chaplin, NewsFeeds) ->

  class IndexVM extends chaplin.Model

    initialize: ->
      @feed = new NewsFeeds
      @feed.fetch()
      super

    dispose: ->
      @feed.dispose()
      super
