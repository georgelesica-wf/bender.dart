import 'package:test/test.dart';

import 'package:bender/src/parameter/pr_parameter.dart';

import 'utils.dart';

void main() {
  group('PrParameter', () {
    final param = new PrParameter();

    final goodValues = [
      'https://github.com/Company/Project/pull/1',
      'https://www.github.com/Company/Project/pull/1',
    ];

    for (var rawValue in goodValues) {
      testValue(param, rawValue, Uri.parse(rawValue));
    }

    final badValues = [
      'https://github.com/Company/Project/pulls',
      'https://github.com/Company/Project/issues',
      'https://github.com/Company/Project/issues/1',
      'http://google.com',
      'https://example.com/Company/Project/pull/1',
      'http://github.com/Company/Project/pull/1',
      'http://www.github.com/Company/Project/pull/1',
    ];

    for (var rawValue in badValues) {
      testBadValue(param, rawValue);
    }

    final extraValues = [
      'https://github.com/Company/Project/pull/1?key=value',
      'https://github.com/Company/Project/pull/1#fragment',
      'https://github.com/Company/Project/pull/1/path/segments',
    ];

    for (var rawValue in extraValues) {
      test('should parse $rawValue successfully', () {
        param.rawValue = rawValue;
        expect(param.isValueValid, isTrue);
        expect(rawValue, startsWith(param.parsedValue.toString()));
      });
    }
  });
}
