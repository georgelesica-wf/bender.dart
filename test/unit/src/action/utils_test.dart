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

  group('setParameterTypedValue', () {
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
      setParameterTypedValue(context, 'param0', 'new value');
      expect(context.parameters[0].rawValue, 'new value');

      setParameterTypedValue(context, 'param1', 5);
      expect(context.parameters[1].rawValue, '5');
    });

    // Skipped until method type parameters are reified
    test('should throw StateError on incorrect value type', () {
      expect(() => setParameterTypedValue<String>(context, 'param1', '5'), throwsStateError);
    }, skip: true);

    test('should throw StateError if name not found', () {
      expect(() => setParameterTypedValue(context, 'fake', 'value'), throwsStateError);
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

      setParameterValue(context, 'param1', '5');
      expect(context.parameters[1].rawValue, '5');
    });

    test('should throw StateError if name not found', () {
      expect(() => setParameterValue(context, 'fake', 'value'), throwsStateError);
    });
  });
}
