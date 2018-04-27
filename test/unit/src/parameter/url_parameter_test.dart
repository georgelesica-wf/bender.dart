import 'package:test/test.dart';

import 'package:bender/src/parameter/url_parameter.dart';

import 'utils.dart';

void main() {
  group('UrlParameter', () {
    final param = new UrlParameter(helpText: '', name: 'name');

    final goodValues = [
      'https://github.com/Company/Project/pull/1',
      'http://google.com',
      'https://google.com',
      'https://google.com/path/segments',
      ' https://google.com ',
    ];

    for (var rawValue in goodValues) {
      testValue(param, rawValue, Uri.parse(rawValue.trim()));
    }
  });
}
