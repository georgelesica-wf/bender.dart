import 'package:bender/bender_vm.dart';

void main() async {
  final adapter = getConsoleAdapter();
  final pubGetAction = getPubGetAction();
  setParameterValue<Uri>(
    pubGetAction,
    PrParameter.parameterName,
    Uri.parse('https://www.github.com/Company/Project/pull/1'),
  );
  await adapter(pubGetAction.message);
}
