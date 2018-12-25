import 'dart:async';

import 'package:meta/meta.dart';

/// An adapter for sending messages to Bender, generally using
/// some form of chat, though the interface itself is totally
/// transport-agnostic.
///
/// The adapter will be called with the exact message that should
/// be delivered to Bender.
///
/// Once the message has been sent, the adapter should return
/// a [MessageReceipt] instance that indicates, at a minimum,
/// the message it sent and whether or not the message was sent
/// successfully.
typedef Future<MessageReceipt> BenderAdapter(String message);

/// A class that encapsulates an attempt to send Bender a message
/// and any response received.
///
/// Not all adapters will have reasonable values for all fields,
/// depending on the type of transport they use. It is perfectly
/// acceptable to re-purpose fields if that makes sense for a
/// given adapter.
class MessageReceipt {
  /// The name of the bot for the given transport.
  final String benderName;

  /// The endpoint (or other means of address) used.
  final String endpoint;

  /// The exact message that was sent to Bender.
  final String message;

  /// The raw response received from the transport used to send
  /// the message to Bender.
  final String response;

  /// The status code received from the transport, if any.
  final int statusCode;

  /// Whether or not the message to Bender was successfully sent.
  ///
  /// This doesn't necessarily indicate whether or not Bender was
  /// able to parse and execute the command included in the message,
  /// just whether or not the adapter was able to send it.
  final bool wasSuccessful;

  MessageReceipt({
    @required this.message,
    @required this.wasSuccessful,
    this.benderName = '',
    this.endpoint = '',
    this.response = '',
    this.statusCode = 0,
  })  : assert(message != null),
        assert(wasSuccessful != null),
        assert(benderName != null),
        assert(endpoint != null),
        assert(response != null),
        assert(statusCode != null);

  @override
  String toString() => 'MessageReceipt\n'
      '  benderName: $benderName\n'
      '  endpoint: $endpoint\n'
      '  message: $message\n'
      '  response:\n$response\n'
      '  statusCode: $statusCode\n'
      '  wasSuccessful: $wasSuccessful';
}
