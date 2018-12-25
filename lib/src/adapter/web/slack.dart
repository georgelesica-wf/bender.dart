import 'dart:convert' show json;
import 'dart:html';

import 'package:bender/src/adapter/adapter.dart';
import 'package:bender/src/adapter/slack.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

final _logger = Logger('bender.dart');

BenderAdapter getSlackAdapter({
  @required String token,
  String benderName = defaultBenderName,
  Uri endpoint,
  Map<String, String> headers = const {},
}) {
  assert(token != null);
  assert(benderName != null);
  assert(headers != null);

  endpoint ??= Uri.parse(defaultPostMessageEndpoint);

  return (message) async {
    _logger.fine('sending slack message: $message');

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
      requestHeaders: requestHeaders,
      sendData: json.encode(arguments),
    );

    return MessageReceipt(
      benderName: benderName,
      endpoint: endpoint.toString(),
      message: message,
      response: request.responseText,
      statusCode: request.status,
      wasSuccessful: request.status == 204,
    );
  };
}
