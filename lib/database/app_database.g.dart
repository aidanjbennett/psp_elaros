// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TimestampsTable extends Timestamps
    with TableInfo<$TimestampsTable, Timestamp> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimestampsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lastModifiedTimeMeta = const VerificationMeta(
    'lastModifiedTime',
  );
  @override
  late final GeneratedColumn<DateTime> lastModifiedTime =
      GeneratedColumn<DateTime>(
        'last_modified_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _timestampIdMeta = const VerificationMeta(
    'timestampId',
  );
  @override
  late final GeneratedColumn<int> timestampId = GeneratedColumn<int>(
    'timestamp_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [lastModifiedTime, timestampId, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timestamps';
  @override
  VerificationContext validateIntegrity(
    Insertable<Timestamp> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('last_modified_time')) {
      context.handle(
        _lastModifiedTimeMeta,
        lastModifiedTime.isAcceptableOrUnknown(
          data['last_modified_time']!,
          _lastModifiedTimeMeta,
        ),
      );
    }
    if (data.containsKey('timestamp_id')) {
      context.handle(
        _timestampIdMeta,
        timestampId.isAcceptableOrUnknown(
          data['timestamp_id']!,
          _timestampIdMeta,
        ),
      );
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {timestampId};
  @override
  Timestamp map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Timestamp(
      lastModifiedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_time'],
      )!,
      timestampId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
    );
  }

  @override
  $TimestampsTable createAlias(String alias) {
    return $TimestampsTable(attachedDatabase, alias);
  }
}

class Timestamp extends DataClass implements Insertable<Timestamp> {
  final DateTime lastModifiedTime;
  final int timestampId;
  final DateTime date;
  const Timestamp({
    required this.lastModifiedTime,
    required this.timestampId,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['timestamp_id'] = Variable<int>(timestampId);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  TimestampsCompanion toCompanion(bool nullToAbsent) {
    return TimestampsCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      timestampId: Value(timestampId),
      date: Value(date),
    );
  }

  factory Timestamp.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Timestamp(
      lastModifiedTime: serializer.fromJson<DateTime>(json['lastModifiedTime']),
      timestampId: serializer.fromJson<int>(json['timestampId']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'timestampId': serializer.toJson<int>(timestampId),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Timestamp copyWith({
    DateTime? lastModifiedTime,
    int? timestampId,
    DateTime? date,
  }) => Timestamp(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    timestampId: timestampId ?? this.timestampId,
    date: date ?? this.date,
  );
  Timestamp copyWithCompanion(TimestampsCompanion data) {
    return Timestamp(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      timestampId: data.timestampId.present
          ? data.timestampId.value
          : this.timestampId,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Timestamp(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('timestampId: $timestampId, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(lastModifiedTime, timestampId, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Timestamp &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.timestampId == this.timestampId &&
          other.date == this.date);
}

class TimestampsCompanion extends UpdateCompanion<Timestamp> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> timestampId;
  final Value<DateTime> date;
  const TimestampsCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.timestampId = const Value.absent(),
    this.date = const Value.absent(),
  });
  TimestampsCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.timestampId = const Value.absent(),
    required DateTime date,
  }) : date = Value(date);
  static Insertable<Timestamp> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? timestampId,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (timestampId != null) 'timestamp_id': timestampId,
      if (date != null) 'date': date,
    });
  }

  TimestampsCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? timestampId,
    Value<DateTime>? date,
  }) {
    return TimestampsCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      timestampId: timestampId ?? this.timestampId,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastModifiedTime.present) {
      map['last_modified_time'] = Variable<DateTime>(lastModifiedTime.value);
    }
    if (timestampId.present) {
      map['timestamp_id'] = Variable<int>(timestampId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimestampsCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('timestampId: $timestampId, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $NotificationsTable extends Notifications
    with TableInfo<$NotificationsTable, Notification> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lastModifiedTimeMeta = const VerificationMeta(
    'lastModifiedTime',
  );
  @override
  late final GeneratedColumn<DateTime> lastModifiedTime =
      GeneratedColumn<DateTime>(
        'last_modified_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _notificationIdMeta = const VerificationMeta(
    'notificationId',
  );
  @override
  late final GeneratedColumn<int> notificationId = GeneratedColumn<int>(
    'notification_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _notifHeaderMeta = const VerificationMeta(
    'notifHeader',
  );
  @override
  late final GeneratedColumn<String> notifHeader = GeneratedColumn<String>(
    'notif_header',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notifBodyMeta = const VerificationMeta(
    'notifBody',
  );
  @override
  late final GeneratedColumn<String> notifBody = GeneratedColumn<String>(
    'notif_body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampIdMeta = const VerificationMeta(
    'timestampId',
  );
  @override
  late final GeneratedColumn<int> timestampId = GeneratedColumn<int>(
    'timestamp_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timestamps (timestamp_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    lastModifiedTime,
    notificationId,
    notifHeader,
    notifBody,
    timestampId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notifications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Notification> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('last_modified_time')) {
      context.handle(
        _lastModifiedTimeMeta,
        lastModifiedTime.isAcceptableOrUnknown(
          data['last_modified_time']!,
          _lastModifiedTimeMeta,
        ),
      );
    }
    if (data.containsKey('notification_id')) {
      context.handle(
        _notificationIdMeta,
        notificationId.isAcceptableOrUnknown(
          data['notification_id']!,
          _notificationIdMeta,
        ),
      );
    }
    if (data.containsKey('notif_header')) {
      context.handle(
        _notifHeaderMeta,
        notifHeader.isAcceptableOrUnknown(
          data['notif_header']!,
          _notifHeaderMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notifHeaderMeta);
    }
    if (data.containsKey('notif_body')) {
      context.handle(
        _notifBodyMeta,
        notifBody.isAcceptableOrUnknown(data['notif_body']!, _notifBodyMeta),
      );
    } else if (isInserting) {
      context.missing(_notifBodyMeta);
    }
    if (data.containsKey('timestamp_id')) {
      context.handle(
        _timestampIdMeta,
        timestampId.isAcceptableOrUnknown(
          data['timestamp_id']!,
          _timestampIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_timestampIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {notificationId};
  @override
  Notification map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Notification(
      lastModifiedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_time'],
      )!,
      notificationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}notification_id'],
      )!,
      notifHeader: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notif_header'],
      )!,
      notifBody: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notif_body'],
      )!,
      timestampId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp_id'],
      )!,
    );
  }

  @override
  $NotificationsTable createAlias(String alias) {
    return $NotificationsTable(attachedDatabase, alias);
  }
}

class Notification extends DataClass implements Insertable<Notification> {
  final DateTime lastModifiedTime;
  final int notificationId;
  final String notifHeader;
  final String notifBody;
  final int timestampId;
  const Notification({
    required this.lastModifiedTime,
    required this.notificationId,
    required this.notifHeader,
    required this.notifBody,
    required this.timestampId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['notification_id'] = Variable<int>(notificationId);
    map['notif_header'] = Variable<String>(notifHeader);
    map['notif_body'] = Variable<String>(notifBody);
    map['timestamp_id'] = Variable<int>(timestampId);
    return map;
  }

  NotificationsCompanion toCompanion(bool nullToAbsent) {
    return NotificationsCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      notificationId: Value(notificationId),
      notifHeader: Value(notifHeader),
      notifBody: Value(notifBody),
      timestampId: Value(timestampId),
    );
  }

  factory Notification.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Notification(
      lastModifiedTime: serializer.fromJson<DateTime>(json['lastModifiedTime']),
      notificationId: serializer.fromJson<int>(json['notificationId']),
      notifHeader: serializer.fromJson<String>(json['notifHeader']),
      notifBody: serializer.fromJson<String>(json['notifBody']),
      timestampId: serializer.fromJson<int>(json['timestampId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'notificationId': serializer.toJson<int>(notificationId),
      'notifHeader': serializer.toJson<String>(notifHeader),
      'notifBody': serializer.toJson<String>(notifBody),
      'timestampId': serializer.toJson<int>(timestampId),
    };
  }

  Notification copyWith({
    DateTime? lastModifiedTime,
    int? notificationId,
    String? notifHeader,
    String? notifBody,
    int? timestampId,
  }) => Notification(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    notificationId: notificationId ?? this.notificationId,
    notifHeader: notifHeader ?? this.notifHeader,
    notifBody: notifBody ?? this.notifBody,
    timestampId: timestampId ?? this.timestampId,
  );
  Notification copyWithCompanion(NotificationsCompanion data) {
    return Notification(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      notificationId: data.notificationId.present
          ? data.notificationId.value
          : this.notificationId,
      notifHeader: data.notifHeader.present
          ? data.notifHeader.value
          : this.notifHeader,
      notifBody: data.notifBody.present ? data.notifBody.value : this.notifBody,
      timestampId: data.timestampId.present
          ? data.timestampId.value
          : this.timestampId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Notification(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('notificationId: $notificationId, ')
          ..write('notifHeader: $notifHeader, ')
          ..write('notifBody: $notifBody, ')
          ..write('timestampId: $timestampId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    lastModifiedTime,
    notificationId,
    notifHeader,
    notifBody,
    timestampId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Notification &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.notificationId == this.notificationId &&
          other.notifHeader == this.notifHeader &&
          other.notifBody == this.notifBody &&
          other.timestampId == this.timestampId);
}

class NotificationsCompanion extends UpdateCompanion<Notification> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> notificationId;
  final Value<String> notifHeader;
  final Value<String> notifBody;
  final Value<int> timestampId;
  const NotificationsCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.notifHeader = const Value.absent(),
    this.notifBody = const Value.absent(),
    this.timestampId = const Value.absent(),
  });
  NotificationsCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.notificationId = const Value.absent(),
    required String notifHeader,
    required String notifBody,
    required int timestampId,
  }) : notifHeader = Value(notifHeader),
       notifBody = Value(notifBody),
       timestampId = Value(timestampId);
  static Insertable<Notification> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? notificationId,
    Expression<String>? notifHeader,
    Expression<String>? notifBody,
    Expression<int>? timestampId,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (notificationId != null) 'notification_id': notificationId,
      if (notifHeader != null) 'notif_header': notifHeader,
      if (notifBody != null) 'notif_body': notifBody,
      if (timestampId != null) 'timestamp_id': timestampId,
    });
  }

  NotificationsCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? notificationId,
    Value<String>? notifHeader,
    Value<String>? notifBody,
    Value<int>? timestampId,
  }) {
    return NotificationsCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      notificationId: notificationId ?? this.notificationId,
      notifHeader: notifHeader ?? this.notifHeader,
      notifBody: notifBody ?? this.notifBody,
      timestampId: timestampId ?? this.timestampId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastModifiedTime.present) {
      map['last_modified_time'] = Variable<DateTime>(lastModifiedTime.value);
    }
    if (notificationId.present) {
      map['notification_id'] = Variable<int>(notificationId.value);
    }
    if (notifHeader.present) {
      map['notif_header'] = Variable<String>(notifHeader.value);
    }
    if (notifBody.present) {
      map['notif_body'] = Variable<String>(notifBody.value);
    }
    if (timestampId.present) {
      map['timestamp_id'] = Variable<int>(timestampId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationsCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('notificationId: $notificationId, ')
          ..write('notifHeader: $notifHeader, ')
          ..write('notifBody: $notifBody, ')
          ..write('timestampId: $timestampId')
          ..write(')'))
        .toString();
  }
}

