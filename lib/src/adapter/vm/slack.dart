import 'dart:convert' show json;
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
        throw new MessageFailedException(
          benderName: benderName,
          endpoint: endpoint.toString(),
          message: message,
          statusCode: response.statusCode,
        );
      }
    });
  };
}
