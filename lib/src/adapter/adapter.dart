import 'dart:async';

/// An adapter for sending messages to Bender, generally using
/// some form of chat.
///
/// The adapter will be called with the exact message that should
/// be delivered to Bender.
typedef Future<void> BenderAdapter(String message);
