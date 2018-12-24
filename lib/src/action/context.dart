import 'package:bender/src/parameter/parameter.dart';

/// A context represents the state of the environment that contains a given
/// action, including the current parameter values set on the action.
abstract class Context {
  /// The current state of the action's parameters, if any.
  Iterable<Parameter> get parameters;
}
