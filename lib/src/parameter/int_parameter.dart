import 'package:meta/meta.dart';

import 'package:bender/src/parameter/parameter.dart';

class IntParameter extends Parameter<int> {
  IntParameter({
    @required String helpText,
    @required String name,
    String rawValue: '0',
  })
      : super(
          helpText: helpText,
          name: name,
          rawValue: rawValue,
        );

  @override
  int get parsedValue => int.parse(rawValue.trim());

  @override
  final String typeHelpText = 'An integer value';

  @override
  final String typeName = 'int';
}
