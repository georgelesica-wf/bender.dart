import 'package:bender/src/action/action.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

final Action mergeMaster = new ActionImpl(
  getMessage: (context) {
    var url = context.parameters.firstWhere((param) => param.name == 'pr-url');
    return 'update branch ${url.parsedValue} merge';
  },
  helpText: 'Merge master branch into the PR branch',
  name: 'Merge Master',
  parameters: [
    new PrParameter(
      helpText: 'The URL of the PR to act upon',
      name: 'pr-url',
    ),
  ],
);
