import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

Action getBootstrapAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<Uri>(context, 'pr-url');
        return 'update branch $prUrl bootstrap';
      },
      helpText: 'Run the SDK bootstrap script and commit',
      name: 'SDK Bootstrap',
      parameters: [
        new PrParameter(),
      ],
    );
