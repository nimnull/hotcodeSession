define [
  'chaplin'
  'views/base/view'
  'templates/feed_item'
], (chaplin, View, tplFeedItem) ->

  class FeedItem extends View
    template: tplFeedItem

    getTemplateData: ->
      @model.serialize()

  class FeedList extends chaplin.CollectionView
    itemView: FeedItem

    listen:
      'error collection': 'onSyncError'

    onSyncError: (args...) ->
      console.log "FeedList#onSyncError", args

    filterer: (model, idx) ->
      if model.get 'message' then yes else no

