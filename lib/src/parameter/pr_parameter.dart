import 'package:bender/src/parameter/url_parameter.dart';

final _prRegex = new RegExp(r'(https://(www\.)?github\.com/.+/.+/pull/\d+).*');

/// A parameter that holds a GitHub pull request URL and nothing else.
class PrParameter extends UrlParameter {
  PrParameter({
    String helpText: 'The URL of the PR to act upon',
    String name: 'pr-url',
    String rawValue: '',
  })
      : super(
          helpText: helpText,
          name: name,
          rawValue: rawValue,
        );

  @override
  Uri get parsedValue {
    final uri = super.parsedValue;
    final uriString = uri.toString();

    // Truncate to just the required prefix, Bender prefers it that way.
    final matches = _prRegex.allMatches(uriString);

    if (matches.isEmpty) {
      throw new StateError('Invalid PR URL: $uriString');
    }

    final prUriString = matches.first.group(1);

    return Uri.parse(prUriString);
  }

  @override
  String get typeHelpText => 'A valid pull request URL';

  @override
  String get typeName => 'pr';
}
