import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';
import 'package:bender/src/parameter/string_parameter.dart';

final Action deployPr = new ActionImpl(
    getMessage: (context) {
      final prUrl = parameterValue<Uri>(context, 'pr-url');
      final service = parameterValue<String>(context, 'service');
      return 'deploy $prUrl to $service';
    },
    helpText: 'Deploy the PR to a wk-dev service',
    name: 'Deploy to wk-dev',
    parameters: [
      new PrParameter(),
      new StringParameter(
        emptyAllowed: false,
        helpText: 'The name of the service to deploy to',
        name: 'service',
      ),
    ]);
