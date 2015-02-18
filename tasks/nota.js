(function() {
  var Nota, fs, open;

  fs = require('fs');

  Nota = require('Nota');

  open = require('open');

  module.exports = function(grunt) {
    return grunt.registerMultiTask('nota', 'Excretes pretty PDF documents', function() {
      var dataPath, done, outputPath, preview, serverAddress, serverPort, templatePath;
      templatePath = grunt.option('template') || this.data.template;
      dataPath = grunt.option('data') || this.data.data;
      outputPath = grunt.option('output') || this.data.output || 'output.pdf';
      serverAddress = grunt.option('address') || this.data.address || 'localhost';
      serverPort = grunt.option('port') || this.data.port || 7483;
      preview = grunt.option('preview') || this.data.preview || false;
      grunt.log.writeln("=== Nota ===");
      grunt.log.writeln("templatePath:  " + templatePath);
      grunt.log.writeln("dataPath:      " + dataPath);
      grunt.log.writeln("outputPath:    " + outputPath);
      grunt.log.writeln("serverAddress: " + serverAddress);
      grunt.log.writeln("serverPort:    " + serverPort);
      done = this.async();
      return fs.readFile(dataPath, function(err, contents) {
        var data, nota;
        data = JSON.parse(contents);
        console.log(data);
        grunt.log.writeln("Starting Nota.");
        nota = new Nota(serverAddress, serverPort, templatePath, data);
        grunt.log.writeln("Rendering.");
        if (preview) {
          return open(nota.url());
        } else {
          return nota.render(outputPath, done);
        }
      });
    });
  };

}).call(this);
