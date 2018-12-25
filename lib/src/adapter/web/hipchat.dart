import 'dart:html';

import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import 'package:bender/src/adapter/adapter.dart';

final _logger = Logger('bender.dart');

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

    final requestHeaders = <String, String>{};
    headers.forEach((key, value) {
      requestHeaders[key] = value;
    });
    requestHeaders['Authorization'] = 'Bearer $token';
    requestHeaders['Content-Type'] = 'text/plain';

    final request = await HttpRequest.request(
      endpoint.toString(),
      method: 'POST',
      requestHeaders: requestHeaders,
      sendData: message,
    );

    return MessageReceipt(
      endpoint: endpoint.toString(),
      message: message,
      response: request.responseText,
      statusCode: request.status,
      wasSuccessful: request.status == 204,
    );
  };
}
