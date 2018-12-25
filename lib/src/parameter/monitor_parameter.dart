import 'package:bender/src/parameter/url_parameter.dart';

final _monitorRegex = new RegExp(
    r'(https://(?:github\.com|shipyard\.workiva\.org|ci.webfilings.com|wf-skynet(-hrd)?\.appspot\.com)/.*/(?:pull|\d+))');

/// A parameter that holds a GitHub pull request URL and nothing else.
class MonitorParameter extends UrlParameter {
  static const String parameterName = 'monitor-url';

  MonitorParameter({
    String helpText: 'The URL of the job to monitor',
    String rawValue: '',
  }) : super(
          helpText: helpText,
          name: parameterName,
          rawValue: rawValue,
        );

  @override
  Uri get parsedValue {
    final uri = super.parsedValue;
    final uriString = uri.toString();

    // Truncate to just the required prefix, Bender prefers it that way.
    final matches = _monitorRegex.allMatches(uriString);

    if (matches.isEmpty) {
      throw new StateError('Invalid monitor URL: $uriString');
    }

    final monitorUriString = matches.first.group(1);

    return Uri.parse(monitorUriString);
  }

  @override
  String get typeHelpText => 'A valid monitorable URL';

  @override
  String get typeName => 'monitor';
}