class $SleepTable extends Sleep with TableInfo<$SleepTable, SleepData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SleepTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lastModifiedTimeMeta = const VerificationMeta(
    'lastModifiedTime',
  );
  @override
  late final GeneratedColumn<DateTime> lastModifiedTime =
      GeneratedColumn<DateTime>(
        'last_modified_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _sleepIdMeta = const VerificationMeta(
    'sleepId',
  );
  @override
  late final GeneratedColumn<int> sleepId = GeneratedColumn<int>(
    'sleep_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    lastModifiedTime,
    sleepId,
    startTime,
    endTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sleep';
  @override
  VerificationContext validateIntegrity(
    Insertable<SleepData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('last_modified_time')) {
      context.handle(
        _lastModifiedTimeMeta,
        lastModifiedTime.isAcceptableOrUnknown(
          data['last_modified_time']!,
          _lastModifiedTimeMeta,
        ),
      );
    }
    if (data.containsKey('sleep_id')) {
      context.handle(
        _sleepIdMeta,
        sleepId.isAcceptableOrUnknown(data['sleep_id']!, _sleepIdMeta),
      );
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sleepId};
  @override
  SleepData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SleepData(
      lastModifiedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_time'],
      )!,
      sleepId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sleep_id'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      )!,
    );
  }

  @override
  $SleepTable createAlias(String alias) {
    return $SleepTable(attachedDatabase, alias);
  }
}

class SleepData extends DataClass implements Insertable<SleepData> {
  final DateTime lastModifiedTime;
  final int sleepId;
  final DateTime startTime;
  final DateTime endTime;
  const SleepData({
    required this.lastModifiedTime,
    required this.sleepId,
    required this.startTime,
    required this.endTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['sleep_id'] = Variable<int>(sleepId);
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    return map;
  }

  SleepCompanion toCompanion(bool nullToAbsent) {
    return SleepCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      sleepId: Value(sleepId),
      startTime: Value(startTime),
      endTime: Value(endTime),
    );
  }

  factory SleepData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SleepData(
      lastModifiedTime: serializer.fromJson<DateTime>(json['lastModifiedTime']),
      sleepId: serializer.fromJson<int>(json['sleepId']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'sleepId': serializer.toJson<int>(sleepId),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
    };
  }

  SleepData copyWith({
    DateTime? lastModifiedTime,
    int? sleepId,
    DateTime? startTime,
    DateTime? endTime,
  }) => SleepData(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    sleepId: sleepId ?? this.sleepId,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
  );
  SleepData copyWithCompanion(SleepCompanion data) {
    return SleepData(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      sleepId: data.sleepId.present ? data.sleepId.value : this.sleepId,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SleepData(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('sleepId: $sleepId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(lastModifiedTime, sleepId, startTime, endTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SleepData &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.sleepId == this.sleepId &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime);
}

class SleepCompanion extends UpdateCompanion<SleepData> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> sleepId;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  const SleepCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.sleepId = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
  });
  SleepCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.sleepId = const Value.absent(),
    required DateTime startTime,
    required DateTime endTime,
  }) : startTime = Value(startTime),
       endTime = Value(endTime);
  static Insertable<SleepData> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? sleepId,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (sleepId != null) 'sleep_id': sleepId,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
    });
  }

  SleepCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? sleepId,
    Value<DateTime>? startTime,
    Value<DateTime>? endTime,
  }) {
    return SleepCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      sleepId: sleepId ?? this.sleepId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastModifiedTime.present) {
      map['last_modified_time'] = Variable<DateTime>(lastModifiedTime.value);
    }
    if (sleepId.present) {
      map['sleep_id'] = Variable<int>(sleepId.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SleepCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('sleepId: $sleepId, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime')
          ..write(')'))
        .toString();
  }
}

class $StepsTable extends Steps with TableInfo<$StepsTable, Step> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StepsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lastModifiedTimeMeta = const VerificationMeta(
    'lastModifiedTime',
  );
  @override
  late final GeneratedColumn<DateTime> lastModifiedTime =
      GeneratedColumn<DateTime>(
        'last_modified_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _stepsIdMeta = const VerificationMeta(
    'stepsId',
  );
  @override
  late final GeneratedColumn<int> stepsId = GeneratedColumn<int>(
    'steps_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _timestampIdMeta = const VerificationMeta(
    'timestampId',
  );
  @override
  late final GeneratedColumn<int> timestampId = GeneratedColumn<int>(
    'timestamp_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timestamps (timestamp_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    lastModifiedTime,
    stepsId,
    timestampId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'steps';
  @override
  VerificationContext validateIntegrity(
    Insertable<Step> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('last_modified_time')) {
      context.handle(
        _lastModifiedTimeMeta,
        lastModifiedTime.isAcceptableOrUnknown(
          data['last_modified_time']!,
          _lastModifiedTimeMeta,
        ),
      );
    }
    if (data.containsKey('steps_id')) {
      context.handle(
        _stepsIdMeta,
        stepsId.isAcceptableOrUnknown(data['steps_id']!, _stepsIdMeta),
      );
    }
    if (data.containsKey('timestamp_id')) {
      context.handle(
        _timestampIdMeta,
        timestampId.isAcceptableOrUnknown(
          data['timestamp_id']!,
          _timestampIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_timestampIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {stepsId};
  @override
  Step map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Step(
      lastModifiedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_time'],
      )!,
      stepsId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}steps_id'],
      )!,
      timestampId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp_id'],
      )!,
    );
  }

  @override
  $StepsTable createAlias(String alias) {
    return $StepsTable(attachedDatabase, alias);
  }
}

class Step extends DataClass implements Insertable<Step> {
  final DateTime lastModifiedTime;
  final int stepsId;
  final int timestampId;
  const Step({
    required this.lastModifiedTime,
    required this.stepsId,
    required this.timestampId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['steps_id'] = Variable<int>(stepsId);
    map['timestamp_id'] = Variable<int>(timestampId);
    return map;
  }

  StepsCompanion toCompanion(bool nullToAbsent) {
    return StepsCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      stepsId: Value(stepsId),
      timestampId: Value(timestampId),
    );
  }

  factory Step.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Step(
      lastModifiedTime: serializer.fromJson<DateTime>(json['lastModifiedTime']),
      stepsId: serializer.fromJson<int>(json['stepsId']),
      timestampId: serializer.fromJson<int>(json['timestampId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'stepsId': serializer.toJson<int>(stepsId),
      'timestampId': serializer.toJson<int>(timestampId),
    };
  }

  Step copyWith({DateTime? lastModifiedTime, int? stepsId, int? timestampId}) =>
      Step(
        lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
        stepsId: stepsId ?? this.stepsId,
        timestampId: timestampId ?? this.timestampId,
      );
  Step copyWithCompanion(StepsCompanion data) {
    return Step(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      stepsId: data.stepsId.present ? data.stepsId.value : this.stepsId,
      timestampId: data.timestampId.present
          ? data.timestampId.value
          : this.timestampId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Step(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('stepsId: $stepsId, ')
          ..write('timestampId: $timestampId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(lastModifiedTime, stepsId, timestampId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Step &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.stepsId == this.stepsId &&
          other.timestampId == this.timestampId);
}

class StepsCompanion extends UpdateCompanion<Step> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> stepsId;
  final Value<int> timestampId;
  const StepsCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.stepsId = const Value.absent(),
    this.timestampId = const Value.absent(),
  });
  StepsCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.stepsId = const Value.absent(),
    required int timestampId,
  }) : timestampId = Value(timestampId);
  static Insertable<Step> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? stepsId,
    Expression<int>? timestampId,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (stepsId != null) 'steps_id': stepsId,
      if (timestampId != null) 'timestamp_id': timestampId,
    });
  }

  StepsCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? stepsId,
    Value<int>? timestampId,
  }) {
    return StepsCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      stepsId: stepsId ?? this.stepsId,
      timestampId: timestampId ?? this.timestampId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastModifiedTime.present) {
      map['last_modified_time'] = Variable<DateTime>(lastModifiedTime.value);
    }
    if (stepsId.present) {
      map['steps_id'] = Variable<int>(stepsId.value);
    }
    if (timestampId.present) {
      map['timestamp_id'] = Variable<int>(timestampId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StepsCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('stepsId: $stepsId, ')
          ..write('timestampId: $timestampId')
          ..write(')'))
        .toString();
  }
}

class $HrvTable extends Hrv with TableInfo<$HrvTable, HrvData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HrvTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lastModifiedTimeMeta = const VerificationMeta(
    'lastModifiedTime',
  );
  @override
  late final GeneratedColumn<DateTime> lastModifiedTime =
      GeneratedColumn<DateTime>(
        'last_modified_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _hrvIdMeta = const VerificationMeta('hrvId');
  @override
  late final GeneratedColumn<int> hrvId = GeneratedColumn<int>(
    'hrv_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _timestampIdMeta = const VerificationMeta(
    'timestampId',
  );
  @override
  late final GeneratedColumn<int> timestampId = GeneratedColumn<int>(
    'timestamp_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timestamps (timestamp_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [lastModifiedTime, hrvId, timestampId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hrv';
  @override
  VerificationContext validateIntegrity(
    Insertable<HrvData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('last_modified_time')) {
      context.handle(
        _lastModifiedTimeMeta,
        lastModifiedTime.isAcceptableOrUnknown(
          data['last_modified_time']!,
          _lastModifiedTimeMeta,
        ),
      );
    }
    if (data.containsKey('hrv_id')) {
      context.handle(
        _hrvIdMeta,
        hrvId.isAcceptableOrUnknown(data['hrv_id']!, _hrvIdMeta),
      );
    }
    if (data.containsKey('timestamp_id')) {
      context.handle(
        _timestampIdMeta,
        timestampId.isAcceptableOrUnknown(
          data['timestamp_id']!,
          _timestampIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_timestampIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {hrvId};
  @override
  HrvData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HrvData(
      lastModifiedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_time'],
      )!,
      hrvId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hrv_id'],
      )!,
      timestampId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp_id'],
      )!,
    );
  }

  @override
  $HrvTable createAlias(String alias) {
    return $HrvTable(attachedDatabase, alias);
  }
}

class HrvData extends DataClass implements Insertable<HrvData> {
  final DateTime lastModifiedTime;
  final int hrvId;
  final int timestampId;
  const HrvData({
    required this.lastModifiedTime,
    required this.hrvId,
    required this.timestampId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['hrv_id'] = Variable<int>(hrvId);
    map['timestamp_id'] = Variable<int>(timestampId);
    return map;
  }

  HrvCompanion toCompanion(bool nullToAbsent) {
    return HrvCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      hrvId: Value(hrvId),
      timestampId: Value(timestampId),
    );
  }

  factory HrvData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HrvData(
      lastModifiedTime: serializer.fromJson<DateTime>(json['lastModifiedTime']),
      hrvId: serializer.fromJson<int>(json['hrvId']),
      timestampId: serializer.fromJson<int>(json['timestampId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'hrvId': serializer.toJson<int>(hrvId),
      'timestampId': serializer.toJson<int>(timestampId),
    };
  }

  HrvData copyWith({
    DateTime? lastModifiedTime,
    int? hrvId,
    int? timestampId,
  }) => HrvData(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    hrvId: hrvId ?? this.hrvId,
    timestampId: timestampId ?? this.timestampId,
  );
  HrvData copyWithCompanion(HrvCompanion data) {
    return HrvData(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      hrvId: data.hrvId.present ? data.hrvId.value : this.hrvId,
      timestampId: data.timestampId.present
          ? data.timestampId.value
          : this.timestampId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HrvData(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('hrvId: $hrvId, ')
          ..write('timestampId: $timestampId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(lastModifiedTime, hrvId, timestampId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HrvData &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.hrvId == this.hrvId &&
          other.timestampId == this.timestampId);
}

class HrvCompanion extends UpdateCompanion<HrvData> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> hrvId;
  final Value<int> timestampId;
  const HrvCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.hrvId = const Value.absent(),
    this.timestampId = const Value.absent(),
  });
  HrvCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.hrvId = const Value.absent(),
    required int timestampId,
  }) : timestampId = Value(timestampId);
  static Insertable<HrvData> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? hrvId,
    Expression<int>? timestampId,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (hrvId != null) 'hrv_id': hrvId,
      if (timestampId != null) 'timestamp_id': timestampId,
    });
  }

  HrvCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? hrvId,
    Value<int>? timestampId,
  }) {
    return HrvCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      hrvId: hrvId ?? this.hrvId,
      timestampId: timestampId ?? this.timestampId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastModifiedTime.present) {
      map['last_modified_time'] = Variable<DateTime>(lastModifiedTime.value);
    }
    if (hrvId.present) {
      map['hrv_id'] = Variable<int>(hrvId.value);
    }
    if (timestampId.present) {
      map['timestamp_id'] = Variable<int>(timestampId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HrvCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('hrvId: $hrvId, ')
          ..write('timestampId: $timestampId')
          ..write(')'))
        .toString();
  }
}

