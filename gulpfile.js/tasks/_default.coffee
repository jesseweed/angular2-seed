gulp        = require('gulp')
browserSync = require('browser-sync')
reload      = browserSync.reload

# BUILD TASK
gulp.task 'build', [
  'ts-files'
  'compile'
  'copy:libs'
]

# COMPILE ALL THE THINGZ
gulp.task 'compile', [
  'compile:stylus'
  'compile:jade'
  'compile:ts'
]

# SET DEFAULT TAK TO BUILD FOR NOW
gulp.task 'default', [ 'build' ]

# REBUILD & RELEOAD SERVER IF SOMETHING CHANGES
gulp.task 'rebuild', [ 'build' ], reload
