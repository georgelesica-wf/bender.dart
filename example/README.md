# Examples

To add an automated example test case just create two files in
this directory:

  * `<YOUR TEST NAME>_case.dart`
  * `<YOUR TEST NAME>_output.txt`

The `.dart` file must be a runnable Dart program (it must have
a `main` method). It will probably import the Bender.dart
package and do something that creates some predictable output.

The `.txt` file should contain the expected output of the
aforementioned program.

When the examples tests run they will verify that the actual
output of each program matches the expected output.