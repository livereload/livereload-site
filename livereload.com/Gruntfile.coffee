module.exports = (grunt) ->
  grunt.initConfig
    clean:
      wintersmith: ['build']

    stylus:
      options:
        foo: 1
      build:
        src: ['assets/css/livereload.styl']
        dest: 'contents/assets/css/livereload.css'

    coffee:
      build:
        expand: yes
        cwd: 'assets/js'
        src: ['**/*.coffee']
        dest: 'contents/assets/js/'
        ext: 'js'

    copy:
      assets:
        src: ['assets/css/**/*.css', 'assets/js/**/*.js', 'assets/fonts/**/*.{eot,svg,ttf,woff}']
        dest: 'contents/'

    wintersmith:
      build: {}
      preview:
        options:
          action: 'preview'

  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-stylus')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-wintersmith')

  grunt.registerTask 'prebuild', ['stylus:build']
  grunt.registerTask 'build', ['clean', 'prebuild', 'wintersmith:build']
  grunt.registerTask 'default', ['prebuild']
