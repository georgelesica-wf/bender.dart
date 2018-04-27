import 'package:test/test.dart';

import 'package:bender/src/parameter/parameter.dart';

void testValue<T>(Parameter<T> param, String rawValue, T parsedValue,
    {Matcher parsedMatcher}) {
  test('should parse $rawValue to $parsedValue', () {
    param.rawValue = rawValue;
    expect(param.isValueValid, isTrue);
    expect(param.parsedValue, parsedMatcher ?? parsedValue);
    expect(param.rawValue, rawValue);
  });
}

void testBadValue<T>(Parameter<T> param, String rawValue) {
  test('should not parse $rawValue', () {
    param.rawValue = rawValue;
    expect(param.isValueValid, isFalse);
    expect(param.rawValue, rawValue);
  });
}
