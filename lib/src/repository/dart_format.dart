import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

Action getDartFormatAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<Uri>(context, 'pr-url');
        return 'update branch $prUrl format';
      },
      helpText: 'Run Dart formatter on the PR',
      name: 'Dart Format',
      parameters: [
        new PrParameter(),
      ],
    );
