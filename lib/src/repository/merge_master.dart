import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

Action getMergeMasterAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<Uri>(context, PrParameter.parameterName);
        return 'update branch $prUrl merge';
      },
      helpText: 'Merge master branch into the PR branch',
      name: 'Merge master into PR',
      parameters: [
        new PrParameter(),
      ],
    );
