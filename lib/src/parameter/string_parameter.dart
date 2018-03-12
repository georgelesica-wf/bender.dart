import 'package:meta/meta.dart';

import 'package:bender/src/parameter/parameter.dart';

class StringParameter extends Parameter<String> {
  StringParameter({
    @required String helpText,
    @required String name,
    String rawValue: '',
  })
      : super(
    helpText: helpText,
    name: name,
    rawValue: rawValue,
  );

  @override
  String get parsedValue => rawValue.trim();

  @override
  final String typeHelpText = 'A string value';

  @override
  final String typeName = 'string';
}
