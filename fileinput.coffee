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
      label: 'Обзор...'
      paramB: 'bar'
 
    constructor: (el, options) ->
      @options = $.extend({}, @defaults, options)
      @input = $(el)
      @container = $("<span class='file-input'></span>")
      @button = $("<button class='file-input__button'>#{@options.label}</button>")
      @input.wrap @container
      @input.before @button
      @file_api = ( window.File && window.FileReader && window.FileList && window.Blob ) ? true : false;
      do @addCss
      @button.focus =>
        @input.focus()
      @input
        .add @button
        .focus =>
          @container.addClass "focus"
        .blur =>
          @container.removeClass "focus"
      @button.click =>
        @input.click()
      @input.change( =>
        file_name = undefined
        if @file_api and @input[0].files[0]
          file_name = @input[0].files[0].name
        else
          file_name = @input.val().replace('C:\\fakepath\\', '')
        if !file_name.length
          return
        @button.text file_name
        return
      ).change()


    addCss: ->
      @container.css {
        display: "block"
        position: "relative"
        overflow: "hidden"
      }
      @input.css {
        position: "absolute"
        left: "0"
        right: "0"
        width: "100%"
        height: "100%"
        transform: "scale(20)"
        letterSpacing: "10em"
        "-ms-transform": "scale(20)"
        opacity: "0"
        cursor: "pointer"
      }

 
    # Additional plugin methods go here
    myMethod: (echo) ->

 
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