# Bender Dart

A Dart library for talking to Bender.

## Examples

Below is a very simple command line usage that will simply
print the message that would have been sent to Bender if
a different adapter had been used.

The code below can be found in `example/simple_cli.dart` and
can be run with `pub run example/simple_cli.dart`.

```dart
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
```