class $HeartRateTable extends HeartRate
    with TableInfo<$HeartRateTable, HeartRateData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HeartRateTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lastModifiedTimeMeta = const VerificationMeta(
    'lastModifiedTime',
  );
  @override
  late final GeneratedColumn<DateTime> lastModifiedTime =
      GeneratedColumn<DateTime>(
        'last_modified_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _hrIdMeta = const VerificationMeta('hrId');
  @override
  late final GeneratedColumn<int> hrId = GeneratedColumn<int>(
    'hr_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _timestampIdMeta = const VerificationMeta(
    'timestampId',
  );
  @override
  late final GeneratedColumn<int> timestampId = GeneratedColumn<int>(
    'timestamp_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timestamps (timestamp_id)',
    ),
  );
  static const VerificationMeta _dailyAvgMeta = const VerificationMeta(
    'dailyAvg',
  );
  @override
  late final GeneratedColumn<int> dailyAvg = GeneratedColumn<int>(
    'daily_avg',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    lastModifiedTime,
    hrId,
    timestampId,
    dailyAvg,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'heart_rate';
  @override
  VerificationContext validateIntegrity(
    Insertable<HeartRateData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('last_modified_time')) {
      context.handle(
        _lastModifiedTimeMeta,
        lastModifiedTime.isAcceptableOrUnknown(
          data['last_modified_time']!,
          _lastModifiedTimeMeta,
        ),
      );
    }
    if (data.containsKey('hr_id')) {
      context.handle(
        _hrIdMeta,
        hrId.isAcceptableOrUnknown(data['hr_id']!, _hrIdMeta),
      );
    }
    if (data.containsKey('timestamp_id')) {
      context.handle(
        _timestampIdMeta,
        timestampId.isAcceptableOrUnknown(
          data['timestamp_id']!,
          _timestampIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_timestampIdMeta);
    }
    if (data.containsKey('daily_avg')) {
      context.handle(
        _dailyAvgMeta,
        dailyAvg.isAcceptableOrUnknown(data['daily_avg']!, _dailyAvgMeta),
      );
    } else if (isInserting) {
      context.missing(_dailyAvgMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {hrId};
  @override
  HeartRateData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HeartRateData(
      lastModifiedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_time'],
      )!,
      hrId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hr_id'],
      )!,
      timestampId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}timestamp_id'],
      )!,
      dailyAvg: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_avg'],
      )!,
    );
  }

  @override
  $HeartRateTable createAlias(String alias) {
    return $HeartRateTable(attachedDatabase, alias);
  }
}

class HeartRateData extends DataClass implements Insertable<HeartRateData> {
  final DateTime lastModifiedTime;
  final int hrId;
  final int timestampId;
  final int dailyAvg;
  const HeartRateData({
    required this.lastModifiedTime,
    required this.hrId,
    required this.timestampId,
    required this.dailyAvg,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['hr_id'] = Variable<int>(hrId);
    map['timestamp_id'] = Variable<int>(timestampId);
    map['daily_avg'] = Variable<int>(dailyAvg);
    return map;
  }

  HeartRateCompanion toCompanion(bool nullToAbsent) {
    return HeartRateCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      hrId: Value(hrId),
      timestampId: Value(timestampId),
      dailyAvg: Value(dailyAvg),
    );
  }

  factory HeartRateData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HeartRateData(
      lastModifiedTime: serializer.fromJson<DateTime>(json['lastModifiedTime']),
      hrId: serializer.fromJson<int>(json['hrId']),
      timestampId: serializer.fromJson<int>(json['timestampId']),
      dailyAvg: serializer.fromJson<int>(json['dailyAvg']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'hrId': serializer.toJson<int>(hrId),
      'timestampId': serializer.toJson<int>(timestampId),
      'dailyAvg': serializer.toJson<int>(dailyAvg),
    };
  }

  HeartRateData copyWith({
    DateTime? lastModifiedTime,
    int? hrId,
    int? timestampId,
    int? dailyAvg,
  }) => HeartRateData(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    hrId: hrId ?? this.hrId,
    timestampId: timestampId ?? this.timestampId,
    dailyAvg: dailyAvg ?? this.dailyAvg,
  );
  HeartRateData copyWithCompanion(HeartRateCompanion data) {
    return HeartRateData(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      hrId: data.hrId.present ? data.hrId.value : this.hrId,
      timestampId: data.timestampId.present
          ? data.timestampId.value
          : this.timestampId,
      dailyAvg: data.dailyAvg.present ? data.dailyAvg.value : this.dailyAvg,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HeartRateData(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('hrId: $hrId, ')
          ..write('timestampId: $timestampId, ')
          ..write('dailyAvg: $dailyAvg')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(lastModifiedTime, hrId, timestampId, dailyAvg);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HeartRateData &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.hrId == this.hrId &&
          other.timestampId == this.timestampId &&
          other.dailyAvg == this.dailyAvg);
}

class HeartRateCompanion extends UpdateCompanion<HeartRateData> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> hrId;
  final Value<int> timestampId;
  final Value<int> dailyAvg;
  const HeartRateCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.hrId = const Value.absent(),
    this.timestampId = const Value.absent(),
    this.dailyAvg = const Value.absent(),
  });
  HeartRateCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.hrId = const Value.absent(),
    required int timestampId,
    required int dailyAvg,
  }) : timestampId = Value(timestampId),
       dailyAvg = Value(dailyAvg);
  static Insertable<HeartRateData> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? hrId,
    Expression<int>? timestampId,
    Expression<int>? dailyAvg,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (hrId != null) 'hr_id': hrId,
      if (timestampId != null) 'timestamp_id': timestampId,
      if (dailyAvg != null) 'daily_avg': dailyAvg,
    });
  }

  HeartRateCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? hrId,
    Value<int>? timestampId,
    Value<int>? dailyAvg,
  }) {
    return HeartRateCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      hrId: hrId ?? this.hrId,
      timestampId: timestampId ?? this.timestampId,
      dailyAvg: dailyAvg ?? this.dailyAvg,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastModifiedTime.present) {
      map['last_modified_time'] = Variable<DateTime>(lastModifiedTime.value);
    }
    if (hrId.present) {
      map['hr_id'] = Variable<int>(hrId.value);
    }
    if (timestampId.present) {
      map['timestamp_id'] = Variable<int>(timestampId.value);
    }
    if (dailyAvg.present) {
      map['daily_avg'] = Variable<int>(dailyAvg.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HeartRateCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('hrId: $hrId, ')
          ..write('timestampId: $timestampId, ')
          ..write('dailyAvg: $dailyAvg')
          ..write(')'))
        .toString();
  }
}

class $BaselineTable extends Baseline
    with TableInfo<$BaselineTable, BaselineData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BaselineTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lastModifiedTimeMeta = const VerificationMeta(
    'lastModifiedTime',
  );
  @override
  late final GeneratedColumn<DateTime> lastModifiedTime =
      GeneratedColumn<DateTime>(
        'last_modified_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _baselineIdMeta = const VerificationMeta(
    'baselineId',
  );
  @override
  late final GeneratedColumn<int> baselineId = GeneratedColumn<int>(
    'baseline_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _maxHrMeta = const VerificationMeta('maxHr');
  @override
  late final GeneratedColumn<int> maxHr = GeneratedColumn<int>(
    'max_hr',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minDateMeta = const VerificationMeta(
    'minDate',
  );
  @override
  late final GeneratedColumn<DateTime> minDate = GeneratedColumn<DateTime>(
    'min_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _minHrMeta = const VerificationMeta('minHr');
  @override
  late final GeneratedColumn<int> minHr = GeneratedColumn<int>(
    'min_hr',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    lastModifiedTime,
    baselineId,
    maxHr,
    minDate,
    minHr,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'baseline';
  @override
  VerificationContext validateIntegrity(
    Insertable<BaselineData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('last_modified_time')) {
      context.handle(
        _lastModifiedTimeMeta,
        lastModifiedTime.isAcceptableOrUnknown(
          data['last_modified_time']!,
          _lastModifiedTimeMeta,
        ),
      );
    }
    if (data.containsKey('baseline_id')) {
      context.handle(
        _baselineIdMeta,
        baselineId.isAcceptableOrUnknown(data['baseline_id']!, _baselineIdMeta),
      );
    }
    if (data.containsKey('max_hr')) {
      context.handle(
        _maxHrMeta,
        maxHr.isAcceptableOrUnknown(data['max_hr']!, _maxHrMeta),
      );
    } else if (isInserting) {
      context.missing(_maxHrMeta);
    }
    if (data.containsKey('min_date')) {
      context.handle(
        _minDateMeta,
        minDate.isAcceptableOrUnknown(data['min_date']!, _minDateMeta),
      );
    } else if (isInserting) {
      context.missing(_minDateMeta);
    }
    if (data.containsKey('min_hr')) {
      context.handle(
        _minHrMeta,
        minHr.isAcceptableOrUnknown(data['min_hr']!, _minHrMeta),
      );
    } else if (isInserting) {
      context.missing(_minHrMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {baselineId};
  @override
  BaselineData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BaselineData(
      lastModifiedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_time'],
      )!,
      baselineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}baseline_id'],
      )!,
      maxHr: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_hr'],
      )!,
      minDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}min_date'],
      )!,
      minHr: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}min_hr'],
      )!,
    );
  }

  @override
  $BaselineTable createAlias(String alias) {
    return $BaselineTable(attachedDatabase, alias);
  }
}

class BaselineData extends DataClass implements Insertable<BaselineData> {
  final DateTime lastModifiedTime;
  final int baselineId;
  final int maxHr;
  final DateTime minDate;
  final int minHr;
  const BaselineData({
    required this.lastModifiedTime,
    required this.baselineId,
    required this.maxHr,
    required this.minDate,
    required this.minHr,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['baseline_id'] = Variable<int>(baselineId);
    map['max_hr'] = Variable<int>(maxHr);
    map['min_date'] = Variable<DateTime>(minDate);
    map['min_hr'] = Variable<int>(minHr);
    return map;
  }

  BaselineCompanion toCompanion(bool nullToAbsent) {
    return BaselineCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      baselineId: Value(baselineId),
      maxHr: Value(maxHr),
      minDate: Value(minDate),
      minHr: Value(minHr),
    );
  }

  factory BaselineData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BaselineData(
      lastModifiedTime: serializer.fromJson<DateTime>(json['lastModifiedTime']),
      baselineId: serializer.fromJson<int>(json['baselineId']),
      maxHr: serializer.fromJson<int>(json['maxHr']),
      minDate: serializer.fromJson<DateTime>(json['minDate']),
      minHr: serializer.fromJson<int>(json['minHr']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'baselineId': serializer.toJson<int>(baselineId),
      'maxHr': serializer.toJson<int>(maxHr),
      'minDate': serializer.toJson<DateTime>(minDate),
      'minHr': serializer.toJson<int>(minHr),
    };
  }

