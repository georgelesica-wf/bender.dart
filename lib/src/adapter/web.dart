import 'dart:async';
import 'dart:html';

import 'package:logging/logging.dart';

import 'package:bender/src/adapter/adapter.dart';

class BenderAdapterImpl extends BenderAdapter {
  BenderAdapterImpl(String token, {String endpoint})
      : super(token, endpoint: endpoint);

  @override
  Future<Null> sendMessage(String message) async {
    Logger.root.fine('sendMessage: $message');
    final request = await HttpRequest.request(endpoint,
        method: 'POST', sendData: message, requestHeaders: headers);
    if (request.status != 204) {
      throw new Exception('Sending message failed: ${request.statusText}');
    }
  }
}
