import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

final Action rerunSkynet = new ActionImpl(
  getMessage: (context) {
    final prUrl = parameterValue<Uri>(context, 'pr-url');
    return 'rerun skynet for $prUrl';
  },
  helpText: 'Re-run Skynet on the PR',
  name: 'Re-run Skynet',
  parameters: [
    new PrParameter(),
  ],
);