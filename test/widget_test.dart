// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'other_extension.dart' as ex1;

void main() {
  print('Hello World!');
  print('#90F7EC'.toColor());
  print('23'.parseInt());

  print(ex1.DateTimeExtension(DateTime.now()).toFormatString());

  123.toSay();

  // dynamic h = "78";
  // print(h.parseInt); //Class 'String' has no instance getter 'parseInt'.
}
