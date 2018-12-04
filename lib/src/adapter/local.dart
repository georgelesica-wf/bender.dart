import 'package:logging/logging.dart';

import 'package:bender/src/adapter/adapter.dart';

final _logger = Logger('local.dart');

BenderAdapter getConsoleAdapter() => (message) async => print(message);

BenderAdapter getLoggingAdapter() => (message) async => _logger.info(message);
