define [
  'views/base/view'
  'templates/profile'
], (View, tplProfile) ->
  class ProfileView extends View
    template: tplProfile

    listen:
      'sync model': 'render'

    getTemplateData: ->
      _(super).extend
        profile: @model.serialize()
