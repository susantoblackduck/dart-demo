import 'dart:convert';
import 'package:crypto/crypto.dart';

// Intentionally vulnerable test fixture: weak password hashing with MD5.
String hashPassword(String password) {
  return md5.convert(utf8.encode(password)).toString();
}

void main(List<String> args) {
  final password = args.isNotEmpty ? args[0] : 'password';
  print(hashPassword(password));
}
