import 'package:meta/meta.dart';

import 'package:bender/src/parameter/parameter.dart';

class StringParameter extends Parameter<String> {
  /// The possible values for this parameter.
  final Iterable<String> choices;

  /// Whether or not an empty string is considered a valid value.
  final bool emptyAllowed;

  StringParameter({
    @required String helpText,
    @required String name,
    this.choices: const [],
    this.emptyAllowed: true,
    String rawValue: '',
  }) : super(
          helpText: helpText,
          name: name,
          rawValue: rawValue,
        );

  bool get _checkChoices => (_isEmpty && _checkEmpty) || choices.isEmpty
      ? true
      : choices.contains(parsedValue);

  bool get _checkEmpty => emptyAllowed || !_isEmpty;

  bool get _isEmpty => parsedValue == '';

  @override
  @mustCallSuper
  bool get isValueValid => super.isValueValid && _checkEmpty && _checkChoices;

  @override
  String get parsedValue => rawValue.trim();

  @override
  final String typeHelpText = 'A string value';

  @override
  final String typeName = 'string';
}
