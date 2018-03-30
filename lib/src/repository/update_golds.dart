import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/bool_parameter.dart';
import 'package:bender/src/parameter/pr_parameter.dart';

final Action updateGolds = new ActionImpl(
  getMessage: (context) {
    final prUrl = parameterValue<Uri>(context, 'pr-url');
    final addNewGolds = parameterValue<bool>(context, 'add-new-golds');
    if (addNewGolds) {
      return 'update golds $prUrl --add-new';
    } else {
      return 'update golds $prUrl';
    }
  },
  helpText: 'Update functional test gold files',
  name: 'Update Gold Files',
  parameters: [
    new BoolParameter(
      helpText: 'Add new gold files',
      name: 'add-new-golds',
    ),
    new PrParameter(),
  ],
);
