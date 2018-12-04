import 'package:meta/meta.dart';

import 'package:bender/src/parameter/parameter.dart';

/// A parameter that represents a URL.
///
/// No validation is done beyond the validation done by the
/// [Uri.parse] function, which is very little. If more
/// is required, sub-class this type. See `PrParameter` for
/// an example of this.
class UrlParameter extends Parameter<Uri> {
  UrlParameter({
    @required String helpText,
    @required String name,
    String rawValue: '',
  }) : super(
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
