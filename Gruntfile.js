module.exports = function(grunt) {

  grunt.initConfig({
    es6transpiler: {
      server: {
        expand: true,
        cwd: 'src/',
        src: '**/*.js',
        dest: 'lib/'
      },
      client: {
        expand: true,
        cwd: 'assets/js6/',
        src: '**/*.js',
        dest: 'assets/js/',
        options: {
          globals: {
            "jQuery": false
          }
        }
      }
    },
    less: {
      client: {
        files: {
          "assets/css/styles.css": "assets/less/styles.less"
        }
      }
    }
  });

  grunt.loadNpmTasks('pine2e');
  grunt.loadNpmTasks('grunt-es6-transpiler');
  grunt.loadNpmTasks('grunt-contrib-less');

  grunt.registerTask('server', ['es6transpiler:server']);
  grunt.registerTask('client', ['es6transpiler:client', 'less']);
  grunt.registerTask('default', ['client', 'server']);

};
