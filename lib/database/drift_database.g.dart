// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $SchedulesTable extends Schedules
    with TableInfo<$SchedulesTable, Schedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _schIdMeta = const VerificationMeta('schId');
  @override
  late final GeneratedColumn<int> schId = GeneratedColumn<int>(
      'sch_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _schContentMeta =
      const VerificationMeta('schContent');
  @override
  late final GeneratedColumn<String> schContent = GeneratedColumn<String>(
      'sch_content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _schDateMeta =
      const VerificationMeta('schDate');
  @override
  late final GeneratedColumn<DateTime> schDate = GeneratedColumn<DateTime>(
      'sch_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<int> startTime = GeneratedColumn<int>(
      'start_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<int> endTime = GeneratedColumn<int>(
      'end_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [schId, schContent, schDate, startTime, endTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedules';
  @override
  VerificationContext validateIntegrity(Insertable<Schedule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('sch_id')) {
      context.handle(
          _schIdMeta, schId.isAcceptableOrUnknown(data['sch_id']!, _schIdMeta));
    }
    if (data.containsKey('sch_content')) {
      context.handle(
          _schContentMeta,
          schContent.isAcceptableOrUnknown(
              data['sch_content']!, _schContentMeta));
    } else if (isInserting) {
      context.missing(_schContentMeta);
    }
    if (data.containsKey('sch_date')) {
      context.handle(_schDateMeta,
          schDate.isAcceptableOrUnknown(data['sch_date']!, _schDateMeta));
    } else if (isInserting) {
      context.missing(_schDateMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {schId};
  @override
  Schedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Schedule(
      schId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sch_id'])!,
      schContent: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sch_content'])!,
      schDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}sch_date'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}end_time'])!,
    );
  }

  @override
  $SchedulesTable createAlias(String alias) {
    return $SchedulesTable(attachedDatabase, alias);
  }
}

