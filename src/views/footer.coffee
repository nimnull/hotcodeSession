define [
  'chaplin'
  'rivets'
  'views/base/view'
  'models/footer_vm'
  'templates/footer'
], (chaplin, rivets, View, FooterViewModel, tpl) ->

  class FooterView extends View
    template: tpl
    rivetsView: null
    className: 'container'

    initialize: ->
      @model = new FooterViewModel
      super

    attach: ->
      super
      @rivetsView = rivets.bind(@$el, {@model})

    dispose: ->
      @rivetsView?.unbind()
      super
