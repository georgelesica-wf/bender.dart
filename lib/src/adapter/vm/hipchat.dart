import 'dart:convert' show utf8;
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import 'package:bender/src/adapter/adapter.dart';

final _logger = Logger('bender.dart');

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
    _logger.fine('sending hipchat message: $message');

    final client = new HttpClient();

    final request = await client.postUrl(endpoint);

    headers.forEach((key, value) {
      request.headers.add(key, value);
    });
    request.headers.add('Authorization', 'Bearer $token');
    request.headers.add('Content-Type', 'text/plain');
    request.write(message);
    await request.flush();

    final response = await request.close();

    return MessageReceipt(
      endpoint: endpoint.toString(),
      message: message,
      response: await response.transform(utf8.decoder).join('\n'),
      statusCode: response.statusCode,
      wasSuccessful: response.statusCode == 204,
    );
  };
}
