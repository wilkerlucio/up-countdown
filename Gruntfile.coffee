module.exports = (grunt) ->
  require("load-grunt-tasks")(grunt)

  grunt.initConfig
    copy:
      dependencies:
        files:
          "build/": ["./bower_components/jquery/jquery.min.js"]

    stylus:
      options:
        use: [require("nib")]
        import: ["nib"]
      index:
        files:
          "build/up.css": "up.styl"

    jade:
      index:
        files:
          "build/index.html": "index.jade"

    watch:
      options:
        spawn: false

      jade:
        files: ["*.jade", "*.svg"]
        tasks: ["jade:index"]

      stylus:
        files: ["*.styl"]
        tasks: ["stylus:index"]

  grunt.registerTask "default", ["copy", "jade", "stylus", "watch"]
