gulp = require('gulp')
browserSync = require('browser-sync')

# BROWSER SYNC
gulp.task 'serve', [ 'build' ], ->
  browserSync
    server: baseDir: 'dist'
    open: false
    port: 1981

  gulp.watch [
    'app/**/*'
    'public/**/*'
    'index.jade'
  ], [ 'rebuild' ]
