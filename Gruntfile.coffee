module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    clean:
      coffee: ['js']
      requirejs: ['build']
    # coffee-compiler options
    copy:
      files: [
        expand: yes
        cwd: 'lib/'
        src: '*.js'
        dest: 'js/'
      ]
    coffee:
      compile:
        options:
          bare: yes
          sourceMap: yes
        files: [
          expand: yes
          cwd: 'src/'
          src: ['**/*.coffee']
          dest: 'js/'
          ext: '.js'
        ]
    # r.js configuration
    requirejs:
      compile:
        options:
          baseUrl: "js/"
          name: 'initialize'
          out: "build/initialize.js"
          optimize: "uglify"
    watch:
      coffee:
        files: '**/*.coffee'
        tasks: 'coffee'
      handlebars:
        files: 'templates/*.hbs'
        tasks: 'handlebars'
    handlebars:
      compile:
        options:
          amd: yes
          namespace: off
        files: [
          expand: yes
          cwd: 'templates'
          src: '**/*.hbs'
          dest: 'js/templates'
          ext: '.js'
        ]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-handlebars'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', [
    'clean'
    'coffee'
    'handlebars'
  ]