  BaselineData copyWith({
    DateTime? lastModifiedTime,
    int? baselineId,
    int? maxHr,
    DateTime? minDate,
    int? minHr,
  }) => BaselineData(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    baselineId: baselineId ?? this.baselineId,
    maxHr: maxHr ?? this.maxHr,
    minDate: minDate ?? this.minDate,
    minHr: minHr ?? this.minHr,
  );
  BaselineData copyWithCompanion(BaselineCompanion data) {
    return BaselineData(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      baselineId: data.baselineId.present
          ? data.baselineId.value
          : this.baselineId,
      maxHr: data.maxHr.present ? data.maxHr.value : this.maxHr,
      minDate: data.minDate.present ? data.minDate.value : this.minDate,
      minHr: data.minHr.present ? data.minHr.value : this.minHr,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BaselineData(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('baselineId: $baselineId, ')
          ..write('maxHr: $maxHr, ')
          ..write('minDate: $minDate, ')
          ..write('minHr: $minHr')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(lastModifiedTime, baselineId, maxHr, minDate, minHr);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BaselineData &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.baselineId == this.baselineId &&
          other.maxHr == this.maxHr &&
          other.minDate == this.minDate &&
          other.minHr == this.minHr);
}

class BaselineCompanion extends UpdateCompanion<BaselineData> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> baselineId;
  final Value<int> maxHr;
  final Value<DateTime> minDate;
  final Value<int> minHr;
  const BaselineCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.baselineId = const Value.absent(),
    this.maxHr = const Value.absent(),
    this.minDate = const Value.absent(),
    this.minHr = const Value.absent(),
  });
  BaselineCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.baselineId = const Value.absent(),
    required int maxHr,
    required DateTime minDate,
    required int minHr,
  }) : maxHr = Value(maxHr),
       minDate = Value(minDate),
       minHr = Value(minHr);
  static Insertable<BaselineData> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? baselineId,
    Expression<int>? maxHr,
    Expression<DateTime>? minDate,
    Expression<int>? minHr,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (baselineId != null) 'baseline_id': baselineId,
      if (maxHr != null) 'max_hr': maxHr,
      if (minDate != null) 'min_date': minDate,
      if (minHr != null) 'min_hr': minHr,
    });
  }

  BaselineCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? baselineId,
    Value<int>? maxHr,
    Value<DateTime>? minDate,
    Value<int>? minHr,
  }) {
    return BaselineCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      baselineId: baselineId ?? this.baselineId,
      maxHr: maxHr ?? this.maxHr,
      minDate: minDate ?? this.minDate,
      minHr: minHr ?? this.minHr,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastModifiedTime.present) {
      map['last_modified_time'] = Variable<DateTime>(lastModifiedTime.value);
    }
    if (baselineId.present) {
      map['baseline_id'] = Variable<int>(baselineId.value);
    }
    if (maxHr.present) {
      map['max_hr'] = Variable<int>(maxHr.value);
    }
    if (minDate.present) {
      map['min_date'] = Variable<DateTime>(minDate.value);
    }
    if (minHr.present) {
      map['min_hr'] = Variable<int>(minHr.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BaselineCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('baselineId: $baselineId, ')
          ..write('maxHr: $maxHr, ')
          ..write('minDate: $minDate, ')
          ..write('minHr: $minHr')
          ..write(')'))
        .toString();
  }
}

class $HealthOverviewTable extends HealthOverview
    with TableInfo<$HealthOverviewTable, HealthOverviewData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HealthOverviewTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lastModifiedTimeMeta = const VerificationMeta(
    'lastModifiedTime',
  );
  @override
  late final GeneratedColumn<DateTime> lastModifiedTime =
      GeneratedColumn<DateTime>(
        'last_modified_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _healthScoreMeta = const VerificationMeta(
    'healthScore',
  );
  @override
  late final GeneratedColumn<int> healthScore = GeneratedColumn<int>(
    'health_score',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sleepIdMeta = const VerificationMeta(
    'sleepId',
  );
  @override
  late final GeneratedColumn<int> sleepId = GeneratedColumn<int>(
    'sleep_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sleep (sleep_id)',
    ),
  );
  static const VerificationMeta _stepsIdMeta = const VerificationMeta(
    'stepsId',
  );
  @override
  late final GeneratedColumn<int> stepsId = GeneratedColumn<int>(
    'steps_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES steps (steps_id)',
    ),
  );
  static const VerificationMeta _hrvIdMeta = const VerificationMeta('hrvId');
  @override
  late final GeneratedColumn<int> hrvId = GeneratedColumn<int>(
    'hrv_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES hrv (hrv_id)',
    ),
  );
  static const VerificationMeta _baselineIdMeta = const VerificationMeta(
    'baselineId',
  );
  @override
  late final GeneratedColumn<int> baselineId = GeneratedColumn<int>(
    'baseline_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES baseline (baseline_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    lastModifiedTime,
    healthScore,
    sleepId,
    stepsId,
    hrvId,
    baselineId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'health_overview';
  @override
  VerificationContext validateIntegrity(
    Insertable<HealthOverviewData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('last_modified_time')) {
      context.handle(
        _lastModifiedTimeMeta,
        lastModifiedTime.isAcceptableOrUnknown(
          data['last_modified_time']!,
          _lastModifiedTimeMeta,
        ),
      );
    }
    if (data.containsKey('health_score')) {
      context.handle(
        _healthScoreMeta,
        healthScore.isAcceptableOrUnknown(
          data['health_score']!,
          _healthScoreMeta,
        ),
      );
    }
    if (data.containsKey('sleep_id')) {
      context.handle(
        _sleepIdMeta,
        sleepId.isAcceptableOrUnknown(data['sleep_id']!, _sleepIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sleepIdMeta);
    }
    if (data.containsKey('steps_id')) {
      context.handle(
        _stepsIdMeta,
        stepsId.isAcceptableOrUnknown(data['steps_id']!, _stepsIdMeta),
      );
    } else if (isInserting) {
      context.missing(_stepsIdMeta);
    }
    if (data.containsKey('hrv_id')) {
      context.handle(
        _hrvIdMeta,
        hrvId.isAcceptableOrUnknown(data['hrv_id']!, _hrvIdMeta),
      );
    } else if (isInserting) {
      context.missing(_hrvIdMeta);
    }
    if (data.containsKey('baseline_id')) {
      context.handle(
        _baselineIdMeta,
        baselineId.isAcceptableOrUnknown(data['baseline_id']!, _baselineIdMeta),
      );
    } else if (isInserting) {
      context.missing(_baselineIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {healthScore};
  @override
  HealthOverviewData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HealthOverviewData(
      lastModifiedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_time'],
      )!,
      healthScore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}health_score'],
      )!,
      sleepId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sleep_id'],
      )!,
      stepsId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}steps_id'],
      )!,
      hrvId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hrv_id'],
      )!,
      baselineId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}baseline_id'],
      )!,
    );
  }

  @override
  $HealthOverviewTable createAlias(String alias) {
    return $HealthOverviewTable(attachedDatabase, alias);
  }
}

class HealthOverviewData extends DataClass
    implements Insertable<HealthOverviewData> {
  final DateTime lastModifiedTime;
  final int healthScore;
  final int sleepId;
  final int stepsId;
  final int hrvId;
  final int baselineId;
  const HealthOverviewData({
    required this.lastModifiedTime,
    required this.healthScore,
    required this.sleepId,
    required this.stepsId,
    required this.hrvId,
    required this.baselineId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['health_score'] = Variable<int>(healthScore);
    map['sleep_id'] = Variable<int>(sleepId);
    map['steps_id'] = Variable<int>(stepsId);
    map['hrv_id'] = Variable<int>(hrvId);
    map['baseline_id'] = Variable<int>(baselineId);
    return map;
  }

  HealthOverviewCompanion toCompanion(bool nullToAbsent) {
    return HealthOverviewCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      healthScore: Value(healthScore),
      sleepId: Value(sleepId),
      stepsId: Value(stepsId),
      hrvId: Value(hrvId),
      baselineId: Value(baselineId),
    );
  }

  factory HealthOverviewData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HealthOverviewData(
      lastModifiedTime: serializer.fromJson<DateTime>(json['lastModifiedTime']),
      healthScore: serializer.fromJson<int>(json['healthScore']),
      sleepId: serializer.fromJson<int>(json['sleepId']),
      stepsId: serializer.fromJson<int>(json['stepsId']),
      hrvId: serializer.fromJson<int>(json['hrvId']),
      baselineId: serializer.fromJson<int>(json['baselineId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'healthScore': serializer.toJson<int>(healthScore),
      'sleepId': serializer.toJson<int>(sleepId),
      'stepsId': serializer.toJson<int>(stepsId),
      'hrvId': serializer.toJson<int>(hrvId),
      'baselineId': serializer.toJson<int>(baselineId),
    };
  }

  HealthOverviewData copyWith({
    DateTime? lastModifiedTime,
    int? healthScore,
    int? sleepId,
    int? stepsId,
    int? hrvId,
    int? baselineId,
  }) => HealthOverviewData(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    healthScore: healthScore ?? this.healthScore,
    sleepId: sleepId ?? this.sleepId,
    stepsId: stepsId ?? this.stepsId,
    hrvId: hrvId ?? this.hrvId,
    baselineId: baselineId ?? this.baselineId,
  );
  HealthOverviewData copyWithCompanion(HealthOverviewCompanion data) {
    return HealthOverviewData(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      healthScore: data.healthScore.present
          ? data.healthScore.value
          : this.healthScore,
      sleepId: data.sleepId.present ? data.sleepId.value : this.sleepId,
      stepsId: data.stepsId.present ? data.stepsId.value : this.stepsId,
      hrvId: data.hrvId.present ? data.hrvId.value : this.hrvId,
      baselineId: data.baselineId.present
          ? data.baselineId.value
          : this.baselineId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HealthOverviewData(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('healthScore: $healthScore, ')
          ..write('sleepId: $sleepId, ')
          ..write('stepsId: $stepsId, ')
          ..write('hrvId: $hrvId, ')
          ..write('baselineId: $baselineId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    lastModifiedTime,
    healthScore,
    sleepId,
    stepsId,
    hrvId,
    baselineId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HealthOverviewData &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.healthScore == this.healthScore &&
          other.sleepId == this.sleepId &&
          other.stepsId == this.stepsId &&
          other.hrvId == this.hrvId &&
          other.baselineId == this.baselineId);
}

class HealthOverviewCompanion extends UpdateCompanion<HealthOverviewData> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> healthScore;
  final Value<int> sleepId;
  final Value<int> stepsId;
  final Value<int> hrvId;
  final Value<int> baselineId;
  const HealthOverviewCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.healthScore = const Value.absent(),
    this.sleepId = const Value.absent(),
    this.stepsId = const Value.absent(),
    this.hrvId = const Value.absent(),
    this.baselineId = const Value.absent(),
  });
  HealthOverviewCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.healthScore = const Value.absent(),
    required int sleepId,
    required int stepsId,
    required int hrvId,
    required int baselineId,
  }) : sleepId = Value(sleepId),
       stepsId = Value(stepsId),
       hrvId = Value(hrvId),
       baselineId = Value(baselineId);
  static Insertable<HealthOverviewData> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? healthScore,
    Expression<int>? sleepId,
    Expression<int>? stepsId,
    Expression<int>? hrvId,
    Expression<int>? baselineId,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (healthScore != null) 'health_score': healthScore,
      if (sleepId != null) 'sleep_id': sleepId,
      if (stepsId != null) 'steps_id': stepsId,
      if (hrvId != null) 'hrv_id': hrvId,
      if (baselineId != null) 'baseline_id': baselineId,
    });
  }

  HealthOverviewCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? healthScore,
    Value<int>? sleepId,
    Value<int>? stepsId,
    Value<int>? hrvId,
    Value<int>? baselineId,
  }) {
    return HealthOverviewCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      healthScore: healthScore ?? this.healthScore,
      sleepId: sleepId ?? this.sleepId,
      stepsId: stepsId ?? this.stepsId,
      hrvId: hrvId ?? this.hrvId,
      baselineId: baselineId ?? this.baselineId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastModifiedTime.present) {
      map['last_modified_time'] = Variable<DateTime>(lastModifiedTime.value);
    }
    if (healthScore.present) {
      map['health_score'] = Variable<int>(healthScore.value);
    }
    if (sleepId.present) {
      map['sleep_id'] = Variable<int>(sleepId.value);
    }
    if (stepsId.present) {
      map['steps_id'] = Variable<int>(stepsId.value);
    }
    if (hrvId.present) {
      map['hrv_id'] = Variable<int>(hrvId.value);
    }
    if (baselineId.present) {
      map['baseline_id'] = Variable<int>(baselineId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HealthOverviewCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('healthScore: $healthScore, ')
          ..write('sleepId: $sleepId, ')
          ..write('stepsId: $stepsId, ')
          ..write('hrvId: $hrvId, ')
          ..write('baselineId: $baselineId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TimestampsTable timestamps = $TimestampsTable(this);
  late final $NotificationsTable notifications = $NotificationsTable(this);
  late final $SleepTable sleep = $SleepTable(this);
  late final $StepsTable steps = $StepsTable(this);
  late final $HrvTable hrv = $HrvTable(this);
  late final $HeartRateTable heartRate = $HeartRateTable(this);
  late final $BaselineTable baseline = $BaselineTable(this);
  late final $HealthOverviewTable healthOverview = $HealthOverviewTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    timestamps,
    notifications,
    sleep,
    steps,
    hrv,
    heartRate,
    baseline,
    healthOverview,
  ];
}

typedef $$TimestampsTableCreateCompanionBuilder =
    TimestampsCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> timestampId,
      required DateTime date,
    });
