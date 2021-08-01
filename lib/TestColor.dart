import 'dart:math';

void main() {
  int ran = Random().nextInt(99999);
  print(ran);
  print("-----");
  String s = ran.toRadixString(16);
  print(s);
  print("-----");
  print(s.padLeft(6, 'F'));
  // int a = int.parse(
  //     '0xFF' + Random().nextInt(99999).toRadixString(16).padLeft(6, 'F'));
}
