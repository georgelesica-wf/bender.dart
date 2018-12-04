import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

Action getRerunSmithyAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<Uri>(context, 'pr-url');
        return 'rerun smithy for $prUrl';
      },
      helpText: 'Re-run Smithy on the PR',
      name: 'Re-run Smithy',
      parameters: [
        new PrParameter(),
      ],
    );
