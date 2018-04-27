import 'package:bender/bender_vm.dart';

void main() {
  final adapter = new LocalBenderAdapter('fake-token');
  final pubGetAction = getPubGetAction();
  setParameterValue(
      pubGetAction, 'pr-url', 'https://www.github.com/Company/Project/pull/1');
  adapter.sendMessage(pubGetAction.getMessage(pubGetAction));
}
