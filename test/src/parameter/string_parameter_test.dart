import 'package:test/test.dart';

import 'package:bender/src/parameter/string_parameter.dart';

import 'utils.dart';

void main() {
  group('StringParameter', () {
    final param = new StringParameter(helpText: '', name: 'name');

    for (var rawValue in ['a', ' a', 'a ', ' a ', '']) {
      testValue(param, rawValue, rawValue.trim());
    }

    group('should enforce choices when', () {
      test('emptyAllowed = true', () {
        final param = new StringParameter(
            helpText: '',
            name: 'name',
            emptyAllowed: true,
            choices: ['a', 'b']);

        expect(param.rawValue, '');
        expect(param.isValueValid, isTrue);

        param.rawValue = 'a';
        expect(param.isValueValid, isTrue);
        expect(param.parsedValue, 'a');

        param.rawValue = ' a ';
        expect(param.isValueValid, isTrue);
        expect(param.parsedValue, 'a');

        param.rawValue = 'b';
        expect(param.isValueValid, isTrue);
        expect(param.parsedValue, 'b');

        param.rawValue = 'c';
        expect(param.isValueValid, isFalse);
      });

      test('emptyAllowed = false', () {
        final param = new StringParameter(
            helpText: '',
            name: 'name',
            emptyAllowed: false,
            choices: ['a', 'b']);

        expect(param.rawValue, '');
        expect(param.isValueValid, isFalse);

        param.rawValue = 'a';
        expect(param.isValueValid, isTrue);
        expect(param.parsedValue, 'a');

        param.rawValue = ' a ';
        expect(param.isValueValid, isTrue);
        expect(param.parsedValue, 'a');

        param.rawValue = 'b';
        expect(param.isValueValid, isTrue);
        expect(param.parsedValue, 'b');

        param.rawValue = 'c';
        expect(param.isValueValid, isFalse);
      });
    });

    test('should enforce emptyAllowed = false', () {
      final param =
          new StringParameter(helpText: '', name: 'name', emptyAllowed: false);

      expect(param.rawValue, '');
      expect(param.isValueValid, isFalse);
    });
  });
}
