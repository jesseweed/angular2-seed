gulp      = require('gulp')
tsconfig  = require('tsconfig-glob')

# ADD TS FILES TO TSCONFIG FILE ARRAY
gulp.task 'ts-files', ->
  tsconfig
    configPath: '.'
    indent: 2
