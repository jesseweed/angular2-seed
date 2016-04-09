config  = require('../../config.json')
gulp    = require('gulp')
jade    = require('gulp-jade')
runSequence = require('run-sequence')

# COMPILE JADE TEMPLATES
gulp.task 'compile:jade', ->
  gulp.src(config.src.assets.jade.templates)
      .pipe(jade(pretty: true))
      .pipe gulp.dest(config.dest.assets.jade.templates)
  # WATCH & RELOAD ON CHANGE
  if process.argv.watch && !process.argv.watchJade
    process.argv.watchJade = true
    gulp.watch config.src.assets.jade.templates, ->
      runSequence 'compile:jade', 'reload'
