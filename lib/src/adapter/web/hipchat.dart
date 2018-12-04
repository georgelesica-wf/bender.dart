import 'dart:html';

import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import 'package:bender/src/adapter/adapter.dart';

final _logger = Logger('web/hipchat.dart');

BenderAdapter getHipChatAdapter({
  @required Uri endpoint,
  @required String token,
  Map<String, String> headers = const {},
}) =>
    (message) async {
      _logger.fine('sending message: $message');

      final request = await HttpRequest.request(
        endpoint.toString(),
        method: 'POST',
        sendData: message,
        requestHeaders: headers,
      );

      if (request.status != 204) {
        throw new Exception('Sending message failed: ${request.statusText}');
      }
    };
