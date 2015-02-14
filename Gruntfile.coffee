module.exports = ( grunt ) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffee:
      all:
        files: [
          expand: true
          cwd: 'src'
          src: ['**/*.coffee']
          dest: 'tasks'
          ext: '.js'
        ]

    nota:
      default:
        test: 'hallo'

    watch:
      all:
        files: ['src/**/*.coffee']
        tasks: ['coffee']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadTasks 'tasks'
