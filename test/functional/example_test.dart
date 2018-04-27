import 'dart:io';

import 'package:path/path.dart' as path;

import 'package:test/test.dart';

class ExampleTest {
  String actualOutput;
  String expectedOutput;

  ExampleTest({this.actualOutput = '', this.expectedOutput = ''});

  void verify() {
    expect(actualOutput, expectedOutput);
  }
}

const outputSuffix = '_output.txt';
const caseSuffix = '_case.dart';

void main() {
  group('examples', () {
    final examplesDirectory = new Directory('example');

    final results = examplesDirectory.listSync(recursive: true).fold(<String, ExampleTest>{}, (results, entity) {
      if (entity is File) {
        final fileName = path.basename(entity.path);
        
        if (fileName.endsWith(outputSuffix)) {
          final testName = fileName.substring(0, fileName.length - outputSuffix.length);
          final content = entity.readAsStringSync();

          if (results.containsKey(testName)) {
            results[testName].expectedOutput = content;
          } else {
            results[testName] = new ExampleTest(expectedOutput: content);
          }
        }
        
        if (fileName.endsWith(caseSuffix)) {
          final testName = fileName.substring(0, fileName.length - caseSuffix.length);
          final output = Process.runSync('pub', ['run', entity.path]).stdout;

          if (results.containsKey(testName)) {
            results[testName].actualOutput = output;
          } else {
            results[testName] = new ExampleTest(actualOutput: output);
          }
        }
      }

      return results;
    });

    // Check our results

    for (var testName in results.keys) {
      test('$testName', () {
        final test = results[testName];
        test.verify();
      });
    }
  });
}
