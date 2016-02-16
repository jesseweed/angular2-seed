browserSync = require('browser-sync')
config      = require('../config.json')
configTS    = require('../../tsconfig.json')
gulp        = require('gulp')
jade        = require('gulp-jade')
reload      = browserSync.reload
runSequence = require('run-sequence')
sourcemaps  = require('gulp-sourcemaps')
stylus      = require('gulp-stylus')
typescript  = require('gulp-typescript')
yarg = require('yargs');

# COMPILE TYPESCRIPT
gulp.task 'compile:ts', ->
  gulp.src(configTS.files)
      .pipe(sourcemaps.init())
      .pipe(typescript(configTS.compilerOptions))
      .pipe(sourcemaps.write('.'))
      .pipe gulp.dest(config.dest.app)
  # WATCH & RELOAD ON CHANGE
  if process.argv.watch && !process.argv.watchTS
    process.argv.watchTS = true
    gulp.watch configTS.files, ->
      runSequence 'compile:ts', 'reload'

# COMPILE APP JADE FILES
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

# COMPILE JADE TEMPLATES
gulp.task 'compile:jade', ->
  gulp.src(config.src.assets.html.templates)
      .pipe(jade(pretty: true))
      .pipe gulp.dest(config.dest.assets.html.templates)
  # WATCH & RELOAD ON CHANGE
  if process.argv.watch && !process.argv.watchJade
    console.log 'watch jade'
    process.argv.watchJade = true
    gulp.watch config.src.assets.html.templates, ->
      runSequence 'compile:jade', 'reload'
