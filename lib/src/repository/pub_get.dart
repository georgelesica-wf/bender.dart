import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

final Action pubGet = new ActionImpl(
  getMessage: (context) {
    final prUrl = parameterValue<Uri>(context, 'pr-url');
    return 'update branch $prUrl get';
  },
  helpText: 'Run pub get on the PR and commit',
  name: 'Pub Get',
  parameters: [
    new PrParameter(),
  ],
);
