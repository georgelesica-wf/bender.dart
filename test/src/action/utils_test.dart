import 'package:test/test.dart';

import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/int_parameter.dart';
import 'package:bender/src/parameter/string_parameter.dart';

import 'mock_context.dart';

void main() {
  group('parameterValue', () {
    final context = new MockContext()
      ..parameters = [
        new StringParameter(helpText: '', name: 'param0', rawValue: 'param'),
        new IntParameter(helpText: '', name: 'param1', rawValue: '10'),
      ];

    test('should return value if found', () {
      final value0 = parameterValue<String>(context, 'param0');
      expect(value0, const isInstanceOf<String>());
      expect(value0, 'param');
      final value1 = parameterValue<int>(context, 'param1');
      expect(value1, const isInstanceOf<int>());
      expect(value1, 10);
    });

    test('should throw StateError if name not found', () {
      expect(() => parameterValue<String>(context, 'fake'), throwsStateError);
    });
  });
}
