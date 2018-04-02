import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';
import 'package:bender/src/parameter/string_parameter.dart';

final Action monitorStatus = new ActionImpl(
  getMessage: (context) {
    final prUrl = parameterValue<Uri>(context, 'pr-url');
    final service = parameterValue<String>(context, 'service');
    if (service == '') {
      return 'monitor $prUrl';
    }
    return 'monitor $prUrl $service';
  },
  helpText: 'Monitor the status of a PR or Shipyard build',
  name: 'Monitor Status (PR/Shipyard)',
  parameters: [
    new PrParameter(),
    new StringParameter(
      helpText: 'Target deploy service',
      name: 'service',
    ),
  ],
);
