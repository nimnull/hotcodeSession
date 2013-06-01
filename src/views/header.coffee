define [
  'views/base/view'
  'templates/header'
], (View, tpl) ->

  class HeaderView extends View
    template: tpl
    className: 'header'
