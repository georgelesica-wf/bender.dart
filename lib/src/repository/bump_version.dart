import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/pr_parameter.dart';
import 'package:bender/src/parameter/string_parameter.dart';

const String bumpParameterName = 'bump-type';

Action getBumpVersionAction() => new ActionImpl(
      getMessage: (context) {
        final prUrl = parameterValue<Uri>(context, PrParameter.parameterName);
        final bumpType = parameterValue<String>(context, bumpParameterName);
        if (bumpType == '') {
          return 'update branch $prUrl bump';
        }
        return 'update branch $prUrl bump $bumpType';
      },
      helpText: 'Bump the version and commit',
      name: 'Bump Version',
      parameters: [
        new PrParameter(),
        new StringParameter(
          choices: ['major', 'minor', 'patch'],
          helpText: 'Type of bump: major, minor, or patch',
          name: bumpParameterName,
          rawValue: 'patch',
        ),
      ],
    );
