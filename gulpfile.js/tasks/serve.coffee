browserSync = require('browser-sync')
config      = require('../config.json')
gulp = require('gulp')

# BROWSER SYNC
gulp.task 'serve', [ 'build' ], ->
  browserSync
    server: baseDir: config.browserSync.baseDir
    open: config.browserSync.open
    port: config.browserSync.port

  gulp.watch config.watch.dir, config.watch.func
