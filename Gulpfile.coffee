gulp = require 'gulp'
coffee = require 'gulp-coffee'
sass = require 'gulp-sass'
uglify = require 'gulp-uglify'
minifyCss = require 'gulp-minify-css'
concat = require 'gulp-concat'
del = require 'del'

gulp.task 'compile-coffee', ['clean-js'], ->
  gulp.src 'coffeescripts/**/*.coffee'
    .pipe coffee()
    .pipe gulp.dest('build/javascripts')

gulp.task 'compile-js', ['compile-coffee'], ->
  dest = 'app.js'
  gulp.src ['build/javascripts/**/*.js', '!build/javascripts/' + dest]
    .pipe concat(dest)
    .pipe uglify()
    .pipe gulp.dest('build/javascripts')

gulp.task 'clean-js', ->
  del 'build/javascripts'

gulp.task 'clean', ['clean-js']

gulp.task 'compile', ['clean', 'compile-coffee', 'compile-js']

gulp.task 'default', ['compile']