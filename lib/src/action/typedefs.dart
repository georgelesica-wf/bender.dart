import 'package:bender/src/action/context.dart';

/// Callback used to determine if a given action may be run, in a particular
/// context.
typedef bool IsRunnableCallback(Context context);

/// Callback used to build an actual message to send to Bender.
typedef String MessageFactory(Context context);
