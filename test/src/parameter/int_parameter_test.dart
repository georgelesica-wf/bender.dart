import 'package:test/test.dart';

import 'package:bender/src/parameter/int_parameter.dart';

import 'utils.dart';

void main() {
  group('IntParameter', () {
    final param = new IntParameter(helpText: '', name: 'name');

    for (var rawValue in ['-1', '0', '1', '0x1', ' 1', '1 ', ' 1 ']) {
      testValue(param, rawValue, int.parse(rawValue));
    }

    for (var rawValue in ['a', '', '1.5']) {
      testBadValue(param, rawValue);
    }
  });
}
