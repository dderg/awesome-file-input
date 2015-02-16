# A class-based template for jQuery plugins in Coffeescript
#
#     $('.target').myPlugin({ paramA: 'not-foo' });
#     $('.target').myPlugin('myMethod', 'Hello, world');
#
# Check out Alan Hogan's original jQuery plugin template:
# https://github.com/alanhogan/Coffeescript-jQuery-Plugin-Template
#
(($, window) ->
 
  # Define the plugin class
  class FileInput
 
    defaults:
      paramA: 'foo'
      paramB: 'bar'
 
    constructor: (el, options) ->
      @options = $.extend({}, @defaults, options)
      @$el = $(el)
 
    # Additional plugin methods go here
    myMethod: (echo) ->
      @$el.html(@options.paramA + ': ' + echo)
 
  # Define the plugin
  $.fn.extend fileinput: (option, args...) ->
    @each ->
      $this = $(this)
      data = $this.data('fileinput')
 
      if !data
        $this.data 'fileinput', (data = new FileInput(this, option))
      if typeof option == 'string'
        data[option].apply(data, args)
 
) window.jQuery, window