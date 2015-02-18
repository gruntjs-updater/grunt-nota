fs = require('fs')
Nota = require('Nota')
open = require('open')

module.exports = ( grunt ) ->

  grunt.registerMultiTask 'nota', 'Excretes pretty PDF documents', ( ) ->
    templatePath  = grunt.option('template') or @data.template
    dataPath      = grunt.option('data')     or @data.data
    outputPath    = grunt.option('output')   or @data.output  or 'output.pdf'
    serverAddress = grunt.option('address')  or @data.address or 'localhost'
    serverPort    = grunt.option('port')     or @data.port    or 7483
    preview       = grunt.option('preview')  or @data.preview or false

    grunt.log.writeln("=== Nota ===")
    grunt.log.writeln("templatePath:  #{templatePath}")
    grunt.log.writeln("dataPath:      #{dataPath}")
    grunt.log.writeln("outputPath:    #{outputPath}")
    grunt.log.writeln("serverAddress: #{serverAddress}")
    grunt.log.writeln("serverPort:    #{serverPort}")

    done = @async()
    fs.readFile dataPath, ( err, contents ) ->
      data = JSON.parse(contents)
      console.log(data)

      grunt.log.writeln("Starting Nota.")
      nota = new Nota(serverAddress, serverPort, templatePath, data)

      grunt.log.writeln("Rendering.")
      if preview then open(nota.url())
      else nota.render(outputPath, done)

