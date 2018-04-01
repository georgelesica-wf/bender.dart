import 'package:meta/meta.dart';

abstract class Parameter<T> {
  final String helpText;

  final String name;

  /// The raw string value of the parameter as provided by the user
  /// or fetched from the environment.
  ///
  /// TODO: If we need an onChange event then this will need getter / setter
  String rawValue;

  Parameter({
    @required this.helpText,
    @required this.name,
    @required this.rawValue,
  });

  @mustCallSuper
  bool get isValueValid {
    try {
      final value = parsedValue;
      return value is T;
    } catch (_) {
      return false;
    }
  }

  /// Return the raw value, parsed to the correct data type.
  ///
  /// This getter should throw if the raw value cannot be correctly
  /// parsed.
  T get parsedValue;

  String get typeHelpText;

  String get typeName;
}
