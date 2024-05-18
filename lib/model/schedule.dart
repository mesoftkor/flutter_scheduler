import 'package:drift/drift.dart';

class Schedules extends Table {
  IntColumn get schId => integer().autoIncrement()();
  TextColumn get schContent => text()();
  DateTimeColumn get schDate => dateTime()();
  IntColumn get startTime => integer()();
  IntColumn get endTime => integer()();
}
