import 'dart:async';

import 'package:bender/src/adapter/adapter.dart';

typedef void PrintCallback(String message);

/// A local bender adapter that just calls a function with the
/// message that it would normally send to Bender.
///
/// The default callback is the standard [print] function.
class LocalBenderAdapter extends BenderAdapter {
  final PrintCallback printCallback;

  LocalBenderAdapter(String token, {this.printCallback: print}) : super(token);

  @override
  Future<Null> sendMessage(String message) async {
    printCallback(message);
    return null;
  }
}
