# Bender Dart

A Dart library for talking to Bender.

## Examples

Below is a very simple command line usage that will simply
print the message that would have been sent to Bender if
a real adapter was used.

The code below can be found in `example/simple_cli.dart` and
can be run with `pub run example/simple_cli.dart`.

```dart
import 'package:bender/bender_vm.dart';

void main() {
    final adapter = new LocalBenderAdapter('fake-token');
    setParameterValue(pubGet, 'pr-url', 'https://www.github.com/Company/Project/pull/1');
    adapter.sendMessage(pubGet.getMessage(pubGet));
}
```
