import 'package:drift/native.dart';
import 'package:psp_elaros/data/local/database.dart';

AppDatabase createTestDatabase() {
  return AppDatabase.forTesting(NativeDatabase.memory());
}