typedef $$TimestampsTableUpdateCompanionBuilder =
    TimestampsCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> timestampId,
      Value<DateTime> date,
    });

final class $$TimestampsTableReferences
    extends BaseReferences<_$AppDatabase, $TimestampsTable, Timestamp> {
  $$TimestampsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$NotificationsTable, List<Notification>>
  _notificationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.notifications,
    aliasName: $_aliasNameGenerator(
      db.timestamps.timestampId,
      db.notifications.timestampId,
    ),
  );

  $$NotificationsTableProcessedTableManager get notificationsRefs {
    final manager = $$NotificationsTableTableManager($_db, $_db.notifications)
        .filter(
          (f) => f.timestampId.timestampId.sqlEquals(
            $_itemColumn<int>('timestamp_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_notificationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StepsTable, List<Step>> _stepsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.steps,
    aliasName: $_aliasNameGenerator(
      db.timestamps.timestampId,
      db.steps.timestampId,
    ),
  );

  $$StepsTableProcessedTableManager get stepsRefs {
    final manager = $$StepsTableTableManager($_db, $_db.steps).filter(
      (f) => f.timestampId.timestampId.sqlEquals(
        $_itemColumn<int>('timestamp_id')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_stepsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$HrvTable, List<HrvData>> _hrvRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.hrv,
    aliasName: $_aliasNameGenerator(
      db.timestamps.timestampId,
      db.hrv.timestampId,
    ),
  );

  $$HrvTableProcessedTableManager get hrvRefs {
    final manager = $$HrvTableTableManager($_db, $_db.hrv).filter(
      (f) => f.timestampId.timestampId.sqlEquals(
        $_itemColumn<int>('timestamp_id')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_hrvRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$HeartRateTable, List<HeartRateData>>
  _heartRateRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.heartRate,
    aliasName: $_aliasNameGenerator(
      db.timestamps.timestampId,
      db.heartRate.timestampId,
    ),
  );

  $$HeartRateTableProcessedTableManager get heartRateRefs {
    final manager = $$HeartRateTableTableManager($_db, $_db.heartRate).filter(
      (f) => f.timestampId.timestampId.sqlEquals(
        $_itemColumn<int>('timestamp_id')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_heartRateRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TimestampsTableFilterComposer
    extends Composer<_$AppDatabase, $TimestampsTable> {
  $$TimestampsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get timestampId => $composableBuilder(
    column: $table.timestampId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> notificationsRefs(
    Expression<bool> Function($$NotificationsTableFilterComposer f) f,
  ) {
    final $$NotificationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.notifications,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotificationsTableFilterComposer(
            $db: $db,
            $table: $db.notifications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> stepsRefs(
    Expression<bool> Function($$StepsTableFilterComposer f) f,
  ) {
    final $$StepsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.steps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StepsTableFilterComposer(
            $db: $db,
            $table: $db.steps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> hrvRefs(
    Expression<bool> Function($$HrvTableFilterComposer f) f,
  ) {
    final $$HrvTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.hrv,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HrvTableFilterComposer(
            $db: $db,
            $table: $db.hrv,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> heartRateRefs(
    Expression<bool> Function($$HeartRateTableFilterComposer f) f,
  ) {
    final $$HeartRateTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.heartRate,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HeartRateTableFilterComposer(
            $db: $db,
            $table: $db.heartRate,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TimestampsTableOrderingComposer
    extends Composer<_$AppDatabase, $TimestampsTable> {
  $$TimestampsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get timestampId => $composableBuilder(
    column: $table.timestampId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TimestampsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimestampsTable> {
  $$TimestampsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get timestampId => $composableBuilder(
    column: $table.timestampId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  Expression<T> notificationsRefs<T extends Object>(
    Expression<T> Function($$NotificationsTableAnnotationComposer a) f,
  ) {
    final $$NotificationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.notifications,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotificationsTableAnnotationComposer(
            $db: $db,
            $table: $db.notifications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> stepsRefs<T extends Object>(
    Expression<T> Function($$StepsTableAnnotationComposer a) f,
  ) {
    final $$StepsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.steps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StepsTableAnnotationComposer(
            $db: $db,
            $table: $db.steps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> hrvRefs<T extends Object>(
    Expression<T> Function($$HrvTableAnnotationComposer a) f,
  ) {
    final $$HrvTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.hrv,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HrvTableAnnotationComposer(
            $db: $db,
            $table: $db.hrv,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> heartRateRefs<T extends Object>(
    Expression<T> Function($$HeartRateTableAnnotationComposer a) f,
  ) {
    final $$HeartRateTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.heartRate,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HeartRateTableAnnotationComposer(
            $db: $db,
            $table: $db.heartRate,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TimestampsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TimestampsTable,
          Timestamp,
          $$TimestampsTableFilterComposer,
          $$TimestampsTableOrderingComposer,
          $$TimestampsTableAnnotationComposer,
          $$TimestampsTableCreateCompanionBuilder,
          $$TimestampsTableUpdateCompanionBuilder,
          (Timestamp, $$TimestampsTableReferences),
          Timestamp,
          PrefetchHooks Function({
            bool notificationsRefs,
            bool stepsRefs,
            bool hrvRefs,
            bool heartRateRefs,
          })
        > {
  $$TimestampsTableTableManager(_$AppDatabase db, $TimestampsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TimestampsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TimestampsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TimestampsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> timestampId = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
              }) => TimestampsCompanion(
                lastModifiedTime: lastModifiedTime,
                timestampId: timestampId,
                date: date,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> timestampId = const Value.absent(),
                required DateTime date,
              }) => TimestampsCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                timestampId: timestampId,
                date: date,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TimestampsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                notificationsRefs = false,
                stepsRefs = false,
                hrvRefs = false,
                heartRateRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (notificationsRefs) db.notifications,
                    if (stepsRefs) db.steps,
                    if (hrvRefs) db.hrv,
                    if (heartRateRefs) db.heartRate,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (notificationsRefs)
                        await $_getPrefetchedData<
                          Timestamp,
                          $TimestampsTable,
                          Notification
                        >(
                          currentTable: table,
                          referencedTable: $$TimestampsTableReferences
                              ._notificationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TimestampsTableReferences(
                                db,
                                table,
                                p0,
                              ).notificationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.timestampId == item.timestampId,
                              ),
                          typedResults: items,
                        ),
                      if (stepsRefs)
                        await $_getPrefetchedData<
                          Timestamp,
                          $TimestampsTable,
                          Step
                        >(
                          currentTable: table,
                          referencedTable: $$TimestampsTableReferences
                              ._stepsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TimestampsTableReferences(
                                db,
                                table,
                                p0,
                              ).stepsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.timestampId == item.timestampId,
                              ),
                          typedResults: items,
                        ),
                      if (hrvRefs)
                        await $_getPrefetchedData<
                          Timestamp,
                          $TimestampsTable,
                          HrvData
                        >(
                          currentTable: table,
                          referencedTable: $$TimestampsTableReferences
                              ._hrvRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TimestampsTableReferences(
                                db,
                                table,
                                p0,
                              ).hrvRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.timestampId == item.timestampId,
                              ),
                          typedResults: items,
                        ),
                      if (heartRateRefs)
                        await $_getPrefetchedData<
                          Timestamp,
                          $TimestampsTable,
                          HeartRateData
                        >(
                          currentTable: table,
                          referencedTable: $$TimestampsTableReferences
                              ._heartRateRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TimestampsTableReferences(
                                db,
                                table,
                                p0,
                              ).heartRateRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.timestampId == item.timestampId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TimestampsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TimestampsTable,
      Timestamp,
      $$TimestampsTableFilterComposer,
      $$TimestampsTableOrderingComposer,
      $$TimestampsTableAnnotationComposer,
      $$TimestampsTableCreateCompanionBuilder,
      $$TimestampsTableUpdateCompanionBuilder,
      (Timestamp, $$TimestampsTableReferences),
      Timestamp,
      PrefetchHooks Function({
        bool notificationsRefs,
        bool stepsRefs,
        bool hrvRefs,
        bool heartRateRefs,
      })
    >;
typedef $$NotificationsTableCreateCompanionBuilder =
    NotificationsCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> notificationId,
      required String notifHeader,
      required String notifBody,
      required int timestampId,
    });
typedef $$NotificationsTableUpdateCompanionBuilder =
    NotificationsCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> notificationId,
      Value<String> notifHeader,
      Value<String> notifBody,
      Value<int> timestampId,
    });

final class $$NotificationsTableReferences
    extends BaseReferences<_$AppDatabase, $NotificationsTable, Notification> {
  $$NotificationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TimestampsTable _timestampIdTable(_$AppDatabase db) =>
      db.timestamps.createAlias(
        $_aliasNameGenerator(
          db.notifications.timestampId,
          db.timestamps.timestampId,
        ),
      );

  $$TimestampsTableProcessedTableManager get timestampId {
    final $_column = $_itemColumn<int>('timestamp_id')!;

    final manager = $$TimestampsTableTableManager(
      $_db,
      $_db.timestamps,
    ).filter((f) => f.timestampId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_timestampIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NotificationsTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notifHeader => $composableBuilder(
    column: $table.notifHeader,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notifBody => $composableBuilder(
    column: $table.notifBody,
    builder: (column) => ColumnFilters(column),
  );

  $$TimestampsTableFilterComposer get timestampId {
    final $$TimestampsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimestampsTableFilterComposer(
            $db: $db,
            $table: $db.timestamps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationsTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notifHeader => $composableBuilder(
    column: $table.notifHeader,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notifBody => $composableBuilder(
    column: $table.notifBody,
    builder: (column) => ColumnOrderings(column),
  );

  $$TimestampsTableOrderingComposer get timestampId {
    final $$TimestampsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimestampsTableOrderingComposer(
            $db: $db,
            $table: $db.timestamps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationsTable> {
  $$NotificationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get notificationId => $composableBuilder(
    column: $table.notificationId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notifHeader => $composableBuilder(
    column: $table.notifHeader,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notifBody =>
      $composableBuilder(column: $table.notifBody, builder: (column) => column);

  $$TimestampsTableAnnotationComposer get timestampId {
    final $$TimestampsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimestampsTableAnnotationComposer(
            $db: $db,
            $table: $db.timestamps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationsTable,
          Notification,
          $$NotificationsTableFilterComposer,
          $$NotificationsTableOrderingComposer,
          $$NotificationsTableAnnotationComposer,
          $$NotificationsTableCreateCompanionBuilder,
          $$NotificationsTableUpdateCompanionBuilder,
          (Notification, $$NotificationsTableReferences),
          Notification,
          PrefetchHooks Function({bool timestampId})
        > {
  $$NotificationsTableTableManager(_$AppDatabase db, $NotificationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> notificationId = const Value.absent(),
                Value<String> notifHeader = const Value.absent(),
                Value<String> notifBody = const Value.absent(),
                Value<int> timestampId = const Value.absent(),
              }) => NotificationsCompanion(
                lastModifiedTime: lastModifiedTime,
                notificationId: notificationId,
                notifHeader: notifHeader,
                notifBody: notifBody,
                timestampId: timestampId,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> notificationId = const Value.absent(),
                required String notifHeader,
                required String notifBody,
                required int timestampId,
              }) => NotificationsCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                notificationId: notificationId,
                notifHeader: notifHeader,
                notifBody: notifBody,
                timestampId: timestampId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NotificationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({timestampId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (timestampId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.timestampId,
                                referencedTable: $$NotificationsTableReferences
                                    ._timestampIdTable(db),
                                referencedColumn: $$NotificationsTableReferences
                                    ._timestampIdTable(db)
                                    .timestampId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NotificationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationsTable,
      Notification,
      $$NotificationsTableFilterComposer,
      $$NotificationsTableOrderingComposer,
      $$NotificationsTableAnnotationComposer,
      $$NotificationsTableCreateCompanionBuilder,
      $$NotificationsTableUpdateCompanionBuilder,
      (Notification, $$NotificationsTableReferences),
      Notification,
      PrefetchHooks Function({bool timestampId})
    >;
typedef $$SleepTableCreateCompanionBuilder =
    SleepCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> sleepId,
      required DateTime startTime,
      required DateTime endTime,
    });
typedef $$SleepTableUpdateCompanionBuilder =
    SleepCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> sleepId,
      Value<DateTime> startTime,
      Value<DateTime> endTime,
    });

final class $$SleepTableReferences
    extends BaseReferences<_$AppDatabase, $SleepTable, SleepData> {
  $$SleepTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HealthOverviewTable, List<HealthOverviewData>>
  _healthOverviewRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.healthOverview,
    aliasName: $_aliasNameGenerator(
      db.sleep.sleepId,
      db.healthOverview.sleepId,
    ),
  );

  $$HealthOverviewTableProcessedTableManager get healthOverviewRefs {
    final manager = $$HealthOverviewTableTableManager($_db, $_db.healthOverview)
        .filter(
          (f) => f.sleepId.sleepId.sqlEquals($_itemColumn<int>('sleep_id')!),
        );

    final cache = $_typedResult.readTableOrNull(_healthOverviewRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SleepTableFilterComposer extends Composer<_$AppDatabase, $SleepTable> {
  $$SleepTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sleepId => $composableBuilder(
    column: $table.sleepId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> healthOverviewRefs(
    Expression<bool> Function($$HealthOverviewTableFilterComposer f) f,
  ) {
    final $$HealthOverviewTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sleepId,
      referencedTable: $db.healthOverview,
      getReferencedColumn: (t) => t.sleepId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HealthOverviewTableFilterComposer(
            $db: $db,
            $table: $db.healthOverview,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SleepTableOrderingComposer
    extends Composer<_$AppDatabase, $SleepTable> {
  $$SleepTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sleepId => $composableBuilder(
    column: $table.sleepId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SleepTableAnnotationComposer
    extends Composer<_$AppDatabase, $SleepTable> {
  $$SleepTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sleepId =>
      $composableBuilder(column: $table.sleepId, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  Expression<T> healthOverviewRefs<T extends Object>(
    Expression<T> Function($$HealthOverviewTableAnnotationComposer a) f,
  ) {
    final $$HealthOverviewTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sleepId,
      referencedTable: $db.healthOverview,
      getReferencedColumn: (t) => t.sleepId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HealthOverviewTableAnnotationComposer(
            $db: $db,
            $table: $db.healthOverview,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SleepTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SleepTable,
          SleepData,
          $$SleepTableFilterComposer,
          $$SleepTableOrderingComposer,
          $$SleepTableAnnotationComposer,
          $$SleepTableCreateCompanionBuilder,
          $$SleepTableUpdateCompanionBuilder,
          (SleepData, $$SleepTableReferences),
          SleepData,
          PrefetchHooks Function({bool healthOverviewRefs})
        > {
  $$SleepTableTableManager(_$AppDatabase db, $SleepTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SleepTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SleepTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SleepTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> sleepId = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime> endTime = const Value.absent(),
              }) => SleepCompanion(
                lastModifiedTime: lastModifiedTime,
                sleepId: sleepId,
                startTime: startTime,
                endTime: endTime,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> sleepId = const Value.absent(),
                required DateTime startTime,
                required DateTime endTime,
              }) => SleepCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                sleepId: sleepId,
                startTime: startTime,
                endTime: endTime,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$SleepTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({healthOverviewRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (healthOverviewRefs) db.healthOverview,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (healthOverviewRefs)
                    await $_getPrefetchedData<
                      SleepData,
                      $SleepTable,
                      HealthOverviewData
                    >(
                      currentTable: table,
                      referencedTable: $$SleepTableReferences
                          ._healthOverviewRefsTable(db),
                      managerFromTypedResult: (p0) => $$SleepTableReferences(
                        db,
                        table,
                        p0,
                      ).healthOverviewRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.sleepId == item.sleepId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SleepTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SleepTable,
      SleepData,
      $$SleepTableFilterComposer,
      $$SleepTableOrderingComposer,
      $$SleepTableAnnotationComposer,
      $$SleepTableCreateCompanionBuilder,
      $$SleepTableUpdateCompanionBuilder,
      (SleepData, $$SleepTableReferences),
      SleepData,
      PrefetchHooks Function({bool healthOverviewRefs})
    >;
typedef $$StepsTableCreateCompanionBuilder =
    StepsCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> stepsId,
      required int timestampId,
    });
typedef $$StepsTableUpdateCompanionBuilder =
    StepsCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> stepsId,
      Value<int> timestampId,
    });

final class $$StepsTableReferences
    extends BaseReferences<_$AppDatabase, $StepsTable, Step> {
  $$StepsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TimestampsTable _timestampIdTable(_$AppDatabase db) =>
      db.timestamps.createAlias(
        $_aliasNameGenerator(db.steps.timestampId, db.timestamps.timestampId),
      );

  $$TimestampsTableProcessedTableManager get timestampId {
    final $_column = $_itemColumn<int>('timestamp_id')!;

    final manager = $$TimestampsTableTableManager(
      $_db,
      $_db.timestamps,
    ).filter((f) => f.timestampId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_timestampIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$HealthOverviewTable, List<HealthOverviewData>>
  _healthOverviewRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.healthOverview,
    aliasName: $_aliasNameGenerator(
      db.steps.stepsId,
      db.healthOverview.stepsId,
    ),
  );

  $$HealthOverviewTableProcessedTableManager get healthOverviewRefs {
    final manager = $$HealthOverviewTableTableManager($_db, $_db.healthOverview)
        .filter(
          (f) => f.stepsId.stepsId.sqlEquals($_itemColumn<int>('steps_id')!),
        );

    final cache = $_typedResult.readTableOrNull(_healthOverviewRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StepsTableFilterComposer extends Composer<_$AppDatabase, $StepsTable> {
  $$StepsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stepsId => $composableBuilder(
    column: $table.stepsId,
    builder: (column) => ColumnFilters(column),
  );

  $$TimestampsTableFilterComposer get timestampId {
    final $$TimestampsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimestampsTableFilterComposer(
            $db: $db,
            $table: $db.timestamps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> healthOverviewRefs(
    Expression<bool> Function($$HealthOverviewTableFilterComposer f) f,
  ) {
    final $$HealthOverviewTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stepsId,
      referencedTable: $db.healthOverview,
      getReferencedColumn: (t) => t.stepsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HealthOverviewTableFilterComposer(
            $db: $db,
            $table: $db.healthOverview,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StepsTableOrderingComposer
    extends Composer<_$AppDatabase, $StepsTable> {
  $$StepsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stepsId => $composableBuilder(
    column: $table.stepsId,
    builder: (column) => ColumnOrderings(column),
  );

  $$TimestampsTableOrderingComposer get timestampId {
    final $$TimestampsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimestampsTableOrderingComposer(
            $db: $db,
            $table: $db.timestamps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StepsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StepsTable> {
  $$StepsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stepsId =>
      $composableBuilder(column: $table.stepsId, builder: (column) => column);

  $$TimestampsTableAnnotationComposer get timestampId {
    final $$TimestampsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimestampsTableAnnotationComposer(
            $db: $db,
            $table: $db.timestamps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> healthOverviewRefs<T extends Object>(
    Expression<T> Function($$HealthOverviewTableAnnotationComposer a) f,
  ) {
    final $$HealthOverviewTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stepsId,
      referencedTable: $db.healthOverview,
      getReferencedColumn: (t) => t.stepsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HealthOverviewTableAnnotationComposer(
            $db: $db,
            $table: $db.healthOverview,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StepsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StepsTable,
          Step,
          $$StepsTableFilterComposer,
          $$StepsTableOrderingComposer,
          $$StepsTableAnnotationComposer,
          $$StepsTableCreateCompanionBuilder,
          $$StepsTableUpdateCompanionBuilder,
          (Step, $$StepsTableReferences),
          Step,
          PrefetchHooks Function({bool timestampId, bool healthOverviewRefs})
        > {
  $$StepsTableTableManager(_$AppDatabase db, $StepsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StepsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StepsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StepsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> stepsId = const Value.absent(),
                Value<int> timestampId = const Value.absent(),
              }) => StepsCompanion(
                lastModifiedTime: lastModifiedTime,
                stepsId: stepsId,
                timestampId: timestampId,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> stepsId = const Value.absent(),
                required int timestampId,
              }) => StepsCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                stepsId: stepsId,
                timestampId: timestampId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$StepsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({timestampId = false, healthOverviewRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (healthOverviewRefs) db.healthOverview,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (timestampId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.timestampId,
                                    referencedTable: $$StepsTableReferences
                                        ._timestampIdTable(db),
                                    referencedColumn: $$StepsTableReferences
                                        ._timestampIdTable(db)
                                        .timestampId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (healthOverviewRefs)
                        await $_getPrefetchedData<
                          Step,
                          $StepsTable,
                          HealthOverviewData
                        >(
                          currentTable: table,
                          referencedTable: $$StepsTableReferences
                              ._healthOverviewRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StepsTableReferences(
                                db,
                                table,
                                p0,
                              ).healthOverviewRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.stepsId == item.stepsId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$StepsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StepsTable,
      Step,
      $$StepsTableFilterComposer,
      $$StepsTableOrderingComposer,
      $$StepsTableAnnotationComposer,
      $$StepsTableCreateCompanionBuilder,
      $$StepsTableUpdateCompanionBuilder,
      (Step, $$StepsTableReferences),
      Step,
      PrefetchHooks Function({bool timestampId, bool healthOverviewRefs})
    >;
typedef $$HrvTableCreateCompanionBuilder =
    HrvCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> hrvId,
      required int timestampId,
    });
typedef $$HrvTableUpdateCompanionBuilder =
    HrvCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> hrvId,
      Value<int> timestampId,
    });

final class $$HrvTableReferences
    extends BaseReferences<_$AppDatabase, $HrvTable, HrvData> {
  $$HrvTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TimestampsTable _timestampIdTable(_$AppDatabase db) =>
      db.timestamps.createAlias(
        $_aliasNameGenerator(db.hrv.timestampId, db.timestamps.timestampId),
      );

  $$TimestampsTableProcessedTableManager get timestampId {
    final $_column = $_itemColumn<int>('timestamp_id')!;

    final manager = $$TimestampsTableTableManager(
      $_db,
      $_db.timestamps,
    ).filter((f) => f.timestampId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_timestampIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$HealthOverviewTable, List<HealthOverviewData>>
  _healthOverviewRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.healthOverview,
    aliasName: $_aliasNameGenerator(db.hrv.hrvId, db.healthOverview.hrvId),
  );

  $$HealthOverviewTableProcessedTableManager get healthOverviewRefs {
    final manager = $$HealthOverviewTableTableManager(
      $_db,
      $_db.healthOverview,
    ).filter((f) => f.hrvId.hrvId.sqlEquals($_itemColumn<int>('hrv_id')!));

    final cache = $_typedResult.readTableOrNull(_healthOverviewRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HrvTableFilterComposer extends Composer<_$AppDatabase, $HrvTable> {
  $$HrvTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hrvId => $composableBuilder(
    column: $table.hrvId,
    builder: (column) => ColumnFilters(column),
  );

  $$TimestampsTableFilterComposer get timestampId {
    final $$TimestampsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimestampsTableFilterComposer(
            $db: $db,
            $table: $db.timestamps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> healthOverviewRefs(
    Expression<bool> Function($$HealthOverviewTableFilterComposer f) f,
  ) {
    final $$HealthOverviewTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hrvId,
      referencedTable: $db.healthOverview,
      getReferencedColumn: (t) => t.hrvId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HealthOverviewTableFilterComposer(
            $db: $db,
            $table: $db.healthOverview,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HrvTableOrderingComposer extends Composer<_$AppDatabase, $HrvTable> {
  $$HrvTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hrvId => $composableBuilder(
    column: $table.hrvId,
    builder: (column) => ColumnOrderings(column),
  );

  $$TimestampsTableOrderingComposer get timestampId {
    final $$TimestampsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimestampsTableOrderingComposer(
            $db: $db,
            $table: $db.timestamps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HrvTableAnnotationComposer extends Composer<_$AppDatabase, $HrvTable> {
  $$HrvTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hrvId =>
      $composableBuilder(column: $table.hrvId, builder: (column) => column);

  $$TimestampsTableAnnotationComposer get timestampId {
    final $$TimestampsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimestampsTableAnnotationComposer(
            $db: $db,
            $table: $db.timestamps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> healthOverviewRefs<T extends Object>(
    Expression<T> Function($$HealthOverviewTableAnnotationComposer a) f,
  ) {
    final $$HealthOverviewTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hrvId,
      referencedTable: $db.healthOverview,
      getReferencedColumn: (t) => t.hrvId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HealthOverviewTableAnnotationComposer(
            $db: $db,
            $table: $db.healthOverview,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HrvTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HrvTable,
          HrvData,
          $$HrvTableFilterComposer,
          $$HrvTableOrderingComposer,
          $$HrvTableAnnotationComposer,
          $$HrvTableCreateCompanionBuilder,
          $$HrvTableUpdateCompanionBuilder,
          (HrvData, $$HrvTableReferences),
          HrvData,
          PrefetchHooks Function({bool timestampId, bool healthOverviewRefs})
        > {
  $$HrvTableTableManager(_$AppDatabase db, $HrvTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HrvTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HrvTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HrvTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> hrvId = const Value.absent(),
                Value<int> timestampId = const Value.absent(),
              }) => HrvCompanion(
                lastModifiedTime: lastModifiedTime,
                hrvId: hrvId,
                timestampId: timestampId,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> hrvId = const Value.absent(),
                required int timestampId,
              }) => HrvCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                hrvId: hrvId,
                timestampId: timestampId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $$HrvTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({timestampId = false, healthOverviewRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (healthOverviewRefs) db.healthOverview,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (timestampId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.timestampId,
                                    referencedTable: $$HrvTableReferences
                                        ._timestampIdTable(db),
                                    referencedColumn: $$HrvTableReferences
                                        ._timestampIdTable(db)
                                        .timestampId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (healthOverviewRefs)
                        await $_getPrefetchedData<
                          HrvData,
                          $HrvTable,
                          HealthOverviewData
                        >(
                          currentTable: table,
                          referencedTable: $$HrvTableReferences
                              ._healthOverviewRefsTable(db),
                          managerFromTypedResult: (p0) => $$HrvTableReferences(
                            db,
                            table,
                            p0,
                          ).healthOverviewRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.hrvId == item.hrvId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$HrvTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HrvTable,
      HrvData,
      $$HrvTableFilterComposer,
      $$HrvTableOrderingComposer,
      $$HrvTableAnnotationComposer,
      $$HrvTableCreateCompanionBuilder,
      $$HrvTableUpdateCompanionBuilder,
      (HrvData, $$HrvTableReferences),
      HrvData,
      PrefetchHooks Function({bool timestampId, bool healthOverviewRefs})
    >;
typedef $$HeartRateTableCreateCompanionBuilder =
    HeartRateCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> hrId,
      required int timestampId,
      required int dailyAvg,
    });
typedef $$HeartRateTableUpdateCompanionBuilder =
    HeartRateCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> hrId,
      Value<int> timestampId,
      Value<int> dailyAvg,
    });

final class $$HeartRateTableReferences
    extends BaseReferences<_$AppDatabase, $HeartRateTable, HeartRateData> {
  $$HeartRateTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TimestampsTable _timestampIdTable(_$AppDatabase db) =>
      db.timestamps.createAlias(
        $_aliasNameGenerator(
          db.heartRate.timestampId,
          db.timestamps.timestampId,
        ),
      );

  $$TimestampsTableProcessedTableManager get timestampId {
    final $_column = $_itemColumn<int>('timestamp_id')!;

    final manager = $$TimestampsTableTableManager(
      $_db,
      $_db.timestamps,
    ).filter((f) => f.timestampId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_timestampIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HeartRateTableFilterComposer
    extends Composer<_$AppDatabase, $HeartRateTable> {
  $$HeartRateTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get hrId => $composableBuilder(
    column: $table.hrId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyAvg => $composableBuilder(
    column: $table.dailyAvg,
    builder: (column) => ColumnFilters(column),
  );

  $$TimestampsTableFilterComposer get timestampId {
    final $$TimestampsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimestampsTableFilterComposer(
            $db: $db,
            $table: $db.timestamps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HeartRateTableOrderingComposer
    extends Composer<_$AppDatabase, $HeartRateTable> {
  $$HeartRateTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get hrId => $composableBuilder(
    column: $table.hrId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyAvg => $composableBuilder(
    column: $table.dailyAvg,
    builder: (column) => ColumnOrderings(column),
  );

  $$TimestampsTableOrderingComposer get timestampId {
    final $$TimestampsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimestampsTableOrderingComposer(
            $db: $db,
            $table: $db.timestamps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HeartRateTableAnnotationComposer
    extends Composer<_$AppDatabase, $HeartRateTable> {
  $$HeartRateTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get hrId =>
      $composableBuilder(column: $table.hrId, builder: (column) => column);

  GeneratedColumn<int> get dailyAvg =>
      $composableBuilder(column: $table.dailyAvg, builder: (column) => column);

  $$TimestampsTableAnnotationComposer get timestampId {
    final $$TimestampsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestampId,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.timestampId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimestampsTableAnnotationComposer(
            $db: $db,
            $table: $db.timestamps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HeartRateTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HeartRateTable,
          HeartRateData,
          $$HeartRateTableFilterComposer,
          $$HeartRateTableOrderingComposer,
          $$HeartRateTableAnnotationComposer,
          $$HeartRateTableCreateCompanionBuilder,
          $$HeartRateTableUpdateCompanionBuilder,
          (HeartRateData, $$HeartRateTableReferences),
          HeartRateData,
          PrefetchHooks Function({bool timestampId})
        > {
  $$HeartRateTableTableManager(_$AppDatabase db, $HeartRateTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HeartRateTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HeartRateTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HeartRateTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> hrId = const Value.absent(),
                Value<int> timestampId = const Value.absent(),
                Value<int> dailyAvg = const Value.absent(),
              }) => HeartRateCompanion(
                lastModifiedTime: lastModifiedTime,
                hrId: hrId,
                timestampId: timestampId,
                dailyAvg: dailyAvg,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> hrId = const Value.absent(),
                required int timestampId,
                required int dailyAvg,
              }) => HeartRateCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                hrId: hrId,
                timestampId: timestampId,
                dailyAvg: dailyAvg,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HeartRateTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({timestampId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (timestampId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.timestampId,
                                referencedTable: $$HeartRateTableReferences
                                    ._timestampIdTable(db),
                                referencedColumn: $$HeartRateTableReferences
                                    ._timestampIdTable(db)
                                    .timestampId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HeartRateTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HeartRateTable,
      HeartRateData,
      $$HeartRateTableFilterComposer,
      $$HeartRateTableOrderingComposer,
      $$HeartRateTableAnnotationComposer,
      $$HeartRateTableCreateCompanionBuilder,
      $$HeartRateTableUpdateCompanionBuilder,
      (HeartRateData, $$HeartRateTableReferences),
      HeartRateData,
      PrefetchHooks Function({bool timestampId})
    >;
typedef $$BaselineTableCreateCompanionBuilder =
    BaselineCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> baselineId,
      required int maxHr,
      required DateTime minDate,
      required int minHr,
    });
typedef $$BaselineTableUpdateCompanionBuilder =
    BaselineCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> baselineId,
      Value<int> maxHr,
      Value<DateTime> minDate,
      Value<int> minHr,
    });

final class $$BaselineTableReferences
    extends BaseReferences<_$AppDatabase, $BaselineTable, BaselineData> {
  $$BaselineTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$HealthOverviewTable, List<HealthOverviewData>>
  _healthOverviewRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.healthOverview,
    aliasName: $_aliasNameGenerator(
      db.baseline.baselineId,
      db.healthOverview.baselineId,
    ),
  );

  $$HealthOverviewTableProcessedTableManager get healthOverviewRefs {
    final manager = $$HealthOverviewTableTableManager($_db, $_db.healthOverview)
        .filter(
          (f) => f.baselineId.baselineId.sqlEquals(
            $_itemColumn<int>('baseline_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_healthOverviewRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$BaselineTableFilterComposer
    extends Composer<_$AppDatabase, $BaselineTable> {
  $$BaselineTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get baselineId => $composableBuilder(
    column: $table.baselineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxHr => $composableBuilder(
    column: $table.maxHr,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get minDate => $composableBuilder(
    column: $table.minDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get minHr => $composableBuilder(
    column: $table.minHr,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> healthOverviewRefs(
    Expression<bool> Function($$HealthOverviewTableFilterComposer f) f,
  ) {
    final $$HealthOverviewTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.baselineId,
      referencedTable: $db.healthOverview,
      getReferencedColumn: (t) => t.baselineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HealthOverviewTableFilterComposer(
            $db: $db,
            $table: $db.healthOverview,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BaselineTableOrderingComposer
    extends Composer<_$AppDatabase, $BaselineTable> {
  $$BaselineTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baselineId => $composableBuilder(
    column: $table.baselineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxHr => $composableBuilder(
    column: $table.maxHr,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get minDate => $composableBuilder(
    column: $table.minDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get minHr => $composableBuilder(
    column: $table.minHr,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BaselineTableAnnotationComposer
    extends Composer<_$AppDatabase, $BaselineTable> {
  $$BaselineTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get baselineId => $composableBuilder(
    column: $table.baselineId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get maxHr =>
      $composableBuilder(column: $table.maxHr, builder: (column) => column);

  GeneratedColumn<DateTime> get minDate =>
      $composableBuilder(column: $table.minDate, builder: (column) => column);

  GeneratedColumn<int> get minHr =>
      $composableBuilder(column: $table.minHr, builder: (column) => column);

  Expression<T> healthOverviewRefs<T extends Object>(
    Expression<T> Function($$HealthOverviewTableAnnotationComposer a) f,
  ) {
    final $$HealthOverviewTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.baselineId,
      referencedTable: $db.healthOverview,
      getReferencedColumn: (t) => t.baselineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HealthOverviewTableAnnotationComposer(
            $db: $db,
            $table: $db.healthOverview,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$BaselineTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BaselineTable,
          BaselineData,
          $$BaselineTableFilterComposer,
          $$BaselineTableOrderingComposer,
          $$BaselineTableAnnotationComposer,
          $$BaselineTableCreateCompanionBuilder,
          $$BaselineTableUpdateCompanionBuilder,
          (BaselineData, $$BaselineTableReferences),
          BaselineData,
          PrefetchHooks Function({bool healthOverviewRefs})
        > {
  $$BaselineTableTableManager(_$AppDatabase db, $BaselineTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BaselineTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BaselineTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BaselineTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> baselineId = const Value.absent(),
                Value<int> maxHr = const Value.absent(),
                Value<DateTime> minDate = const Value.absent(),
                Value<int> minHr = const Value.absent(),
              }) => BaselineCompanion(
                lastModifiedTime: lastModifiedTime,
                baselineId: baselineId,
                maxHr: maxHr,
                minDate: minDate,
                minHr: minHr,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> baselineId = const Value.absent(),
                required int maxHr,
                required DateTime minDate,
                required int minHr,
              }) => BaselineCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                baselineId: baselineId,
                maxHr: maxHr,
                minDate: minDate,
                minHr: minHr,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$BaselineTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({healthOverviewRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (healthOverviewRefs) db.healthOverview,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (healthOverviewRefs)
                    await $_getPrefetchedData<
                      BaselineData,
                      $BaselineTable,
                      HealthOverviewData
                    >(
                      currentTable: table,
                      referencedTable: $$BaselineTableReferences
                          ._healthOverviewRefsTable(db),
                      managerFromTypedResult: (p0) => $$BaselineTableReferences(
                        db,
                        table,
                        p0,
                      ).healthOverviewRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.baselineId == item.baselineId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$BaselineTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BaselineTable,
      BaselineData,
      $$BaselineTableFilterComposer,
      $$BaselineTableOrderingComposer,
      $$BaselineTableAnnotationComposer,
      $$BaselineTableCreateCompanionBuilder,
      $$BaselineTableUpdateCompanionBuilder,
      (BaselineData, $$BaselineTableReferences),
      BaselineData,
      PrefetchHooks Function({bool healthOverviewRefs})
    >;
typedef $$HealthOverviewTableCreateCompanionBuilder =
    HealthOverviewCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> healthScore,
      required int sleepId,
      required int stepsId,
      required int hrvId,
      required int baselineId,
    });
typedef $$HealthOverviewTableUpdateCompanionBuilder =
    HealthOverviewCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> healthScore,
      Value<int> sleepId,
      Value<int> stepsId,
      Value<int> hrvId,
      Value<int> baselineId,
    });

final class $$HealthOverviewTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $HealthOverviewTable,
          HealthOverviewData
        > {
  $$HealthOverviewTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SleepTable _sleepIdTable(_$AppDatabase db) => db.sleep.createAlias(
    $_aliasNameGenerator(db.healthOverview.sleepId, db.sleep.sleepId),
  );

  $$SleepTableProcessedTableManager get sleepId {
    final $_column = $_itemColumn<int>('sleep_id')!;

    final manager = $$SleepTableTableManager(
      $_db,
      $_db.sleep,
    ).filter((f) => f.sleepId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sleepIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $StepsTable _stepsIdTable(_$AppDatabase db) => db.steps.createAlias(
    $_aliasNameGenerator(db.healthOverview.stepsId, db.steps.stepsId),
  );

  $$StepsTableProcessedTableManager get stepsId {
    final $_column = $_itemColumn<int>('steps_id')!;

    final manager = $$StepsTableTableManager(
      $_db,
      $_db.steps,
    ).filter((f) => f.stepsId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_stepsIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $HrvTable _hrvIdTable(_$AppDatabase db) => db.hrv.createAlias(
    $_aliasNameGenerator(db.healthOverview.hrvId, db.hrv.hrvId),
  );

  $$HrvTableProcessedTableManager get hrvId {
    final $_column = $_itemColumn<int>('hrv_id')!;

    final manager = $$HrvTableTableManager(
      $_db,
      $_db.hrv,
    ).filter((f) => f.hrvId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_hrvIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $BaselineTable _baselineIdTable(_$AppDatabase db) =>
      db.baseline.createAlias(
        $_aliasNameGenerator(
          db.healthOverview.baselineId,
          db.baseline.baselineId,
        ),
      );

  $$BaselineTableProcessedTableManager get baselineId {
    final $_column = $_itemColumn<int>('baseline_id')!;

    final manager = $$BaselineTableTableManager(
      $_db,
      $_db.baseline,
    ).filter((f) => f.baselineId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_baselineIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HealthOverviewTableFilterComposer
    extends Composer<_$AppDatabase, $HealthOverviewTable> {
  $$HealthOverviewTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get healthScore => $composableBuilder(
    column: $table.healthScore,
    builder: (column) => ColumnFilters(column),
  );

  $$SleepTableFilterComposer get sleepId {
    final $$SleepTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sleepId,
      referencedTable: $db.sleep,
      getReferencedColumn: (t) => t.sleepId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SleepTableFilterComposer(
            $db: $db,
            $table: $db.sleep,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StepsTableFilterComposer get stepsId {
    final $$StepsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stepsId,
      referencedTable: $db.steps,
      getReferencedColumn: (t) => t.stepsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StepsTableFilterComposer(
            $db: $db,
            $table: $db.steps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$HrvTableFilterComposer get hrvId {
    final $$HrvTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hrvId,
      referencedTable: $db.hrv,
      getReferencedColumn: (t) => t.hrvId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HrvTableFilterComposer(
            $db: $db,
            $table: $db.hrv,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BaselineTableFilterComposer get baselineId {
    final $$BaselineTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.baselineId,
      referencedTable: $db.baseline,
      getReferencedColumn: (t) => t.baselineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BaselineTableFilterComposer(
            $db: $db,
            $table: $db.baseline,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HealthOverviewTableOrderingComposer
    extends Composer<_$AppDatabase, $HealthOverviewTable> {
  $$HealthOverviewTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get healthScore => $composableBuilder(
    column: $table.healthScore,
    builder: (column) => ColumnOrderings(column),
  );

  $$SleepTableOrderingComposer get sleepId {
    final $$SleepTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sleepId,
      referencedTable: $db.sleep,
      getReferencedColumn: (t) => t.sleepId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SleepTableOrderingComposer(
            $db: $db,
            $table: $db.sleep,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StepsTableOrderingComposer get stepsId {
    final $$StepsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stepsId,
      referencedTable: $db.steps,
      getReferencedColumn: (t) => t.stepsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StepsTableOrderingComposer(
            $db: $db,
            $table: $db.steps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$HrvTableOrderingComposer get hrvId {
    final $$HrvTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hrvId,
      referencedTable: $db.hrv,
      getReferencedColumn: (t) => t.hrvId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HrvTableOrderingComposer(
            $db: $db,
            $table: $db.hrv,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BaselineTableOrderingComposer get baselineId {
    final $$BaselineTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.baselineId,
      referencedTable: $db.baseline,
      getReferencedColumn: (t) => t.baselineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BaselineTableOrderingComposer(
            $db: $db,
            $table: $db.baseline,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HealthOverviewTableAnnotationComposer
    extends Composer<_$AppDatabase, $HealthOverviewTable> {
  $$HealthOverviewTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get lastModifiedTime => $composableBuilder(
    column: $table.lastModifiedTime,
    builder: (column) => column,
  );

  GeneratedColumn<int> get healthScore => $composableBuilder(
    column: $table.healthScore,
    builder: (column) => column,
  );

  $$SleepTableAnnotationComposer get sleepId {
    final $$SleepTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sleepId,
      referencedTable: $db.sleep,
      getReferencedColumn: (t) => t.sleepId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SleepTableAnnotationComposer(
            $db: $db,
            $table: $db.sleep,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$StepsTableAnnotationComposer get stepsId {
    final $$StepsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stepsId,
      referencedTable: $db.steps,
      getReferencedColumn: (t) => t.stepsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StepsTableAnnotationComposer(
            $db: $db,
            $table: $db.steps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$HrvTableAnnotationComposer get hrvId {
    final $$HrvTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hrvId,
      referencedTable: $db.hrv,
      getReferencedColumn: (t) => t.hrvId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HrvTableAnnotationComposer(
            $db: $db,
            $table: $db.hrv,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$BaselineTableAnnotationComposer get baselineId {
    final $$BaselineTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.baselineId,
      referencedTable: $db.baseline,
      getReferencedColumn: (t) => t.baselineId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$BaselineTableAnnotationComposer(
            $db: $db,
            $table: $db.baseline,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HealthOverviewTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HealthOverviewTable,
          HealthOverviewData,
          $$HealthOverviewTableFilterComposer,
          $$HealthOverviewTableOrderingComposer,
          $$HealthOverviewTableAnnotationComposer,
          $$HealthOverviewTableCreateCompanionBuilder,
          $$HealthOverviewTableUpdateCompanionBuilder,
          (HealthOverviewData, $$HealthOverviewTableReferences),
          HealthOverviewData,
          PrefetchHooks Function({
            bool sleepId,
            bool stepsId,
            bool hrvId,
            bool baselineId,
          })
        > {
  $$HealthOverviewTableTableManager(
    _$AppDatabase db,
    $HealthOverviewTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HealthOverviewTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HealthOverviewTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HealthOverviewTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> healthScore = const Value.absent(),
                Value<int> sleepId = const Value.absent(),
                Value<int> stepsId = const Value.absent(),
                Value<int> hrvId = const Value.absent(),
                Value<int> baselineId = const Value.absent(),
              }) => HealthOverviewCompanion(
                lastModifiedTime: lastModifiedTime,
                healthScore: healthScore,
                sleepId: sleepId,
                stepsId: stepsId,
                hrvId: hrvId,
                baselineId: baselineId,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> healthScore = const Value.absent(),
                required int sleepId,
                required int stepsId,
                required int hrvId,
                required int baselineId,
              }) => HealthOverviewCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                healthScore: healthScore,
                sleepId: sleepId,
                stepsId: stepsId,
                hrvId: hrvId,
                baselineId: baselineId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HealthOverviewTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                sleepId = false,
                stepsId = false,
                hrvId = false,
                baselineId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (sleepId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sleepId,
                                    referencedTable:
                                        $$HealthOverviewTableReferences
                                            ._sleepIdTable(db),
                                    referencedColumn:
                                        $$HealthOverviewTableReferences
                                            ._sleepIdTable(db)
                                            .sleepId,
                                  )
                                  as T;
                        }
                        if (stepsId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.stepsId,
                                    referencedTable:
                                        $$HealthOverviewTableReferences
                                            ._stepsIdTable(db),
                                    referencedColumn:
                                        $$HealthOverviewTableReferences
                                            ._stepsIdTable(db)
                                            .stepsId,
                                  )
                                  as T;
                        }
                        if (hrvId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.hrvId,
                                    referencedTable:
                                        $$HealthOverviewTableReferences
                                            ._hrvIdTable(db),
                                    referencedColumn:
                                        $$HealthOverviewTableReferences
                                            ._hrvIdTable(db)
                                            .hrvId,
                                  )
                                  as T;
                        }
                        if (baselineId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.baselineId,
                                    referencedTable:
                                        $$HealthOverviewTableReferences
                                            ._baselineIdTable(db),
                                    referencedColumn:
                                        $$HealthOverviewTableReferences
                                            ._baselineIdTable(db)
                                            .baselineId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$HealthOverviewTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HealthOverviewTable,
      HealthOverviewData,
      $$HealthOverviewTableFilterComposer,
      $$HealthOverviewTableOrderingComposer,
      $$HealthOverviewTableAnnotationComposer,
      $$HealthOverviewTableCreateCompanionBuilder,
      $$HealthOverviewTableUpdateCompanionBuilder,
      (HealthOverviewData, $$HealthOverviewTableReferences),
      HealthOverviewData,
      PrefetchHooks Function({
        bool sleepId,
        bool stepsId,
        bool hrvId,
        bool baselineId,
      })
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TimestampsTableTableManager get timestamps =>
      $$TimestampsTableTableManager(_db, _db.timestamps);
  $$NotificationsTableTableManager get notifications =>
      $$NotificationsTableTableManager(_db, _db.notifications);
  $$SleepTableTableManager get sleep =>
      $$SleepTableTableManager(_db, _db.sleep);
  $$StepsTableTableManager get steps =>
      $$StepsTableTableManager(_db, _db.steps);
  $$HrvTableTableManager get hrv => $$HrvTableTableManager(_db, _db.hrv);
  $$HeartRateTableTableManager get heartRate =>
      $$HeartRateTableTableManager(_db, _db.heartRate);
  $$BaselineTableTableManager get baseline =>
      $$BaselineTableTableManager(_db, _db.baseline);
  $$HealthOverviewTableTableManager get healthOverview =>
      $$HealthOverviewTableTableManager(_db, _db.healthOverview);
}
