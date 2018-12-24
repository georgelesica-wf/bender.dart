import 'package:bender/src/parameter/string_parameter.dart';

final RegExp _repoRegex = new RegExp(r'https://github\.com/Workiva/([^/?]+)');

/// A parameter that holds the name of a Workiva GitHub repo.
class RepoParameter extends StringParameter {
  RepoParameter({
    String helpText: 'A Workiva repo name',
    String name: 'repo',
    String rawValue: '',
  }) : super(
          helpText: helpText,
          name: name,
          rawValue: rawValue,
        );

  @override
  String get parsedValue {
    final uriString = super.parsedValue;

    final matches = _repoRegex.allMatches(uriString);

    if (matches.isEmpty) {
      throw new StateError('Invalid repo URL: $uriString');
    }

    final repoName = matches.first.group(1);

    return repoName;
  }

  @override
  String get typeHelpText => 'A Workiva repo name';

  @override
  String get typeName => 'repo';
}
