import 'dart:io';

// Intentionally vulnerable test fixture: OS command injection.
Future<void> main(List<String> args) async {
  final host = args.isNotEmpty ? args[0] : 'localhost';
  // SAST sink: untrusted input reaches a shell command.
  await Process.run('sh', ['-c', 'ping -c 1 $host']);
}
