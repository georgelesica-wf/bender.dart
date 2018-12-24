import 'dart:async';

import 'package:meta/meta.dart';

/// An adapter for sending messages to Bender, generally using
/// some form of chat, though the interface itself is totally
/// transport-agnostic.
///
/// The adapter will be called with the exact message that should
/// be delivered to Bender.
///
/// If the adapter is unable to send a particular message for
/// whatever reason, it should throw an instance of
/// [MessageFailedException], providing appropriate values
/// for its fields.
///
/// In other words, there are two possible things that might
/// happen when an adapter is called: 1) it sends the provided
/// message successfully, or 2) it throws [MessageFailedException].
/// No other outcomes are allowed.
typedef Future<void> BenderAdapter(String message);

/// A useful exception class to be used to communicate message
/// failures from adapter implementations.
class MessageFailedException implements Exception {
  final String benderName;

  final String endpoint;

  final String message;

  final int statusCode;

  MessageFailedException({
    @required this.benderName,
    @required this.endpoint,
    @required this.message,
    @required this.statusCode,
  });

  @override
  String toString() => 'Message failed ($statusCode): $message';
}
