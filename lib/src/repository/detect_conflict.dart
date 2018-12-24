import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

Action getDetectConflictAction() => new ActionImpl(
        getMessage: (context) {
          final prUrl = parameterValue<Uri>(context, 'pr-url');
          return 'detect conflict $prUrl';
        },
        helpText: 'Detect file conflicts in PR',
        name: 'Detect conflicts',
        parameters: [
          new PrParameter(),
        ]);
