import 'package:bender/bender_vm.dart';

void main() {
  final adapter = new LocalBenderAdapter('fake-token');
  setParameterValue(
      pubGet, 'pr-url', 'https://www.github.com/Company/Project/pull/1');
  adapter.sendMessage(pubGet.getMessage(pubGet));
}
