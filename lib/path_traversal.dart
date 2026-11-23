import 'dart:io';

// Intentionally vulnerable test fixture: path traversal / arbitrary file read.
Future<String> readUserFile(String userSuppliedPath) async {
  // SAST sink: attacker-controlled path used directly.
  return File(userSuppliedPath).readAsString();
}

Future<void> main(List<String> args) async {
  if (args.isNotEmpty) print(await readUserFile(args[0]));
}
