// Intentionally vulnerable test fixture: SQL injection.
class FakeDatabase {
  Future<void> rawQuery(String sql) async => print(sql);
}

Future<void> findUser(FakeDatabase db, String userInput) async {
  // SAST sink: SQL statement constructed directly from untrusted input.
  final sql = "SELECT * FROM users WHERE username = '$userInput'";
  await db.rawQuery(sql);
}

Future<void> main(List<String> args) async {
  await findUser(FakeDatabase(), args.isNotEmpty ? args[0] : 'guest');
}
