import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/repo_parameter.dart';

Action getCutReleaseAction() => new ActionImpl(
      getMessage: (context) {
        final repo = parameterValue<Uri>(context, RepoParameter.parameterName);
        return 'release $repo';
      },
      helpText: 'Cut a release of the current repo',
      name: 'Cut release',
      parameters: [
        new RepoParameter(),
      ],
    );
