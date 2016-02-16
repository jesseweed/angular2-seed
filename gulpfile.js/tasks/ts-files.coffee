gulp      = require('gulp')
tsconfig  = require('tsconfig-glob')

# ADD TYPESCRIPT FILES TO THE FILE ARRAY IN TSCONFIG
gulp.task 'ts-files', ->
  tsconfig
    configPath: '.'
    indent: 2