class Schedule extends DataClass implements Insertable<Schedule> {
  final int schId;
  final String schContent;
  final DateTime schDate;
  final int startTime;
  final int endTime;
  const Schedule(
      {required this.schId,
      required this.schContent,
      required this.schDate,
      required this.startTime,
      required this.endTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['sch_id'] = Variable<int>(schId);
    map['sch_content'] = Variable<String>(schContent);
    map['sch_date'] = Variable<DateTime>(schDate);
    map['start_time'] = Variable<int>(startTime);
    map['end_time'] = Variable<int>(endTime);
    return map;
  }

  SchedulesCompanion toCompanion(bool nullToAbsent) {
    return SchedulesCompanion(
      schId: Value(schId),
      schContent: Value(schContent),
      schDate: Value(schDate),
      startTime: Value(startTime),
      endTime: Value(endTime),
    );
  }

  factory Schedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Schedule(
      schId: serializer.fromJson<int>(json['schId']),
      schContent: serializer.fromJson<String>(json['schContent']),
      schDate: serializer.fromJson<DateTime>(json['schDate']),
      startTime: serializer.fromJson<int>(json['startTime']),
      endTime: serializer.fromJson<int>(json['endTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'schId': serializer.toJson<int>(schId),
      'schContent': serializer.toJson<String>(schContent),
      'schDate': serializer.toJson<DateTime>(schDate),
      'startTime': serializer.toJson<int>(startTime),
      'endTime': serializer.toJson<int>(endTime),
    };
  }

  Schedule copyWith(
          {int? schId,
          String? schContent,
          DateTime? schDate,
          int? startTime,
          int? endTime}) =>
      Schedule(
        schId: schId ?? this.schId,
        schContent: schContent ?? this.schContent,
        schDate: schDate ?? this.schDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
      );
  @override
  String toString() {
    return (StringBuffer('Schedule(')
          ..write('schId: $schId, ')
          ..write('schContent: $schContent, ')
          ..write('schDate: $schDate, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(schId, schContent, schDate, startTime, endTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Schedule &&
          other.schId == this.schId &&
          other.schContent == this.schContent &&
          other.schDate == this.schDate &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime);
}

class SchedulesCompanion extends UpdateCompanion<Schedule> {
  final Value<int> schId;
  final Value<String> schContent;
  final Value<DateTime> schDate;
  final Value<int> startTime;
  final Value<int> endTime;
  const SchedulesCompanion({
    this.schId = const Value.absent(),
    this.schContent = const Value.absent(),
    this.schDate = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
  });
  SchedulesCompanion.insert({
    this.schId = const Value.absent(),
    required String schContent,
    required DateTime schDate,
    required int startTime,
    required int endTime,
  })  : schContent = Value(schContent),
        schDate = Value(schDate),
        startTime = Value(startTime),
        endTime = Value(endTime);
  static Insertable<Schedule> custom({
    Expression<int>? schId,
    Expression<String>? schContent,
    Expression<DateTime>? schDate,
    Expression<int>? startTime,
    Expression<int>? endTime,
  }) {
    return RawValuesInsertable({
      if (schId != null) 'sch_id': schId,
      if (schContent != null) 'sch_content': schContent,
      if (schDate != null) 'sch_date': schDate,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
    });
  }

  SchedulesCompanion copyWith(
      {Value<int>? schId,
      Value<String>? schContent,
      Value<DateTime>? schDate,
      Value<int>? startTime,
      Value<int>? endTime}) {
    return SchedulesCompanion(
      schId: schId ?? this.schId,
      schContent: schContent ?? this.schContent,
      schDate: schDate ?? this.schDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (schId.present) {
      map['sch_id'] = Variable<int>(schId.value);
    }
    if (schContent.present) {
      map['sch_content'] = Variable<String>(schContent.value);
    }
    if (schDate.present) {
      map['sch_date'] = Variable<DateTime>(schDate.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<int>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<int>(endTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesCompanion(')
          ..write('schId: $schId, ')
          ..write('schContent: $schContent, ')
          ..write('schDate: $schDate, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  _$LocalDatabaseManager get managers => _$LocalDatabaseManager(this);
  late final $SchedulesTable schedules = $SchedulesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [schedules];
}

typedef $$SchedulesTableInsertCompanionBuilder = SchedulesCompanion Function({
  Value<int> schId,
  required String schContent,
  required DateTime schDate,
  required int startTime,
  required int endTime,
});
typedef $$SchedulesTableUpdateCompanionBuilder = SchedulesCompanion Function({
  Value<int> schId,
  Value<String> schContent,
  Value<DateTime> schDate,
  Value<int> startTime,
  Value<int> endTime,
});

class $$SchedulesTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $SchedulesTable,
    Schedule,
    $$SchedulesTableFilterComposer,
    $$SchedulesTableOrderingComposer,
    $$SchedulesTableProcessedTableManager,
    $$SchedulesTableInsertCompanionBuilder,
    $$SchedulesTableUpdateCompanionBuilder> {
  $$SchedulesTableTableManager(_$LocalDatabase db, $SchedulesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$SchedulesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$SchedulesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$SchedulesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> schId = const Value.absent(),
            Value<String> schContent = const Value.absent(),
            Value<DateTime> schDate = const Value.absent(),
            Value<int> startTime = const Value.absent(),
            Value<int> endTime = const Value.absent(),
          }) =>
              SchedulesCompanion(
            schId: schId,
            schContent: schContent,
            schDate: schDate,
            startTime: startTime,
            endTime: endTime,
          ),
          getInsertCompanionBuilder: ({
            Value<int> schId = const Value.absent(),
            required String schContent,
            required DateTime schDate,
            required int startTime,
            required int endTime,
          }) =>
              SchedulesCompanion.insert(
            schId: schId,
            schContent: schContent,
            schDate: schDate,
            startTime: startTime,
            endTime: endTime,
          ),
        ));
}

class $$SchedulesTableProcessedTableManager extends ProcessedTableManager<
    _$LocalDatabase,
    $SchedulesTable,
    Schedule,
    $$SchedulesTableFilterComposer,
    $$SchedulesTableOrderingComposer,
    $$SchedulesTableProcessedTableManager,
    $$SchedulesTableInsertCompanionBuilder,
    $$SchedulesTableUpdateCompanionBuilder> {
  $$SchedulesTableProcessedTableManager(super.$state);
}

class $$SchedulesTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $SchedulesTable> {
  $$SchedulesTableFilterComposer(super.$state);
  ColumnFilters<int> get schId => $state.composableBuilder(
      column: $state.table.schId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get schContent => $state.composableBuilder(
      column: $state.table.schContent,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get schDate => $state.composableBuilder(
      column: $state.table.schDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$SchedulesTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $SchedulesTable> {
  $$SchedulesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get schId => $state.composableBuilder(
      column: $state.table.schId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get schContent => $state.composableBuilder(
      column: $state.table.schContent,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get schDate => $state.composableBuilder(
      column: $state.table.schDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$LocalDatabaseManager {
  final _$LocalDatabase _db;
  _$LocalDatabaseManager(this._db);
  $$SchedulesTableTableManager get schedules =>
      $$SchedulesTableTableManager(_db, _db.schedules);
}
