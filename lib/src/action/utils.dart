import 'package:bender/src/action/context.dart';
import 'package:bender/src/parameter/parameter.dart';

/// Determine if all parameters contained within a context are valid.
///
/// This function is used as the default `isRunnable` callback on the
/// `ActionImpl` class. It can be used as a building block for custom callbacks
/// as well.
bool allParametersAreValid(Context context) =>
    context.parameters.every((param) => param.isValueValid);

/// Fetch a parameter value from a [Context] in a typed manner.
///
/// Note that callers should provide the expected type manually to the type
/// parameter. For example:
///
///     var isNeato = parameterValue<bool>(ctx, 'isNeato');
///
/// This function will throw an [ArgumentError] if the parameter's type
/// turns out not to match `T`. However, it will fail silently (and
/// return `null`) if a parameter with the given name was not found in
/// the given context.
T parameterValue<T>(Context context, String name) {
  final param =
      context.parameters.firstWhere((p) => p.name == name, orElse: () => null);
  if (param == null) {
    return null;
  }

  if (param is! Parameter<T>) {
    throw ArgumentError(
        'Incorrect parameter type, found: ${param.runtimeType}');
  }

  return param.parsedValue;
}

/// Set a typed parameter value.
///
/// Note that callers should provide the expected type manually to the type
/// parameter. For example:
///
///     setParameterValue<bool>(ctx, 'isNeato', true);
///
/// This function will throw an [ArgumentError] if the parameter's type
/// turns out not to match `T`. However, it will fail silently if a
/// parameter with the given name was not found in the given context.
void setParameterValue<T>(Context context, String name, T value) {
  final param =
      context.parameters.firstWhere((p) => p.name == name, orElse: () => null);
  if (param == null) {
    return;
  }

  if (param is! Parameter<T>) {
    throw ArgumentError(
        'Incorrect parameter type, found: ${param.runtimeType}');
  }

  param.rawValue = value.toString();
}
