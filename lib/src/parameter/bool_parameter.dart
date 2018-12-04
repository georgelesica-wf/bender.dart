import 'package:meta/meta.dart';

import 'package:bender/src/parameter/parameter.dart';

class BoolParameter extends Parameter<bool> {
  static const Iterable<String> truthyValues = const ['true', 'yes', '1'];

  BoolParameter({
    @required String helpText,
    @required String name,
    String rawValue: 'false',
  }) : super(
          helpText: helpText,
          name: name,
          rawValue: rawValue,
        );

  @override
  bool get parsedValue => truthyValues.contains(rawValue.trim().toLowerCase());

  @override
  final String typeHelpText =
      'A boolean value, truthy values are "true", "yes", and "1", '
      'all others are falsey, case-insensitive';

  @override
  final String typeName = 'bool';
}
