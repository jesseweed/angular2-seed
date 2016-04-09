config  = require('../../config.json')
gulp    = require('gulp')
runSequence = require('run-sequence')
sass        = require('gulp-sass')
sourcemaps  = require('gulp-sourcemaps')

# COMPILE SASS FILES
gulp.task 'compile:sass', [ 'compile:sass-main' ], ->
  gulp.src(config.src.assets.sass.app)
      .pipe(sourcemaps.init())
      .pipe(sass())
      .pipe(sourcemaps.write('.'))
      .pipe gulp.dest(config.dest.app)
  # WATCH & RELOAD ON CHANGE
  if process.argv.watch && !process.argv.watchStylus
    process.argv.watchStylus = true
    gulp.watch config.src.assets.sass.app, ->
      runSequence 'compile:sass', 'reload'

# COMPILE MAIN SASS FILE
gulp.task 'compile:sass-main', ->
  gulp.src(config.src.assets.sass.main)
      .pipe(sourcemaps.init())
      .pipe(sass())
      .pipe(sourcemaps.write('.'))
      .pipe gulp.dest(config.dest.assets.sass.main)
  # WATCH & RELOAD ON CHANGE
  if process.argv.watch && !process.argv.watchStylusMain
    process.argv.watchStylusMain = true
    gulp.watch config.src.assets.sass.main, ->
      runSequence 'compile:sass-main', 'reload'
