define [
  'views/base/view'
  'views/feeds'
  'templates/main'
], (View, FeedsView, tplMain) ->

  class IndexView extends View
    template: tplMain

    regions:
      '[data-region=feed]': 'newsFeed'

    attach: ->
      super
      @subview 'feeds', new FeedsView {collection: @model.feed, region: 'newsFeed'}

