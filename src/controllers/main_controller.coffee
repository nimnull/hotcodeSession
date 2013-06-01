define [
  'chaplin'
  'views/header'
  'views/footer'
  'views/index', 'models/index_vm'
  'views/about'
  'views/profile', 'models/profile'
], (chaplin, HeaderView, FooterView, IndexView, IndexVM, AboutView, ProfileView, Profile) ->

  class MainController extends chaplin.Controller
    title: 'Index'

    beforeAction: (params, route) ->
      @compose 'header', HeaderView, region: 'header'
      @compose 'footer', FooterView, region: 'footer'

    index: ->
      @view = new IndexView(
        autoRender: yes
        region: 'content'
        model: new IndexVM
      )

    about: ->
      @view = new AboutView(
        autoRender: yes
        region: 'content'
      )

    profile: ->
      @model = new Profile
      @model.fetch data:
        fields: ['picture', 'inspirational_people', 'bio', 'link', 'name'].join ','
      @view = new ProfileView {@model, region: 'content'}
