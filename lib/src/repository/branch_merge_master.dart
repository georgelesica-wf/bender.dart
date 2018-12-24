import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/branch_parameter.dart';

Action getBranchMergeMasterAction() => new ActionImpl(
      getMessage: (context) {
        final branch = parameterValue<Uri>(context, 'branch');
        return 'update branch $branch merge';
      },
      helpText: 'Merge master branch into the current branch',
      name: 'Merge master into branch',
      parameters: [
        new BranchParameter(),
      ],
    );
