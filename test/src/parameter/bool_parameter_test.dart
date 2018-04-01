import 'package:test/test.dart';

import 'package:bender/src/parameter/bool_parameter.dart';

import 'utils.dart';

BoolParameter getParameter(String rawValue) =>
    new BoolParameter(helpText: '', name: 'name', rawValue: rawValue);

void main() {
  group('BoolParameter', () {
    final param = new BoolParameter(helpText: '', name: 'name');

    for (var rawValue in BoolParameter.truthyValues) {
      testValue(param, rawValue, true);
    }

    for (var rawValue in [' true', 'true ', 'TRUE', 'True']) {
      testValue(param, rawValue, true);
    }

    for (var rawValue in ['', 'false', 'no', '0']) {
      testValue(param, rawValue, false);
    }

    for (var rawValue in [' false', 'false ', 'FALSE', 'False']) {
      testValue(param, rawValue, false);
    }
  });
}
