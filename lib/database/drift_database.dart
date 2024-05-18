import 'dart:io';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import 'package:flutter_scheduler/model/schedule.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';

//아래처럼 작성후 콘솔명령으로 flutter pub run build_runner build 실행하면 아래의 g.dart파일을 자동으로 generate 함.
part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Schedules,
  ],
)

//자동으로 생성한 g.dart 파일내에 _$LocalDatabase 클래스를 상속받아서 구현함.
class LocalDatabase extends _$LocalDatabase {
  //로컬 데이터베이스의 정보를 넣어줘야함.
  LocalDatabase() : super(_openConnection());

  //select 함수에서 where 로 schDate가 watcheSchedules에 인자로 받은 datetime과 같은날만 리턴함.
  Stream<List<Schedule>> watchSchedules(DateTime date) =>
      (select(schedules)..where((tbl) => tbl.schDate.equals(date))).watch();

  //insert를 구현
  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);

  //update를 구현시에는 delete 처럼 where로 id가 동일한 경우에만 go 하도록 처리
  Future<int> removeSchedule(int id) =>
      (delete(schedules)..where((tbl) => tbl.schId.equals(id))).go();

  //스키마 변경을 인지할 수 있도록 버전 등록 필요
  @override
  int get schemaVersion => 1;
}

//연결할 데이터베이스의 위치 지정
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
