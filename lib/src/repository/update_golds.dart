import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/bool_parameter.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

const String goldsParameterName = 'add-new-golds';

Action getUpdateGoldsAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<Uri>(context, PrParameter.parameterName);
        final addNewGolds = parameterValue<bool>(context, goldsParameterName);
        if (addNewGolds) {
          return 'update golds $prUrl --add-new';
        } else {
          return 'update golds $prUrl';
        }
      },
      helpText: 'Update functional test gold files',
      name: 'Update gold files',
      parameters: [
        new BoolParameter(
          helpText: 'Add new gold files',
          name: goldsParameterName,
        ),
        new PrParameter(),
      ],
    );
