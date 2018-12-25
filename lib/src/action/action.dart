import 'package:meta/meta.dart';

import 'package:bender/src/action/context.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/parameter.dart';
import 'package:bender/src/action/typedefs.dart';

final _whitespaceRegex = RegExp(r'\s+\b|\b\s');

abstract class Action implements Context {
  /// Callback to produce a Bender message that will trigger the action
  /// represented by the instance in its current state.
  ///
  /// For example, if bender responded to the command "hi there", this
  /// function might return the string "hi there" for the "SayHi" action.
  MessageFactory get getMessage;

  /// Help text to be displayed along with the action's interface.
  String get helpText;

  /// Callback to determine whether or not this action can be invoked in the
  /// given context.
  IsRunnableCallback get isRunnable;

  /// A unique key that can be used by view libraries to identify this action to
  /// avoid unnecessary repainting.
  ///
  /// Do not rely on the specific value of the key, treat it as an entirely
  /// opaque, but unique, string and nothing more.
  String get key;

  /// A shortcut to simply get the message represented by the current
  /// state of the action and its parameters.
  String get message;

  /// Name of the action to be displayed to the user in views.
  String get name;

  /// Parameters accepted by this action.
  @override
  Iterable<Parameter> get parameters;
}

class ActionImpl implements Action {
  ActionImpl({
    @required this.getMessage,
    @required this.name,
    this.helpText: '',
    IsRunnableCallback isRunnable,
    this.parameters: const [],
  }) : isRunnable = isRunnable ?? allParametersAreValid {
    // Guard against duplicate parameter names.
    final names = parameters.map((param) => param.name).toSet();
    if (names.length != parameters.length) {
      throw ArgumentError('All parameters must have unique names');
    }
  }

  @override
  final MessageFactory getMessage;

  @override
  final String helpText;

  @override
  final IsRunnableCallback isRunnable;

  @override
  String get key => name.replaceAll(_whitespaceRegex, '-');

  @override
  String get message => getMessage(this);

  @override
  final String name;

  @override
  final Iterable<Parameter> parameters;
}
