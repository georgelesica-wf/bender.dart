import 'package:bender/src/action/action.dart';
import 'package:bender/src/action/utils.dart';
import 'package:bender/src/parameter/repo_parameter.dart';

Action getUpdateDartDepsAction() => new ActionImpl(
      getMessage: (context) {
        final repo = parameterValue<Uri>(context, 'repo');
        return 'pub update $repo';
      },
      helpText: 'Update Dart dependencies for the current repo',
      name: 'Update Dart dependencies',
      parameters: [
        new RepoParameter(),
      ],
    );
