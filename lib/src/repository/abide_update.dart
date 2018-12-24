import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

Action getAbideUpdateAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<Uri>(context, 'pr-url');
        return 'abide update $prUrl';
      },
      helpText: 'Run Abide against the current PR',
      name: 'Abide update',
      parameters: [
        new PrParameter(),
      ],
    );
