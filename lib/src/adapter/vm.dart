import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';

import 'package:bender/src/adapter/adapter.dart';

class BenderAdapterImpl extends BenderAdapter {
  BenderAdapterImpl(String token, {String endpoint})
      : super(token, endpoint: endpoint);

  @override
  Future<Null> sendMessage(String message) async {
    Logger.root.fine('sendMessage: $message');
    final client = new HttpClient();
    return client.postUrl(Uri.parse(endpoint)).then((request) {
      headers.forEach((key, value) {
        request.headers.add(key, value);
      });
      request.write(message);
      return request.close();
    }).then((response) {
      if (response.statusCode != 204) {
        throw new Exception('Sending message failed: ${response.join("\n")}');
      }
    });
  }
}
