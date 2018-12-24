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

    final request = await HttpRequest.request(
      endpoint.toString(),
      method: 'POST',
      sendData: message,
      requestHeaders: headers,
    );

    if (request.status != 204) {
      throw new MessageFailedException(
        benderName: '',
        endpoint: endpoint.toString(),
        message: message,
        statusCode: request.status,
      );
    }
  };
}
