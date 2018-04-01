import 'package:dart_dev/dart_dev.dart';

void main(Iterable<String> args) {
  config.analyze.entryPoints = ['lib/', 'test/', 'tool/'];
  config.format
    ..lineLength = 80
    ..paths = ['lib/', 'test/', 'tool/'];

  dev(args);
}
