import 'package:bender/src/parameter/string_parameter.dart';

final RegExp _branchRegex =
    new RegExp(r'https://github\.com/Workiva/([^/?]+)/compare/([^/?]+)');

/// A parameter that holds a Workiva repo and branch name.
class BranchParameter extends StringParameter {
  BranchParameter({
    String helpText: 'A repo and branch name',
    String name: 'branch',
    String rawValue: '',
  }) : super(
          helpText: helpText,
          name: name,
          rawValue: rawValue,
        );

  @override
  String get parsedValue {
    final uriString = super.parsedValue;

    final matches = _branchRegex.allMatches(uriString);

    if (matches.isEmpty) {
      throw new StateError('Invalid branch URL: $uriString');
    }

    final repoName = matches.first.group(1);
    final branchName = matches.first.group(2);

    return '$repoName/$branchName';
  }

  @override
  String get typeHelpText => 'A repo and branch name, separated by "/"';

  @override
  String get typeName => 'branch';
}
