import 'dart:async';

const String defaultEndpoint =
    'https://workiva.hipchat.com/v2/user/@Bender/message';

/// An adapter for sending messages to Bender, generally using
/// the HipChat API.
abstract class BenderAdapter {
  /// The HipChat endpoint to use to contact Bender.
  final String endpoint;

  /// The HipChat token to use for authentication.
  final String token;

  BenderAdapter(this.token, {String endpoint})
      : endpoint = endpoint ?? defaultEndpoint;

  /// A map of headers that must be included with each request.
  Map<String, String> get headers => {'Authorization': 'Bearer $token'};

  /// Send the given string to Bender.
  ///
  /// The returned future should complete with an error if
  /// the request fails for any reason.
  Future<Null> sendMessage(String message);
}
