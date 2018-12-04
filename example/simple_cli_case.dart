import 'package:bender/bender_vm.dart';

void main() {
  final adapter = getConsoleAdapter();
  final pubGetAction = getPubGetAction();
  setParameterValue<Uri>(
    pubGetAction,
    'pr-url',
    Uri.parse('https://www.github.com/Company/Project/pull/1'),
  );
  adapter(pubGetAction.getMessage(pubGetAction));
}
