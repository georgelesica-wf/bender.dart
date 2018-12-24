import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

Action getRerunBuildAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<Uri>(context, 'pr-url');
        return 'rerun build for $prUrl';
      },
      helpText: 'Re-run CI build on the current PR',
      name: 'Re-run build',
      parameters: [
        new PrParameter(),
      ],
    );
