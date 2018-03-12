import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';

import 'package:bender/src/adapter/adapter.dart';

class BenderAdapterImpl extends BenderAdapter {
  BenderAdapterImpl(String token, {String endpoint})
      : super(token, endpoint: endpoint);

  Future<Null> sendMessage(String message) async {
    Logger.root.fine('sendMessage: $message');
    var client = new HttpClient();
    return client
        .postUrl(Uri.parse(endpoint))
        .then((HttpClientRequest request) {
      headers.forEach((key, value) {
        request.headers.add(key, value);
      });
      request.write(message);
      request.close();
    }).then((HttpClientResponse response) {
      if (response.statusCode != 204) {
        throw new Exception('Sending message failed: ${response.join("\n")}');
      }
    });
  }
}
