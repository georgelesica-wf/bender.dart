import 'package:meta/meta.dart';

import 'package:bender/src/parameter/url_parameter.dart';

final _prRegex = new RegExp(r'(https://github\.com/.+/.+/pull/\d+).*');

class PrParameter extends UrlParameter {
  PrParameter({
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
  Uri get parsedValue {
    var uri = super.parsedValue;
    var uriString = uri.toString();

    // Truncate to just the required prefix, Bender prefers it that way.
    var prUriString = _prRegex.allMatches(uriString)?.first?.group(1);

    if (prUriString == null) {
      throw new StateError('Invalid PR URL: ${uriString}');
    }

    return Uri.parse(prUriString);
  }

  @override
  final String typeHelpText = 'A valid pull request URL';

  @override
  final String typeName = 'pr';
}
