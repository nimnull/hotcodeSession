define ['chaplin'], (chaplin) ->

  class View extends chaplin.View
    getTemplateFunction: -> @template

    getTemplateData: ->
      cid: @cid
