import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';
import 'package:bender/src/parameter/string_parameter.dart';

Action getTestBranchAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<Uri>(context, 'pr-url');
        final suffix = parameterValue<String>(context, 'suffix');
        return 'create branch $prUrl $suffix';
      },
      helpText: 'Create a test branch for the current PR',
      name: 'Create test branch',
      parameters: [
        new PrParameter(),
        new StringParameter(
          emptyAllowed: false,
          helpText: 'Branch suffix',
          name: 'suffix',
        ),
      ],
    );
