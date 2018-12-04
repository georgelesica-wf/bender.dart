import 'dart:convert' show json;
import 'dart:html';

import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

import 'package:bender/src/adapter/adapter.dart';

final _logger = Logger('vm/slack.dart');

BenderAdapter getSlackAdapter({
  @required String token,
  String benderName = 'Benderbot',
  Uri endpoint,
  Map<String, String> headers = const {},
}) {
  assert(token != null);
  assert(benderName != null);

  endpoint ??= Uri.parse('https://slack.com/api/chat.postMessage');

  return (message) async {
    _logger.fine('sending message: $message');

    final arguments = {
      'token': token,
      'channel': benderName,
      'text': message,
    };
    final requestHeaders = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    }..addAll(headers);

    final request = await HttpRequest.request(
      endpoint.toString(),
      method: 'POST',
      sendData: json.encode(arguments),
      requestHeaders: requestHeaders,
    );

    if (request.status != 204) {
      throw new Exception('Sending message failed: ${request.statusText}');
    }
  };
}
