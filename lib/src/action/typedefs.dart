import 'package:bender/src/action/context.dart';

/// Callback used to determine if a given action is active, in
/// other words it may be triggered, in a particular context.
typedef bool IsRunnableCallback(Context context);

/// Callback used to build an actual message to send to Bender.
typedef String MessageFactory(Context context);
