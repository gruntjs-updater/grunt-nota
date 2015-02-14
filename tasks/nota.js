(function() {
  var Nota;

  Nota = require('Nota');

  module.exports = function(grunt) {
    return grunt.registerMultiTask('nota', 'Excretes pretty PDF documents', function() {
      var dataPath, done, nota, outputPath, serverAddress, serverPort, templatePath;
      templatePath = grunt.option('template') || this.data.template;
      dataPath = grunt.option('data') || this.data.data;
      outputPath = grunt.option('output') || this.data.output || 'output.pdf';
      serverAddress = grunt.option('address') || this.data.address || 'localhost';
      serverPort = grunt.option('port') || this.data.port || 7483;
      grunt.log.writeln("=== Nota ===");
      grunt.log.writeln("templatePath:  " + templatePath);
      grunt.log.writeln("dataPath:      " + dataPath);
      grunt.log.writeln("outputPath:    " + outputPath);
      grunt.log.writeln("serverAddress: " + serverAddress);
      grunt.log.writeln("serverPort:    " + serverPort);
      done = this.async();
      nota = new Nota(templatePath, dataPath, outputPath, serverAddress, serverPort, done);
      return grunt.log.writeln("Rendering!");
    });
  };

}).call(this);
