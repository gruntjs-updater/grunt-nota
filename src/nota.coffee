Nota = require('Nota')

module.exports = ( grunt ) ->

  grunt.registerMultiTask 'nota', 'Excretes pretty PDF documents', ( ) ->
    templatePath  = grunt.option('template') or @data.template
    dataPath      = grunt.option('data')     or @data.data
    outputPath    = grunt.option('output')   or @data.output  or 'output.pdf'
    serverAddress = grunt.option('address')  or @data.address or 'localhost'
    serverPort    = grunt.option('port')     or @data.port    or 7483

    grunt.log.writeln("=== Nota ===")
    grunt.log.writeln("templatePath:  #{templatePath}")
    grunt.log.writeln("dataPath:      #{dataPath}")
    grunt.log.writeln("outputPath:    #{outputPath}")
    grunt.log.writeln("serverAddress: #{serverAddress}")
    grunt.log.writeln("serverPort:    #{serverPort}")

    done = @async()
    nota = new Nota(templatePath, dataPath, outputPath, serverAddress, serverPort, done)
    grunt.log.writeln("Rendering!")

