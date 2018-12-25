import 'package:test/test.dart';

import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/int_parameter.dart';
import 'package:bender/src/parameter/string_parameter.dart';

import 'mock_context.dart';

void main() {
  group('allParametersAreValid', () {
    final context = new MockContext()
      ..parameters = [
        new StringParameter(helpText: '', name: 'param0', rawValue: 'param'),
        new IntParameter(helpText: '', name: 'param1', rawValue: '10'),
      ];

    test('should return true when parameters are valid', () {
      expect(context.parameters[0].isValueValid, isTrue);
      expect(context.parameters[1].isValueValid, isTrue);
      expect(allParametersAreValid(context), isTrue);
    });

    test('should return false when parameters are invalid', () {
      context.parameters[1].rawValue = 'not an int';
      expect(context.parameters[0].isValueValid, isTrue);
      expect(context.parameters[1].isValueValid, isFalse);
      expect(allParametersAreValid(context), isFalse);
    });
  });

  group('parameterValue', () {
    final context = new MockContext()
      ..parameters = [
        new StringParameter(helpText: '', name: 'param0', rawValue: 'param'),
        new IntParameter(helpText: '', name: 'param1', rawValue: '10'),
      ];

    test('should return value if found', () {
      final value0 = parameterValue<String>(context, 'param0');
      expect(value0, const TypeMatcher<String>());
      expect(value0, 'param');
      final value1 = parameterValue<int>(context, 'param1');
      expect(value1, const TypeMatcher<int>());
      expect(value1, 10);
    });

    test('should throw ArgumentError on incorrect value type', () {
      expect(
          () => parameterValue<String>(context, 'param1'), throwsArgumentError);
    });

    test('should not throw and return null if name not found', () {
      expect(() => parameterValue<String>(context, 'fake'), returnsNormally);
      expect(parameterValue<String>(context, 'fake'), isNull);
    });
  });

  group('setParameterValue', () {
    final context = new MockContext()
      ..parameters = [
        new StringParameter(helpText: '', name: 'param0', rawValue: 'param'),
        new IntParameter(helpText: '', name: 'param1', rawValue: '10'),
      ];

    setUp(() {
      context.parameters[0].rawValue = 'param';
      context.parameters[1].rawValue = '10';
    });

    test('should set parameter value based on name', () {
      setParameterValue(context, 'param0', 'new value');
      expect(context.parameters[0].rawValue, 'new value');

      setParameterValue(context, 'param1', 5);
      expect(context.parameters[1].rawValue, '5');
    });

    test('should throw ArgumentError on incorrect value type', () {
      expect(() => setParameterValue<String>(context, 'param1', '5'),
          throwsArgumentError);
    });

    test('should not throw if name not found', () {
      expect(
          () => setParameterValue(context, 'fake', 'value'), returnsNormally);
    });
  });
}
