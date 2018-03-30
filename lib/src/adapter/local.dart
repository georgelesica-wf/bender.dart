import 'dart:async';

import 'package:bender/src/adapter/adapter.dart';

class LocalBenderAdapter extends BenderAdapter {
  LocalBenderAdapter(String token) : super(token);

  @override
  Future<Null> sendMessage(String message) {
    print('Message: $message');
    return null;
  }
}