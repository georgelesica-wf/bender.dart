import 'dart:convert' show json;
import 'dart:io';

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

    final client = new HttpClient();
    return client.postUrl(endpoint).then((request) {
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

      return request.close();
    }).then((response) {
      if (response.statusCode != 204) {
        throw new Exception('Sending message failed: ${response.join("\n")}');
      }
    });
  };
}
