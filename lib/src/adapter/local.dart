import 'package:logging/logging.dart';

import 'package:bender/src/adapter/adapter.dart';

final _logger = Logger('bender.dart');

BenderAdapter getConsoleAdapter() => (message) async {
      print(message);
      return MessageReceipt(
        message: message,
        wasSuccessful: true,
      );
    };

BenderAdapter getLoggingAdapter() => (message) async {
      _logger.info(message);
      return MessageReceipt(
        message: message,
        wasSuccessful: true,
      );
    };
