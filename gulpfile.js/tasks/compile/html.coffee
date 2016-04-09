config  = require('../../config.json')
gulp    = require('gulp')
runSequence = require('run-sequence')

# COMPILE HTML TEMPLATES
gulp.task 'compile:html', ->
  gulp.src(config.src.assets.html.templates)
      .pipe gulp.dest(config.dest.assets.html.templates)
  # WATCH & RELOAD ON CHANGE
  if process.argv.watch && !process.argv.watchHTML
    process.argv.watchHTML = true
    gulp.watch config.src.assets.html.templates, ->
      runSequence 'compile:html', 'reload'
