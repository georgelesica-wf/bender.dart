import 'package:test/test.dart';

import 'package:bender/src/parameter/bool_parameter.dart';

void main() {
  group('BoolParameter', () {
    for (var truthyValue in BoolParameter.truthyValues) {
      test('should parse to true for $truthyValue', () {
        var param = new BoolParameter(
          helpText: '',
          name: 'test-bool',
          rawValue: truthyValue,
        );

        expect(param.isValueValid, isTrue);
        expect(param.parsedValue, isTrue);
        expect(param.rawValue, truthyValue);
      });
    }

    for (var falseyValue in ['', 'false', 'no', '0']) {
      test('should parse to false for $falseyValue', () {
        var param = new BoolParameter(
          helpText: '',
          name: 'test-bool',
          rawValue: falseyValue,
        );

        expect(param.isValueValid, isTrue);
        expect(param.parsedValue, isFalse);
        expect(param.rawValue, falseyValue);
      });
    }

    test('should accept values with leading / trailing whitespace', () {
      var trueParam = new BoolParameter(
        helpText: '',
        name: 'true-bool',
        rawValue: ' true ',
      );
      expect(trueParam.parsedValue, isTrue);

      var falseParam = new BoolParameter(
        helpText: '',
        name: 'false-bool',
        rawValue: ' false ',
      );
      expect(falseParam.parsedValue, isFalse);
    });

    test('should accept values in mixed case', () {
      var trueParam = new BoolParameter(
        helpText: '',
        name: 'true-bool',
        rawValue: 'TRUE',
      );
      expect(trueParam.parsedValue, isTrue);

      var falseParam = new BoolParameter(
        helpText: '',
        name: 'false-bool',
        rawValue: 'FALSE',
      );
      expect(falseParam.parsedValue, isFalse);
    });
  });
}
