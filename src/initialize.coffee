require.config
  baseUrl: "/js"
  paths:
    underscore: '../lib/underscore'
    jquery: '../lib/jquery'
    backbone: '../lib/backbone'
    handlebars: '../lib/handlebars'
    lostorage: '../lib/lostorage'
    rivets: '../lib/rivets'
    moment: '../lib/moment'
  shim:
    backbone:
      # These script dependencies should be loaded before loading
      # backbone.js
      deps: ['underscore', 'jquery']
      # Once loaded, use the global 'Backbone' as the
      # module value.
      exports: 'Backbone'
    underscore:
      exports: '_'
    handlebars:
      exports: 'Handlebars'
  waitSeconds: 15
  urlArgs: "bust=" +  (new Date()).getTime()

require [
  'backbone'
  'rivets'
  'application'
  'routes'
  'views/base/helpers'
], (BB, rivets, Application, routes, others...) ->
  BB.emulateJSON = yes

  rivets.configure
    adapter:
      subscribe: (obj, keypath, callback) -> obj.on "change:#{keypath}", callback
      unsubscribe: (obj, keypath, callback) -> obj.off "change:#{keypath}", callback
      read: (obj, keypath) -> obj.get keypath
      publish: (obj, keypath, value) -> obj.set keypath, value

  app = new Application {routes}
