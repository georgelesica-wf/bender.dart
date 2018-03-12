import 'package:bender/src/action/context.dart';
import 'package:bender/src/parameter/parameter.dart';
import 'package:bender/src/action/typedefs.dart';
import 'package:meta/meta.dart';

bool _defaultIsRunnableCallback(Context context) =>
    context.parameters.every((param) => param.isValueValid);

final _whitespaceRegex = new RegExp(r'\s+\b|\b\s');

abstract class Action implements Context {
  /// Callback to produce a Bender message that will trigger the
  /// action represented by the instance in its current state.
  ///
  /// For example, if bender responded to the command "hi there",
  /// this function would return the string "hi there" for the
  /// "Say Hi" action.
  MessageFactory get getMessage;

  /// Help text to be displayed along with the action's interface.
  String get helpText;

  /// Callback to determine whether or not this action can be
  /// invoked in the given context.
  IsRunnableCallback get isRunnable;

  /// A unique key that can be used by view libraries to identify
  /// this action to avoid unnecessary repainting.
  ///
  /// Do not rely on the specific value of the key, treat it as an
  /// entirely opaque, but unique, string and nothing more.
  String get key => name.replaceAll(_whitespaceRegex, '-');

  /// Name of the action to be displayed to the user in views.
  String get name;

  /// Parameters accepted by this action.
  Iterable<Parameter> get parameters;
}

class ActionImpl extends Action {
  @override
  final MessageFactory getMessage;

  @override
  final String helpText;

  @override
  final IsRunnableCallback isRunnable;

  @override
  final String name;

  @override
  final Iterable<Parameter> parameters;

  // TODO: We've conflated "active" and "valid"
  // Runnable just means we're available to be run, valid means that a run
  // can be expected to succeed. They are similar in many cases, but maybe
  // not all cases?

  ActionImpl({
    @required this.getMessage,
    this.helpText: '',
    IsRunnableCallback isRunnable,
    @required this.name,
    this.parameters: const [],
  })
      : isRunnable = isRunnable ?? _defaultIsRunnableCallback;
}
