browserSync = require('browser-sync')
gulp        = require('gulp')
reload      = browserSync.reload
runSequence = require('run-sequence')

# BUILD & EXIT
gulp.task 'build', [
  'ts-files'
  'compile'
  'copy:libs'
]

# BUILD AND WATCH FOR CHANGES
gulp.task 'buildAndWatch', [
  'ts-files'
  'compileAndWatch'
  'copy:libs'
]

# COMPILE ALL THE THINGZ
gulp.task 'compile', ->
  process.argv.watch = false
  runSequence [
    'compile:stylus'
    'compile:stylus-main'
    'compile:jade'
    'compile:ts'
  ]

# COMPILE ALL THE THINGZ & WATCH FOR CHANGES
gulp.task 'compileAndWatch', ->
  process.argv.watch = true
  runSequence [
    'compile:stylus'
    'compile:stylus-main'
    'compile:jade'
    'compile:ts'
  ]

# SET DEFAULT TAK TO BUILD FOR NOW
gulp.task 'default', [ 'serve' ]

# REBUILD & RELEOAD SERVER IF SOMETHING CHANGES
gulp.task 'rebuild', ->
  runSequence 'build', 'reload'

# RELOAD BROWSER
gulp.task 'reload', reload
