config      = require('../../config.json')
configTS    = require('../../../tsconfig.json')
gulp        = require('gulp')
sourcemaps  = require('gulp-sourcemaps')
typescript  = require('gulp-typescript')

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
