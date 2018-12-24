import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

Action getTestConsumersAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<Uri>(context, 'pr-url');
        return 'test consumers $prUrl';
      },
      helpText: 'Run tests on consumers that will be impacted by this PR',
      name: 'Test Consumers',
      parameters: [
        new PrParameter(),
      ],
    );
