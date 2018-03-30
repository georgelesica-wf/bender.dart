import 'package:meta/meta.dart';

import 'package:bender/src/parameter/parameter.dart';

class StringParameter extends Parameter<String> {
  /// The possible values for this parameter.
  final Iterable<String> choices;

  /// Whether or not an empty string is considered a valid value.
  final bool emptyAllowed;

  StringParameter({
    this.choices: const [],
    this.emptyAllowed: true,
    @required String helpText,
    @required String name,
    String rawValue: '',
  })
      : super(
          helpText: helpText,
          name: name,
          rawValue: rawValue,
        );

  bool get _isEmpty => parsedValue == '';

  bool get _isValidChoices =>
      _isValidEmpty || choices.isEmpty ? true : choices.contains(parsedValue);

  bool get _isValidEmpty => emptyAllowed || !_isEmpty;

  @override
  @mustCallSuper
  bool get isValueValid => super.isValueValid && _isValidEmpty && _isValidChoices;

  @override
  String get parsedValue => rawValue.trim();

  @override
  final String typeHelpText = 'A string value';

  @override
  final String typeName = 'string';
}
