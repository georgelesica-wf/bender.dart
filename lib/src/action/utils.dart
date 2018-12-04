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
/// This function will throw if a parameter with the given name is not found or
/// if the parameter's type was incorrect.
T parameterValue<T>(Context context, String name) => context.parameters
    .where((param) => param is Parameter<T>)
    .firstWhere((param) => param.name == name)
    .parsedValue;

/// Set a typed parameter value.
///
/// Note that callers should provide the expected type manually to the type
/// parameter. For example:
///
///     setParameterValue<bool>(ctx, 'isNeato', true);
///
/// This function will throw if a parameter with the given name is not found or
/// if the parameter's type was incorrect.
void setParameterValue<T>(Context context, String name, T value) =>
    context.parameters
        .where((param) => param is Parameter<T>)
        .firstWhere((param) => param.name == name)
        .rawValue = value.toString();
