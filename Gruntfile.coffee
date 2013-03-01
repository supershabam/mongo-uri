module.exports = (grunt)->
  grunt.initConfig
    coffee:
      glob:
        expand: true
        cwd: "src"
        src: ["*.litcoffee"]
        dest: "lib"
        ext: ".js"

  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadTasks "tasks"

  grunt.registerTask "test", ["coffee", "mochacli"]