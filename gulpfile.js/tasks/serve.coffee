browserSync = require('browser-sync')
config      = require('../config.json')
gulp = require('gulp')
modRewrite = require('connect-modrewrite')

# BROWSER SYNC
gulp.task 'serve', [ 'buildAndWatch' ], ->
  browserSync
    server:
      baseDir: config.browserSync.baseDir
      middleware: [
        modRewrite([ # Enables angular to be reloaded with html5 mode enabled
          '^[^\\.]*$ /index.html [L]'
        ])
      ]
    open: config.browserSync.open
    port: config.browserSync.port
