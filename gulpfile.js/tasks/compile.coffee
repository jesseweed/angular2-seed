config      = require('../config.json')
configTS    = require('../../tsconfig.json')
gulp        = require('gulp')
jade        = require('gulp-jade')
sourcemaps  = require('gulp-sourcemaps')
stylus      = require('gulp-stylus')
typescript  = require('gulp-typescript')

# COMPILE TYPESCRIPT
gulp.task 'compile:ts', ->
  gulp.src(configTS.files)
      .pipe(sourcemaps.init())
      .pipe(typescript(configTS.compilerOptions))
      .pipe(sourcemaps.write('.'))
      .pipe gulp.dest(config.dest.app)

# COMPILE APP JADE FILES
gulp.task 'compile:stylus', [ 'compile:stylus-main' ], ->
  gulp.src(config.src.assets.stylus.app)
      .pipe(sourcemaps.init())
      .pipe(stylus())
      .pipe(sourcemaps.write('.'))
      .pipe gulp.dest(config.dest.app)

# COMPILE MAIN STYLUS FILE
gulp.task 'compile:stylus-main', ->
  gulp.src(config.src.assets.stylus.main)
      .pipe(sourcemaps.init())
      .pipe(stylus())
      .pipe(sourcemaps.write('.'))
      .pipe gulp.dest(config.dest.assets.stylus.main)

# COMPILE JADE TEMPLATES
gulp.task 'compile:jade', ->
  gulp.src(config.src.assets.html.templates)
      .pipe(jade(pretty: true))
      .pipe gulp.dest(config.dest.assets.html.templates)
