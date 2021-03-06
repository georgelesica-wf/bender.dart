import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

Action getBootstrapAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<Uri>(context, PrParameter.parameterName);
        return 'update branch $prUrl bootstrap';
      },
      helpText: 'Run the SDK bootstrap script and commit',
      name: 'SDK bootstrap',
      parameters: [
        new PrParameter(),
      ],
    );
