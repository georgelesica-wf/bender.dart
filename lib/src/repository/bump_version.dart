import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';
import 'package:bender/src/parameter/string_parameter.dart';

Action getBumpVersionAction() => new ActionImpl(
      getMessage: (context) {
        final bumpType = parameterValue<String>(context, 'bump-type');
        final prUrl = parameterValue<Uri>(context, 'pr-url');
        if (bumpType == '') {
          return 'update branch $prUrl bump';
        }
        return 'update branch $prUrl bump $bumpType';
      },
      helpText: 'Bump the version and commit',
      name: 'Bump Version',
      parameters: [
        new StringParameter(
          choices: ['major', 'minor', 'patch'],
          helpText: 'Type of bump: major, minor, or patch',
          name: 'bump-type',
          rawValue: 'patch',
        ),
        new PrParameter(),
      ],
    );
