gulp = require "gulp"
coffee = require "gulp-coffee"
uglify = require "gulp-uglify"

gulp.task "coffee", ->
  gulp.src "fileinput.coffee"
    .pipe do coffee
    .pipe do uglify
    .pipe gulp.dest "./"

gulp.task "watch", ->
  gulp.watch "./fileinput.coffee", ["coffee"]

gulp.task "default", ["coffee","watch"]