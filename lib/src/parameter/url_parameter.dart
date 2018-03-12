import 'package:meta/meta.dart';

import 'package:bender/src/parameter/parameter.dart';

class UrlParameter extends Parameter<Uri> {
  UrlParameter({
    @required String helpText,
    @required String name,
    String rawValue: '',
  })
      : super(
    helpText: helpText,
    name: name,
    rawValue: rawValue,
  );

  @override
  Uri get parsedValue => Uri.parse(rawValue.trim());

  @override
  final String typeHelpText = 'A valid URL';

  @override
  final String typeName = 'url';
}
