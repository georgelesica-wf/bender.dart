import 'dart:io';

import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import 'package:bender/src/adapter/adapter.dart';

final _logger = Logger('vm/hipchat.dart');

/// An adapter implementation that relies on HipChat as its
/// transport, for use on the Dart VM.
BenderAdapter getHipChatAdapter({
  @required Uri endpoint,
  @required String token,
  Map<String, String> headers = const {},
}) {
  assert(endpoint != null);
  assert(token != null);
  assert(headers != null);

  return (message) async {
    _logger.fine('sending message: $message');

    final client = new HttpClient();
    return client.postUrl(endpoint).then((request) {
      headers.forEach((key, value) {
        request.headers.add(key, value);
      });
      request.headers.add('Authorization', 'Bearer $token');

      request.write(message);
      return request.close();
    }).then((response) {
      if (response.statusCode != 204) {
        throw new Exception('Sending message failed: ${response.join("\n")}');
      }
    });
  };
}
