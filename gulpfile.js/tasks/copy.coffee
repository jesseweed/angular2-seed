config = require('../config.json')
gulp = require('gulp')

# COPY REQUIRED NPM PACKAGES TO LIB FOLDER
# TODO: THIS SUCKS! FIND A BETTER SOLUTION :(
gulp.task 'copy:libs', ->
  gulp
    .src([
      config.npm + '*es6-shim/**/*'
      config.npm + '*systemjs/dist/**/*'
      config.npm + '*rxjs/bundles/**/*'
      config.npm + '*angular2/bundles/**/*'
      config.npm + '*material-design-lite/**/*'
    ])
    .pipe gulp.dest(config.dest.lib)
