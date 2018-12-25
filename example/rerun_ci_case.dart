import 'package:bender/bender_vm.dart';

void main() async {
  final adapter = getConsoleAdapter();
  final rerunBuildAction = getRerunBuildAction();
  setParameterValue<Uri>(
    rerunBuildAction,
    PrParameter.parameterName,
    Uri.parse('https://www.github.com/Company/Project/pull/1'),
  );
  await adapter(rerunBuildAction.message);
}
