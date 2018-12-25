import 'dart:convert' show json, utf8;
import 'dart:io';

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

    final client = new HttpClient();
    final request = await client.postUrl(endpoint);

    headers.forEach((key, value) {
      request.headers.add(key, value);
    });
    request.headers
      ..add('Authorization', 'Bearer $token')
      ..contentType = ContentType('application', 'json');
    final arguments = {
      'token': token,
      'channel': benderName,
      'text': message,
    };
    request.write(json.encode(arguments));

    final response = await request.close();

    return MessageReceipt(
      benderName: benderName,
      endpoint: endpoint.toString(),
      message: message,
      response: await response.transform(utf8.decoder).join(''),
      statusCode: response.statusCode,
      wasSuccessful: response.statusCode == 204,
    );
  };
}
