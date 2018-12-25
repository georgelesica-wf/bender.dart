import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';
import 'package:bender/src/parameter/string_parameter.dart';

const String suffixParameterName = 'suffix';

Action getTestBranchAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<Uri>(context, PrParameter.parameterName);
        final suffix = parameterValue<String>(context, suffixParameterName);
        return 'create branch $prUrl $suffix';
      },
      helpText: 'Create a test branch for the current PR',
      name: 'Create test branch',
      parameters: [
        new PrParameter(),
        new StringParameter(
          emptyAllowed: false,
          helpText: 'Branch suffix',
          name: suffixParameterName,
        ),
      ],
    );
