import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/bool_parameter.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

final Action testConsumers = new ActionImpl(
  getMessage: (context) {
    final leaveOpen = parameterValue<bool>(context, 'leave-open');
    final prUrl = parameterValue<Uri>(context, 'pr-url');
    if (leaveOpen) {
      return 'test consumers $prUrl open';
    } else {
      return 'test consumers $prUrl';
    }
  },
  helpText: 'Run tests on consumers that will be impacted by this PR',
  name: 'Test Consumers',
  parameters: [
    new BoolParameter(
      helpText: 'Leave PR Open',
      name: 'leave-open',
    ),
    new PrParameter(),
  ],
);
