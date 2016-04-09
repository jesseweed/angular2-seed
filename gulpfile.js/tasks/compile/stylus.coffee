config  = require('../../config.json')
gulp    = require('gulp')
runSequence = require('run-sequence')
sourcemaps  = require('gulp-sourcemaps')
stylus  = require('gulp-stylus')

# COMPILE STYLUS FILES
gulp.task 'compile:stylus', [ 'compile:stylus-main' ], ->
  gulp.src(config.src.assets.stylus.app)
      .pipe(sourcemaps.init())
      .pipe(stylus())
      .pipe(sourcemaps.write('.'))
      .pipe gulp.dest(config.dest.app)
  # WATCH & RELOAD ON CHANGE
  if process.argv.watch && !process.argv.watchStylus
    process.argv.watchStylus = true
    gulp.watch config.src.assets.stylus.app, ->
      runSequence 'compile:stylus', 'reload'

# COMPILE MAIN STYLUS FILE
gulp.task 'compile:stylus-main', ->
  gulp.src(config.src.assets.stylus.main)
      .pipe(sourcemaps.init())
      .pipe(stylus())
      .pipe(sourcemaps.write('.'))
      .pipe gulp.dest(config.dest.assets.stylus.main)
  # WATCH & RELOAD ON CHANGE
  if process.argv.watch && !process.argv.watchStylusMain
    process.argv.watchStylusMain = true
    gulp.watch config.src.assets.stylus.main, ->
      runSequence 'compile:stylus-main', 'reload'
