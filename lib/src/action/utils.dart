import 'package:bender/src/action/context.dart';
import 'package:bender/src/parameter/parameter.dart';

/// Fetch a parameter value from a context in a type-safe manner.
/// 
/// Note that callers should provide the expected type manually
/// to the type parameter. For example:
/// 
///     var isNeato = parameterValue<bool>(ctx, 'isNeato');
/// 
/// This function will throw if a parameter with the given
/// name is not found.
T parameterValue<T>(Context context, String name) {
    return context.parameters
        .where((param) => param is Parameter<T>)
        .firstWhere((param) => param.name == name)
        .parsedValue;
}