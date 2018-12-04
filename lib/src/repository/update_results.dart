import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

Action getUpdateResultsAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<String>(context, 'pr-url');
        return 'update results $prUrl';
      },
      helpText: 'Update consumer test results',
      name: 'Update Consumer Results',
      parameters: [
        new PrParameter(),
      ],
    );
