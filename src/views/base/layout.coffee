define ['chaplin'], (chaplin) ->

  class Layout extends chaplin.Layout

    listen:
      'dispatcher:dispatch mediator': 'onNavigate'

    regions:
      '[data-region=header]': 'header'
      '[data-region=footer]': 'footer'
      '[data-region=content]': 'content'

    onNavigate: (controller, params, route, options) ->
      @$("[data-region=header] a").removeClass 'active'
      selector = "[data-region=header] [data-name=#{route.controller}##{route.action}]"
      @$(selector).addClass 'active'
