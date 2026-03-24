// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

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
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<DateTime> time = GeneratedColumn<DateTime>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
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
  List<GeneratedColumn> get $columns => [lastModifiedTime, time, date];
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
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
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
  Set<GeneratedColumn> get $primaryKey => {time};
  @override
  Timestamp map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Timestamp(
      lastModifiedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_time'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}time'],
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
  final DateTime time;
  final DateTime date;
  const Timestamp({
    required this.lastModifiedTime,
    required this.time,
    required this.date,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['time'] = Variable<DateTime>(time);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  TimestampsCompanion toCompanion(bool nullToAbsent) {
    return TimestampsCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      time: Value(time),
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
      time: serializer.fromJson<DateTime>(json['time']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'time': serializer.toJson<DateTime>(time),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  Timestamp copyWith({
    DateTime? lastModifiedTime,
    DateTime? time,
    DateTime? date,
  }) => Timestamp(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    time: time ?? this.time,
    date: date ?? this.date,
  );
  Timestamp copyWithCompanion(TimestampsCompanion data) {
    return Timestamp(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      time: data.time.present ? data.time.value : this.time,
      date: data.date.present ? data.date.value : this.date,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Timestamp(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('time: $time, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(lastModifiedTime, time, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Timestamp &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.time == this.time &&
          other.date == this.date);
}

class TimestampsCompanion extends UpdateCompanion<Timestamp> {
  final Value<DateTime> lastModifiedTime;
  final Value<DateTime> time;
  final Value<DateTime> date;
  final Value<int> rowid;
  const TimestampsCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.time = const Value.absent(),
    this.date = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TimestampsCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    required DateTime time,
    required DateTime date,
    this.rowid = const Value.absent(),
  }) : time = Value(time),
       date = Value(date);
  static Insertable<Timestamp> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<DateTime>? time,
    Expression<DateTime>? date,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (time != null) 'time': time,
      if (date != null) 'date': date,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TimestampsCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<DateTime>? time,
    Value<DateTime>? date,
    Value<int>? rowid,
  }) {
    return TimestampsCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      time: time ?? this.time,
      date: date ?? this.date,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastModifiedTime.present) {
      map['last_modified_time'] = Variable<DateTime>(lastModifiedTime.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimestampsCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('time: $time, ')
          ..write('date: $date, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _settingsIdMeta = const VerificationMeta(
    'settingsId',
  );
  @override
  late final GeneratedColumn<int> settingsId = GeneratedColumn<int>(
    'settings_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumn<bool> theme = GeneratedColumn<bool>(
    'theme',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("theme" IN (0, 1))',
    ),
  );
  static const VerificationMeta _fontTextMeta = const VerificationMeta(
    'fontText',
  );
  @override
  late final GeneratedColumn<String> fontText = GeneratedColumn<String>(
    'font_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reducedMotionMeta = const VerificationMeta(
    'reducedMotion',
  );
  @override
  late final GeneratedColumn<bool> reducedMotion = GeneratedColumn<bool>(
    'reduced_motion',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reduced_motion" IN (0, 1))',
    ),
  );
  static const VerificationMeta _fontSizeMeta = const VerificationMeta(
    'fontSize',
  );
  @override
  late final GeneratedColumn<int> fontSize = GeneratedColumn<int>(
    'font_size',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    lastModifiedTime,
    settingsId,
    theme,
    fontText,
    reducedMotion,
    fontSize,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Setting> instance, {
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
    if (data.containsKey('settings_id')) {
      context.handle(
        _settingsIdMeta,
        settingsId.isAcceptableOrUnknown(data['settings_id']!, _settingsIdMeta),
      );
    }
    if (data.containsKey('theme')) {
      context.handle(
        _themeMeta,
        theme.isAcceptableOrUnknown(data['theme']!, _themeMeta),
      );
    } else if (isInserting) {
      context.missing(_themeMeta);
    }
    if (data.containsKey('font_text')) {
      context.handle(
        _fontTextMeta,
        fontText.isAcceptableOrUnknown(data['font_text']!, _fontTextMeta),
      );
    } else if (isInserting) {
      context.missing(_fontTextMeta);
    }
    if (data.containsKey('reduced_motion')) {
      context.handle(
        _reducedMotionMeta,
        reducedMotion.isAcceptableOrUnknown(
          data['reduced_motion']!,
          _reducedMotionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_reducedMotionMeta);
    }
    if (data.containsKey('font_size')) {
      context.handle(
        _fontSizeMeta,
        fontSize.isAcceptableOrUnknown(data['font_size']!, _fontSizeMeta),
      );
    } else if (isInserting) {
      context.missing(_fontSizeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {settingsId};
  @override
  Setting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Setting(
      lastModifiedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_time'],
      )!,
      settingsId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}settings_id'],
      )!,
      theme: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}theme'],
      )!,
      fontText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}font_text'],
      )!,
      reducedMotion: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reduced_motion'],
      )!,
      fontSize: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}font_size'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final DateTime lastModifiedTime;
  final int settingsId;
  final bool theme;
  final String fontText;
  final bool reducedMotion;
  final int fontSize;
  const Setting({
    required this.lastModifiedTime,
    required this.settingsId,
    required this.theme,
    required this.fontText,
    required this.reducedMotion,
    required this.fontSize,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['settings_id'] = Variable<int>(settingsId);
    map['theme'] = Variable<bool>(theme);
    map['font_text'] = Variable<String>(fontText);
    map['reduced_motion'] = Variable<bool>(reducedMotion);
    map['font_size'] = Variable<int>(fontSize);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      settingsId: Value(settingsId),
      theme: Value(theme),
      fontText: Value(fontText),
      reducedMotion: Value(reducedMotion),
      fontSize: Value(fontSize),
    );
  }

  factory Setting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Setting(
      lastModifiedTime: serializer.fromJson<DateTime>(json['lastModifiedTime']),
      settingsId: serializer.fromJson<int>(json['settingsId']),
      theme: serializer.fromJson<bool>(json['theme']),
      fontText: serializer.fromJson<String>(json['fontText']),
      reducedMotion: serializer.fromJson<bool>(json['reducedMotion']),
      fontSize: serializer.fromJson<int>(json['fontSize']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'settingsId': serializer.toJson<int>(settingsId),
      'theme': serializer.toJson<bool>(theme),
      'fontText': serializer.toJson<String>(fontText),
      'reducedMotion': serializer.toJson<bool>(reducedMotion),
      'fontSize': serializer.toJson<int>(fontSize),
    };
  }

  Setting copyWith({
    DateTime? lastModifiedTime,
    int? settingsId,
    bool? theme,
    String? fontText,
    bool? reducedMotion,
    int? fontSize,
  }) => Setting(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    settingsId: settingsId ?? this.settingsId,
    theme: theme ?? this.theme,
    fontText: fontText ?? this.fontText,
    reducedMotion: reducedMotion ?? this.reducedMotion,
    fontSize: fontSize ?? this.fontSize,
  );
  Setting copyWithCompanion(SettingsCompanion data) {
    return Setting(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      settingsId: data.settingsId.present
          ? data.settingsId.value
          : this.settingsId,
      theme: data.theme.present ? data.theme.value : this.theme,
      fontText: data.fontText.present ? data.fontText.value : this.fontText,
      reducedMotion: data.reducedMotion.present
          ? data.reducedMotion.value
          : this.reducedMotion,
      fontSize: data.fontSize.present ? data.fontSize.value : this.fontSize,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('settingsId: $settingsId, ')
          ..write('theme: $theme, ')
          ..write('fontText: $fontText, ')
          ..write('reducedMotion: $reducedMotion, ')
          ..write('fontSize: $fontSize')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    lastModifiedTime,
    settingsId,
    theme,
    fontText,
    reducedMotion,
    fontSize,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Setting &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.settingsId == this.settingsId &&
          other.theme == this.theme &&
          other.fontText == this.fontText &&
          other.reducedMotion == this.reducedMotion &&
          other.fontSize == this.fontSize);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> settingsId;
  final Value<bool> theme;
  final Value<String> fontText;
  final Value<bool> reducedMotion;
  final Value<int> fontSize;
  const SettingsCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.settingsId = const Value.absent(),
    this.theme = const Value.absent(),
    this.fontText = const Value.absent(),
    this.reducedMotion = const Value.absent(),
    this.fontSize = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.settingsId = const Value.absent(),
    required bool theme,
    required String fontText,
    required bool reducedMotion,
    required int fontSize,
  }) : theme = Value(theme),
       fontText = Value(fontText),
       reducedMotion = Value(reducedMotion),
       fontSize = Value(fontSize);
  static Insertable<Setting> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? settingsId,
    Expression<bool>? theme,
    Expression<String>? fontText,
    Expression<bool>? reducedMotion,
    Expression<int>? fontSize,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (settingsId != null) 'settings_id': settingsId,
      if (theme != null) 'theme': theme,
      if (fontText != null) 'font_text': fontText,
      if (reducedMotion != null) 'reduced_motion': reducedMotion,
      if (fontSize != null) 'font_size': fontSize,
    });
  }

  SettingsCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? settingsId,
    Value<bool>? theme,
    Value<String>? fontText,
    Value<bool>? reducedMotion,
    Value<int>? fontSize,
  }) {
    return SettingsCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      settingsId: settingsId ?? this.settingsId,
      theme: theme ?? this.theme,
      fontText: fontText ?? this.fontText,
      reducedMotion: reducedMotion ?? this.reducedMotion,
      fontSize: fontSize ?? this.fontSize,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastModifiedTime.present) {
      map['last_modified_time'] = Variable<DateTime>(lastModifiedTime.value);
    }
    if (settingsId.present) {
      map['settings_id'] = Variable<int>(settingsId.value);
    }
    if (theme.present) {
      map['theme'] = Variable<bool>(theme.value);
    }
    if (fontText.present) {
      map['font_text'] = Variable<String>(fontText.value);
    }
    if (reducedMotion.present) {
      map['reduced_motion'] = Variable<bool>(reducedMotion.value);
    }
    if (fontSize.present) {
      map['font_size'] = Variable<int>(fontSize.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('settingsId: $settingsId, ')
          ..write('theme: $theme, ')
          ..write('fontText: $fontText, ')
          ..write('reducedMotion: $reducedMotion, ')
          ..write('fontSize: $fontSize')
          ..write(')'))
        .toString();
  }
}

class $UserInfoTable extends UserInfo
    with TableInfo<$UserInfoTable, UserInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserInfoTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _infoIdMeta = const VerificationMeta('infoId');
  @override
  late final GeneratedColumn<int> infoId = GeneratedColumn<int>(
    'info_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<DateTime> dob = GeneratedColumn<DateTime>(
    'dob',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
    'height',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    lastModifiedTime,
    infoId,
    name,
    weight,
    dob,
    height,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_info';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserInfoData> instance, {
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
    if (data.containsKey('info_id')) {
      context.handle(
        _infoIdMeta,
        infoId.isAcceptableOrUnknown(data['info_id']!, _infoIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('dob')) {
      context.handle(
        _dobMeta,
        dob.isAcceptableOrUnknown(data['dob']!, _dobMeta),
      );
    } else if (isInserting) {
      context.missing(_dobMeta);
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    } else if (isInserting) {
      context.missing(_heightMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {infoId};
  @override
  UserInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserInfoData(
      lastModifiedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_time'],
      )!,
      infoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}info_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight'],
      )!,
      dob: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}dob'],
      )!,
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}height'],
      )!,
    );
  }

  @override
  $UserInfoTable createAlias(String alias) {
    return $UserInfoTable(attachedDatabase, alias);
  }
}

class UserInfoData extends DataClass implements Insertable<UserInfoData> {
  final DateTime lastModifiedTime;
  final int infoId;
  final String name;
  final double weight;
  final DateTime dob;
  final double height;
  const UserInfoData({
    required this.lastModifiedTime,
    required this.infoId,
    required this.name,
    required this.weight,
    required this.dob,
    required this.height,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['info_id'] = Variable<int>(infoId);
    map['name'] = Variable<String>(name);
    map['weight'] = Variable<double>(weight);
    map['dob'] = Variable<DateTime>(dob);
    map['height'] = Variable<double>(height);
    return map;
  }

  UserInfoCompanion toCompanion(bool nullToAbsent) {
    return UserInfoCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      infoId: Value(infoId),
      name: Value(name),
      weight: Value(weight),
      dob: Value(dob),
      height: Value(height),
    );
  }

  factory UserInfoData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserInfoData(
      lastModifiedTime: serializer.fromJson<DateTime>(json['lastModifiedTime']),
      infoId: serializer.fromJson<int>(json['infoId']),
      name: serializer.fromJson<String>(json['name']),
      weight: serializer.fromJson<double>(json['weight']),
      dob: serializer.fromJson<DateTime>(json['dob']),
      height: serializer.fromJson<double>(json['height']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'infoId': serializer.toJson<int>(infoId),
      'name': serializer.toJson<String>(name),
      'weight': serializer.toJson<double>(weight),
      'dob': serializer.toJson<DateTime>(dob),
      'height': serializer.toJson<double>(height),
    };
  }

  UserInfoData copyWith({
    DateTime? lastModifiedTime,
    int? infoId,
    String? name,
    double? weight,
    DateTime? dob,
    double? height,
  }) => UserInfoData(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    infoId: infoId ?? this.infoId,
    name: name ?? this.name,
    weight: weight ?? this.weight,
    dob: dob ?? this.dob,
    height: height ?? this.height,
  );
  UserInfoData copyWithCompanion(UserInfoCompanion data) {
    return UserInfoData(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      infoId: data.infoId.present ? data.infoId.value : this.infoId,
      name: data.name.present ? data.name.value : this.name,
      weight: data.weight.present ? data.weight.value : this.weight,
      dob: data.dob.present ? data.dob.value : this.dob,
      height: data.height.present ? data.height.value : this.height,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserInfoData(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('infoId: $infoId, ')
          ..write('name: $name, ')
          ..write('weight: $weight, ')
          ..write('dob: $dob, ')
          ..write('height: $height')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(lastModifiedTime, infoId, name, weight, dob, height);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserInfoData &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.infoId == this.infoId &&
          other.name == this.name &&
          other.weight == this.weight &&
          other.dob == this.dob &&
          other.height == this.height);
}

class UserInfoCompanion extends UpdateCompanion<UserInfoData> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> infoId;
  final Value<String> name;
  final Value<double> weight;
  final Value<DateTime> dob;
  final Value<double> height;
  const UserInfoCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.infoId = const Value.absent(),
    this.name = const Value.absent(),
    this.weight = const Value.absent(),
    this.dob = const Value.absent(),
    this.height = const Value.absent(),
  });
  UserInfoCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.infoId = const Value.absent(),
    required String name,
    required double weight,
    required DateTime dob,
    required double height,
  }) : name = Value(name),
       weight = Value(weight),
       dob = Value(dob),
       height = Value(height);
  static Insertable<UserInfoData> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? infoId,
    Expression<String>? name,
    Expression<double>? weight,
    Expression<DateTime>? dob,
    Expression<double>? height,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (infoId != null) 'info_id': infoId,
      if (name != null) 'name': name,
      if (weight != null) 'weight': weight,
      if (dob != null) 'dob': dob,
      if (height != null) 'height': height,
    });
  }

  UserInfoCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? infoId,
    Value<String>? name,
    Value<double>? weight,
    Value<DateTime>? dob,
    Value<double>? height,
  }) {
    return UserInfoCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      infoId: infoId ?? this.infoId,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      dob: dob ?? this.dob,
      height: height ?? this.height,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastModifiedTime.present) {
      map['last_modified_time'] = Variable<DateTime>(lastModifiedTime.value);
    }
    if (infoId.present) {
      map['info_id'] = Variable<int>(infoId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (dob.present) {
      map['dob'] = Variable<DateTime>(dob.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserInfoCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('infoId: $infoId, ')
          ..write('name: $name, ')
          ..write('weight: $weight, ')
          ..write('dob: $dob, ')
          ..write('height: $height')
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
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timestamps (time)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    lastModifiedTime,
    notificationId,
    notifHeader,
    notifBody,
    timestamp,
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
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
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
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
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
  final DateTime timestamp;
  const Notification({
    required this.lastModifiedTime,
    required this.notificationId,
    required this.notifHeader,
    required this.notifBody,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['notification_id'] = Variable<int>(notificationId);
    map['notif_header'] = Variable<String>(notifHeader);
    map['notif_body'] = Variable<String>(notifBody);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  NotificationsCompanion toCompanion(bool nullToAbsent) {
    return NotificationsCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      notificationId: Value(notificationId),
      notifHeader: Value(notifHeader),
      notifBody: Value(notifBody),
      timestamp: Value(timestamp),
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
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
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
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  Notification copyWith({
    DateTime? lastModifiedTime,
    int? notificationId,
    String? notifHeader,
    String? notifBody,
    DateTime? timestamp,
  }) => Notification(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    notificationId: notificationId ?? this.notificationId,
    notifHeader: notifHeader ?? this.notifHeader,
    notifBody: notifBody ?? this.notifBody,
    timestamp: timestamp ?? this.timestamp,
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
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Notification(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('notificationId: $notificationId, ')
          ..write('notifHeader: $notifHeader, ')
          ..write('notifBody: $notifBody, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    lastModifiedTime,
    notificationId,
    notifHeader,
    notifBody,
    timestamp,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Notification &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.notificationId == this.notificationId &&
          other.notifHeader == this.notifHeader &&
          other.notifBody == this.notifBody &&
          other.timestamp == this.timestamp);
}

class NotificationsCompanion extends UpdateCompanion<Notification> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> notificationId;
  final Value<String> notifHeader;
  final Value<String> notifBody;
  final Value<DateTime> timestamp;
  const NotificationsCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.notificationId = const Value.absent(),
    this.notifHeader = const Value.absent(),
    this.notifBody = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  NotificationsCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.notificationId = const Value.absent(),
    required String notifHeader,
    required String notifBody,
    required DateTime timestamp,
  }) : notifHeader = Value(notifHeader),
       notifBody = Value(notifBody),
       timestamp = Value(timestamp);
  static Insertable<Notification> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? notificationId,
    Expression<String>? notifHeader,
    Expression<String>? notifBody,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (notificationId != null) 'notification_id': notificationId,
      if (notifHeader != null) 'notif_header': notifHeader,
      if (notifBody != null) 'notif_body': notifBody,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  NotificationsCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? notificationId,
    Value<String>? notifHeader,
    Value<String>? notifBody,
    Value<DateTime>? timestamp,
  }) {
    return NotificationsCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      notificationId: notificationId ?? this.notificationId,
      notifHeader: notifHeader ?? this.notifHeader,
      notifBody: notifBody ?? this.notifBody,
      timestamp: timestamp ?? this.timestamp,
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
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
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
          ..write('timestamp: $timestamp')
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
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timestamps (time)',
    ),
  );
  static const VerificationMeta _stepsMeta = const VerificationMeta('steps');
  @override
  late final GeneratedColumn<int> steps = GeneratedColumn<int>(
    'steps',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    lastModifiedTime,
    stepsId,
    timestamp,
    steps,
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
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('steps')) {
      context.handle(
        _stepsMeta,
        steps.isAcceptableOrUnknown(data['steps']!, _stepsMeta),
      );
    } else if (isInserting) {
      context.missing(_stepsMeta);
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
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      steps: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}steps'],
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
  final DateTime timestamp;
  final int steps;
  const Step({
    required this.lastModifiedTime,
    required this.stepsId,
    required this.timestamp,
    required this.steps,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['steps_id'] = Variable<int>(stepsId);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['steps'] = Variable<int>(steps);
    return map;
  }

  StepsCompanion toCompanion(bool nullToAbsent) {
    return StepsCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      stepsId: Value(stepsId),
      timestamp: Value(timestamp),
      steps: Value(steps),
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
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      steps: serializer.fromJson<int>(json['steps']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'stepsId': serializer.toJson<int>(stepsId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'steps': serializer.toJson<int>(steps),
    };
  }

  Step copyWith({
    DateTime? lastModifiedTime,
    int? stepsId,
    DateTime? timestamp,
    int? steps,
  }) => Step(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    stepsId: stepsId ?? this.stepsId,
    timestamp: timestamp ?? this.timestamp,
    steps: steps ?? this.steps,
  );
  Step copyWithCompanion(StepsCompanion data) {
    return Step(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      stepsId: data.stepsId.present ? data.stepsId.value : this.stepsId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      steps: data.steps.present ? data.steps.value : this.steps,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Step(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('stepsId: $stepsId, ')
          ..write('timestamp: $timestamp, ')
          ..write('steps: $steps')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(lastModifiedTime, stepsId, timestamp, steps);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Step &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.stepsId == this.stepsId &&
          other.timestamp == this.timestamp &&
          other.steps == this.steps);
}

class StepsCompanion extends UpdateCompanion<Step> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> stepsId;
  final Value<DateTime> timestamp;
  final Value<int> steps;
  const StepsCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.stepsId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.steps = const Value.absent(),
  });
  StepsCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.stepsId = const Value.absent(),
    required DateTime timestamp,
    required int steps,
  }) : timestamp = Value(timestamp),
       steps = Value(steps);
  static Insertable<Step> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? stepsId,
    Expression<DateTime>? timestamp,
    Expression<int>? steps,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (stepsId != null) 'steps_id': stepsId,
      if (timestamp != null) 'timestamp': timestamp,
      if (steps != null) 'steps': steps,
    });
  }

  StepsCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? stepsId,
    Value<DateTime>? timestamp,
    Value<int>? steps,
  }) {
    return StepsCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      stepsId: stepsId ?? this.stepsId,
      timestamp: timestamp ?? this.timestamp,
      steps: steps ?? this.steps,
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
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (steps.present) {
      map['steps'] = Variable<int>(steps.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StepsCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('stepsId: $stepsId, ')
          ..write('timestamp: $timestamp, ')
          ..write('steps: $steps')
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
  static const VerificationMeta _hrvMeta = const VerificationMeta('hrv');
  @override
  late final GeneratedColumn<int> hrv = GeneratedColumn<int>(
    'hrv',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timestamps (time)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [lastModifiedTime, hrv, timestamp];
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
    if (data.containsKey('hrv')) {
      context.handle(
        _hrvMeta,
        hrv.isAcceptableOrUnknown(data['hrv']!, _hrvMeta),
      );
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {hrv};
  @override
  HrvData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HrvData(
      lastModifiedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_time'],
      )!,
      hrv: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hrv'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
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
  final int hrv;
  final DateTime timestamp;
  const HrvData({
    required this.lastModifiedTime,
    required this.hrv,
    required this.timestamp,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['hrv'] = Variable<int>(hrv);
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  HrvCompanion toCompanion(bool nullToAbsent) {
    return HrvCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      hrv: Value(hrv),
      timestamp: Value(timestamp),
    );
  }

  factory HrvData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HrvData(
      lastModifiedTime: serializer.fromJson<DateTime>(json['lastModifiedTime']),
      hrv: serializer.fromJson<int>(json['hrv']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'hrv': serializer.toJson<int>(hrv),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  HrvData copyWith({
    DateTime? lastModifiedTime,
    int? hrv,
    DateTime? timestamp,
  }) => HrvData(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    hrv: hrv ?? this.hrv,
    timestamp: timestamp ?? this.timestamp,
  );
  HrvData copyWithCompanion(HrvCompanion data) {
    return HrvData(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      hrv: data.hrv.present ? data.hrv.value : this.hrv,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HrvData(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('hrv: $hrv, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(lastModifiedTime, hrv, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HrvData &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.hrv == this.hrv &&
          other.timestamp == this.timestamp);
}

class HrvCompanion extends UpdateCompanion<HrvData> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> hrv;
  final Value<DateTime> timestamp;
  const HrvCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.hrv = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  HrvCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.hrv = const Value.absent(),
    required DateTime timestamp,
  }) : timestamp = Value(timestamp);
  static Insertable<HrvData> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? hrv,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (hrv != null) 'hrv': hrv,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  HrvCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? hrv,
    Value<DateTime>? timestamp,
  }) {
    return HrvCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      hrv: hrv ?? this.hrv,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastModifiedTime.present) {
      map['last_modified_time'] = Variable<DateTime>(lastModifiedTime.value);
    }
    if (hrv.present) {
      map['hrv'] = Variable<int>(hrv.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HrvCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('hrv: $hrv, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $HeartRateZonesTable extends HeartRateZones
    with TableInfo<$HeartRateZonesTable, HeartRateZone> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HeartRateZonesTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _hrZoneIdMeta = const VerificationMeta(
    'hrZoneId',
  );
  @override
  late final GeneratedColumn<int> hrZoneId = GeneratedColumn<int>(
    'hr_zone_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _restingLowerMeta = const VerificationMeta(
    'restingLower',
  );
  @override
  late final GeneratedColumn<int> restingLower = GeneratedColumn<int>(
    'resting_lower',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _restingUpperMeta = const VerificationMeta(
    'restingUpper',
  );
  @override
  late final GeneratedColumn<int> restingUpper = GeneratedColumn<int>(
    'resting_upper',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseLowerMeta = const VerificationMeta(
    'exerciseLower',
  );
  @override
  late final GeneratedColumn<int> exerciseLower = GeneratedColumn<int>(
    'exercise_lower',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exerciseHigherMeta = const VerificationMeta(
    'exerciseHigher',
  );
  @override
  late final GeneratedColumn<int> exerciseHigher = GeneratedColumn<int>(
    'exercise_higher',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exertionLowerMeta = const VerificationMeta(
    'exertionLower',
  );
  @override
  late final GeneratedColumn<int> exertionLower = GeneratedColumn<int>(
    'exertion_lower',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _exertionUpperMeta = const VerificationMeta(
    'exertionUpper',
  );
  @override
  late final GeneratedColumn<int> exertionUpper = GeneratedColumn<int>(
    'exertion_upper',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    lastModifiedTime,
    hrZoneId,
    restingLower,
    restingUpper,
    exerciseLower,
    exerciseHigher,
    exertionLower,
    exertionUpper,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'heart_rate_zones';
  @override
  VerificationContext validateIntegrity(
    Insertable<HeartRateZone> instance, {
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
    if (data.containsKey('hr_zone_id')) {
      context.handle(
        _hrZoneIdMeta,
        hrZoneId.isAcceptableOrUnknown(data['hr_zone_id']!, _hrZoneIdMeta),
      );
    }
    if (data.containsKey('resting_lower')) {
      context.handle(
        _restingLowerMeta,
        restingLower.isAcceptableOrUnknown(
          data['resting_lower']!,
          _restingLowerMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_restingLowerMeta);
    }
    if (data.containsKey('resting_upper')) {
      context.handle(
        _restingUpperMeta,
        restingUpper.isAcceptableOrUnknown(
          data['resting_upper']!,
          _restingUpperMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_restingUpperMeta);
    }
    if (data.containsKey('exercise_lower')) {
      context.handle(
        _exerciseLowerMeta,
        exerciseLower.isAcceptableOrUnknown(
          data['exercise_lower']!,
          _exerciseLowerMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exerciseLowerMeta);
    }
    if (data.containsKey('exercise_higher')) {
      context.handle(
        _exerciseHigherMeta,
        exerciseHigher.isAcceptableOrUnknown(
          data['exercise_higher']!,
          _exerciseHigherMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exerciseHigherMeta);
    }
    if (data.containsKey('exertion_lower')) {
      context.handle(
        _exertionLowerMeta,
        exertionLower.isAcceptableOrUnknown(
          data['exertion_lower']!,
          _exertionLowerMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exertionLowerMeta);
    }
    if (data.containsKey('exertion_upper')) {
      context.handle(
        _exertionUpperMeta,
        exertionUpper.isAcceptableOrUnknown(
          data['exertion_upper']!,
          _exertionUpperMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_exertionUpperMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {hrZoneId};
  @override
  HeartRateZone map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HeartRateZone(
      lastModifiedTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified_time'],
      )!,
      hrZoneId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hr_zone_id'],
      )!,
      restingLower: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}resting_lower'],
      )!,
      restingUpper: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}resting_upper'],
      )!,
      exerciseLower: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exercise_lower'],
      )!,
      exerciseHigher: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exercise_higher'],
      )!,
      exertionLower: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exertion_lower'],
      )!,
      exertionUpper: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}exertion_upper'],
      )!,
    );
  }

  @override
  $HeartRateZonesTable createAlias(String alias) {
    return $HeartRateZonesTable(attachedDatabase, alias);
  }
}

class HeartRateZone extends DataClass implements Insertable<HeartRateZone> {
  final DateTime lastModifiedTime;
  final int hrZoneId;
  final int restingLower;
  final int restingUpper;
  final int exerciseLower;
  final int exerciseHigher;
  final int exertionLower;
  final int exertionUpper;
  const HeartRateZone({
    required this.lastModifiedTime,
    required this.hrZoneId,
    required this.restingLower,
    required this.restingUpper,
    required this.exerciseLower,
    required this.exerciseHigher,
    required this.exertionLower,
    required this.exertionUpper,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['hr_zone_id'] = Variable<int>(hrZoneId);
    map['resting_lower'] = Variable<int>(restingLower);
    map['resting_upper'] = Variable<int>(restingUpper);
    map['exercise_lower'] = Variable<int>(exerciseLower);
    map['exercise_higher'] = Variable<int>(exerciseHigher);
    map['exertion_lower'] = Variable<int>(exertionLower);
    map['exertion_upper'] = Variable<int>(exertionUpper);
    return map;
  }

  HeartRateZonesCompanion toCompanion(bool nullToAbsent) {
    return HeartRateZonesCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      hrZoneId: Value(hrZoneId),
      restingLower: Value(restingLower),
      restingUpper: Value(restingUpper),
      exerciseLower: Value(exerciseLower),
      exerciseHigher: Value(exerciseHigher),
      exertionLower: Value(exertionLower),
      exertionUpper: Value(exertionUpper),
    );
  }

  factory HeartRateZone.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HeartRateZone(
      lastModifiedTime: serializer.fromJson<DateTime>(json['lastModifiedTime']),
      hrZoneId: serializer.fromJson<int>(json['hrZoneId']),
      restingLower: serializer.fromJson<int>(json['restingLower']),
      restingUpper: serializer.fromJson<int>(json['restingUpper']),
      exerciseLower: serializer.fromJson<int>(json['exerciseLower']),
      exerciseHigher: serializer.fromJson<int>(json['exerciseHigher']),
      exertionLower: serializer.fromJson<int>(json['exertionLower']),
      exertionUpper: serializer.fromJson<int>(json['exertionUpper']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'hrZoneId': serializer.toJson<int>(hrZoneId),
      'restingLower': serializer.toJson<int>(restingLower),
      'restingUpper': serializer.toJson<int>(restingUpper),
      'exerciseLower': serializer.toJson<int>(exerciseLower),
      'exerciseHigher': serializer.toJson<int>(exerciseHigher),
      'exertionLower': serializer.toJson<int>(exertionLower),
      'exertionUpper': serializer.toJson<int>(exertionUpper),
    };
  }

  HeartRateZone copyWith({
    DateTime? lastModifiedTime,
    int? hrZoneId,
    int? restingLower,
    int? restingUpper,
    int? exerciseLower,
    int? exerciseHigher,
    int? exertionLower,
    int? exertionUpper,
  }) => HeartRateZone(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    hrZoneId: hrZoneId ?? this.hrZoneId,
    restingLower: restingLower ?? this.restingLower,
    restingUpper: restingUpper ?? this.restingUpper,
    exerciseLower: exerciseLower ?? this.exerciseLower,
    exerciseHigher: exerciseHigher ?? this.exerciseHigher,
    exertionLower: exertionLower ?? this.exertionLower,
    exertionUpper: exertionUpper ?? this.exertionUpper,
  );
  HeartRateZone copyWithCompanion(HeartRateZonesCompanion data) {
    return HeartRateZone(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      hrZoneId: data.hrZoneId.present ? data.hrZoneId.value : this.hrZoneId,
      restingLower: data.restingLower.present
          ? data.restingLower.value
          : this.restingLower,
      restingUpper: data.restingUpper.present
          ? data.restingUpper.value
          : this.restingUpper,
      exerciseLower: data.exerciseLower.present
          ? data.exerciseLower.value
          : this.exerciseLower,
      exerciseHigher: data.exerciseHigher.present
          ? data.exerciseHigher.value
          : this.exerciseHigher,
      exertionLower: data.exertionLower.present
          ? data.exertionLower.value
          : this.exertionLower,
      exertionUpper: data.exertionUpper.present
          ? data.exertionUpper.value
          : this.exertionUpper,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HeartRateZone(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('hrZoneId: $hrZoneId, ')
          ..write('restingLower: $restingLower, ')
          ..write('restingUpper: $restingUpper, ')
          ..write('exerciseLower: $exerciseLower, ')
          ..write('exerciseHigher: $exerciseHigher, ')
          ..write('exertionLower: $exertionLower, ')
          ..write('exertionUpper: $exertionUpper')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    lastModifiedTime,
    hrZoneId,
    restingLower,
    restingUpper,
    exerciseLower,
    exerciseHigher,
    exertionLower,
    exertionUpper,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HeartRateZone &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.hrZoneId == this.hrZoneId &&
          other.restingLower == this.restingLower &&
          other.restingUpper == this.restingUpper &&
          other.exerciseLower == this.exerciseLower &&
          other.exerciseHigher == this.exerciseHigher &&
          other.exertionLower == this.exertionLower &&
          other.exertionUpper == this.exertionUpper);
}

class HeartRateZonesCompanion extends UpdateCompanion<HeartRateZone> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> hrZoneId;
  final Value<int> restingLower;
  final Value<int> restingUpper;
  final Value<int> exerciseLower;
  final Value<int> exerciseHigher;
  final Value<int> exertionLower;
  final Value<int> exertionUpper;
  const HeartRateZonesCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.hrZoneId = const Value.absent(),
    this.restingLower = const Value.absent(),
    this.restingUpper = const Value.absent(),
    this.exerciseLower = const Value.absent(),
    this.exerciseHigher = const Value.absent(),
    this.exertionLower = const Value.absent(),
    this.exertionUpper = const Value.absent(),
  });
  HeartRateZonesCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.hrZoneId = const Value.absent(),
    required int restingLower,
    required int restingUpper,
    required int exerciseLower,
    required int exerciseHigher,
    required int exertionLower,
    required int exertionUpper,
  }) : restingLower = Value(restingLower),
       restingUpper = Value(restingUpper),
       exerciseLower = Value(exerciseLower),
       exerciseHigher = Value(exerciseHigher),
       exertionLower = Value(exertionLower),
       exertionUpper = Value(exertionUpper);
  static Insertable<HeartRateZone> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? hrZoneId,
    Expression<int>? restingLower,
    Expression<int>? restingUpper,
    Expression<int>? exerciseLower,
    Expression<int>? exerciseHigher,
    Expression<int>? exertionLower,
    Expression<int>? exertionUpper,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (hrZoneId != null) 'hr_zone_id': hrZoneId,
      if (restingLower != null) 'resting_lower': restingLower,
      if (restingUpper != null) 'resting_upper': restingUpper,
      if (exerciseLower != null) 'exercise_lower': exerciseLower,
      if (exerciseHigher != null) 'exercise_higher': exerciseHigher,
      if (exertionLower != null) 'exertion_lower': exertionLower,
      if (exertionUpper != null) 'exertion_upper': exertionUpper,
    });
  }

  HeartRateZonesCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? hrZoneId,
    Value<int>? restingLower,
    Value<int>? restingUpper,
    Value<int>? exerciseLower,
    Value<int>? exerciseHigher,
    Value<int>? exertionLower,
    Value<int>? exertionUpper,
  }) {
    return HeartRateZonesCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      hrZoneId: hrZoneId ?? this.hrZoneId,
      restingLower: restingLower ?? this.restingLower,
      restingUpper: restingUpper ?? this.restingUpper,
      exerciseLower: exerciseLower ?? this.exerciseLower,
      exerciseHigher: exerciseHigher ?? this.exerciseHigher,
      exertionLower: exertionLower ?? this.exertionLower,
      exertionUpper: exertionUpper ?? this.exertionUpper,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lastModifiedTime.present) {
      map['last_modified_time'] = Variable<DateTime>(lastModifiedTime.value);
    }
    if (hrZoneId.present) {
      map['hr_zone_id'] = Variable<int>(hrZoneId.value);
    }
    if (restingLower.present) {
      map['resting_lower'] = Variable<int>(restingLower.value);
    }
    if (restingUpper.present) {
      map['resting_upper'] = Variable<int>(restingUpper.value);
    }
    if (exerciseLower.present) {
      map['exercise_lower'] = Variable<int>(exerciseLower.value);
    }
    if (exerciseHigher.present) {
      map['exercise_higher'] = Variable<int>(exerciseHigher.value);
    }
    if (exertionLower.present) {
      map['exertion_lower'] = Variable<int>(exertionLower.value);
    }
    if (exertionUpper.present) {
      map['exertion_upper'] = Variable<int>(exertionUpper.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HeartRateZonesCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('hrZoneId: $hrZoneId, ')
          ..write('restingLower: $restingLower, ')
          ..write('restingUpper: $restingUpper, ')
          ..write('exerciseLower: $exerciseLower, ')
          ..write('exerciseHigher: $exerciseHigher, ')
          ..write('exertionLower: $exertionLower, ')
          ..write('exertionUpper: $exertionUpper')
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
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES timestamps (time)',
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
  static const VerificationMeta _hrZoneMeta = const VerificationMeta('hrZone');
  @override
  late final GeneratedColumn<int> hrZone = GeneratedColumn<int>(
    'hr_zone',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES heart_rate_zones (hr_zone_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    lastModifiedTime,
    hrId,
    timestamp,
    dailyAvg,
    hrZone,
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
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('daily_avg')) {
      context.handle(
        _dailyAvgMeta,
        dailyAvg.isAcceptableOrUnknown(data['daily_avg']!, _dailyAvgMeta),
      );
    } else if (isInserting) {
      context.missing(_dailyAvgMeta);
    }
    if (data.containsKey('hr_zone')) {
      context.handle(
        _hrZoneMeta,
        hrZone.isAcceptableOrUnknown(data['hr_zone']!, _hrZoneMeta),
      );
    } else if (isInserting) {
      context.missing(_hrZoneMeta);
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
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      dailyAvg: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_avg'],
      )!,
      hrZone: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hr_zone'],
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
  final DateTime timestamp;
  final int dailyAvg;
  final int hrZone;
  const HeartRateData({
    required this.lastModifiedTime,
    required this.hrId,
    required this.timestamp,
    required this.dailyAvg,
    required this.hrZone,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['hr_id'] = Variable<int>(hrId);
    map['timestamp'] = Variable<DateTime>(timestamp);
    map['daily_avg'] = Variable<int>(dailyAvg);
    map['hr_zone'] = Variable<int>(hrZone);
    return map;
  }

  HeartRateCompanion toCompanion(bool nullToAbsent) {
    return HeartRateCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      hrId: Value(hrId),
      timestamp: Value(timestamp),
      dailyAvg: Value(dailyAvg),
      hrZone: Value(hrZone),
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
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      dailyAvg: serializer.fromJson<int>(json['dailyAvg']),
      hrZone: serializer.fromJson<int>(json['hrZone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'hrId': serializer.toJson<int>(hrId),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'dailyAvg': serializer.toJson<int>(dailyAvg),
      'hrZone': serializer.toJson<int>(hrZone),
    };
  }

  HeartRateData copyWith({
    DateTime? lastModifiedTime,
    int? hrId,
    DateTime? timestamp,
    int? dailyAvg,
    int? hrZone,
  }) => HeartRateData(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    hrId: hrId ?? this.hrId,
    timestamp: timestamp ?? this.timestamp,
    dailyAvg: dailyAvg ?? this.dailyAvg,
    hrZone: hrZone ?? this.hrZone,
  );
  HeartRateData copyWithCompanion(HeartRateCompanion data) {
    return HeartRateData(
      lastModifiedTime: data.lastModifiedTime.present
          ? data.lastModifiedTime.value
          : this.lastModifiedTime,
      hrId: data.hrId.present ? data.hrId.value : this.hrId,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      dailyAvg: data.dailyAvg.present ? data.dailyAvg.value : this.dailyAvg,
      hrZone: data.hrZone.present ? data.hrZone.value : this.hrZone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HeartRateData(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('hrId: $hrId, ')
          ..write('timestamp: $timestamp, ')
          ..write('dailyAvg: $dailyAvg, ')
          ..write('hrZone: $hrZone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(lastModifiedTime, hrId, timestamp, dailyAvg, hrZone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HeartRateData &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.hrId == this.hrId &&
          other.timestamp == this.timestamp &&
          other.dailyAvg == this.dailyAvg &&
          other.hrZone == this.hrZone);
}

class HeartRateCompanion extends UpdateCompanion<HeartRateData> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> hrId;
  final Value<DateTime> timestamp;
  final Value<int> dailyAvg;
  final Value<int> hrZone;
  const HeartRateCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.hrId = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.dailyAvg = const Value.absent(),
    this.hrZone = const Value.absent(),
  });
  HeartRateCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.hrId = const Value.absent(),
    required DateTime timestamp,
    required int dailyAvg,
    required int hrZone,
  }) : timestamp = Value(timestamp),
       dailyAvg = Value(dailyAvg),
       hrZone = Value(hrZone);
  static Insertable<HeartRateData> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? hrId,
    Expression<DateTime>? timestamp,
    Expression<int>? dailyAvg,
    Expression<int>? hrZone,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (hrId != null) 'hr_id': hrId,
      if (timestamp != null) 'timestamp': timestamp,
      if (dailyAvg != null) 'daily_avg': dailyAvg,
      if (hrZone != null) 'hr_zone': hrZone,
    });
  }

  HeartRateCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? hrId,
    Value<DateTime>? timestamp,
    Value<int>? dailyAvg,
    Value<int>? hrZone,
  }) {
    return HeartRateCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      hrId: hrId ?? this.hrId,
      timestamp: timestamp ?? this.timestamp,
      dailyAvg: dailyAvg ?? this.dailyAvg,
      hrZone: hrZone ?? this.hrZone,
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
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (dailyAvg.present) {
      map['daily_avg'] = Variable<int>(dailyAvg.value);
    }
    if (hrZone.present) {
      map['hr_zone'] = Variable<int>(hrZone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HeartRateCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('hrId: $hrId, ')
          ..write('timestamp: $timestamp, ')
          ..write('dailyAvg: $dailyAvg, ')
          ..write('hrZone: $hrZone')
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
  static const VerificationMeta _minHrDateMeta = const VerificationMeta(
    'minHrDate',
  );
  @override
  late final GeneratedColumn<DateTime> minHrDate = GeneratedColumn<DateTime>(
    'min_hr_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maxHrvMeta = const VerificationMeta('maxHrv');
  @override
  late final GeneratedColumn<int> maxHrv = GeneratedColumn<int>(
    'max_hrv',
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
    minHrDate,
    maxHrv,
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
    if (data.containsKey('min_hr_date')) {
      context.handle(
        _minHrDateMeta,
        minHrDate.isAcceptableOrUnknown(data['min_hr_date']!, _minHrDateMeta),
      );
    } else if (isInserting) {
      context.missing(_minHrDateMeta);
    }
    if (data.containsKey('max_hrv')) {
      context.handle(
        _maxHrvMeta,
        maxHrv.isAcceptableOrUnknown(data['max_hrv']!, _maxHrvMeta),
      );
    } else if (isInserting) {
      context.missing(_maxHrvMeta);
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
      minHrDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}min_hr_date'],
      )!,
      maxHrv: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}max_hrv'],
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
  final DateTime minHrDate;
  final int maxHrv;
  const BaselineData({
    required this.lastModifiedTime,
    required this.baselineId,
    required this.maxHr,
    required this.minHrDate,
    required this.maxHrv,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['baseline_id'] = Variable<int>(baselineId);
    map['max_hr'] = Variable<int>(maxHr);
    map['min_hr_date'] = Variable<DateTime>(minHrDate);
    map['max_hrv'] = Variable<int>(maxHrv);
    return map;
  }

  BaselineCompanion toCompanion(bool nullToAbsent) {
    return BaselineCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      baselineId: Value(baselineId),
      maxHr: Value(maxHr),
      minHrDate: Value(minHrDate),
      maxHrv: Value(maxHrv),
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
      minHrDate: serializer.fromJson<DateTime>(json['minHrDate']),
      maxHrv: serializer.fromJson<int>(json['maxHrv']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lastModifiedTime': serializer.toJson<DateTime>(lastModifiedTime),
      'baselineId': serializer.toJson<int>(baselineId),
      'maxHr': serializer.toJson<int>(maxHr),
      'minHrDate': serializer.toJson<DateTime>(minHrDate),
      'maxHrv': serializer.toJson<int>(maxHrv),
    };
  }

  BaselineData copyWith({
    DateTime? lastModifiedTime,
    int? baselineId,
    int? maxHr,
    DateTime? minHrDate,
    int? maxHrv,
  }) => BaselineData(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    baselineId: baselineId ?? this.baselineId,
    maxHr: maxHr ?? this.maxHr,
    minHrDate: minHrDate ?? this.minHrDate,
    maxHrv: maxHrv ?? this.maxHrv,
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
      minHrDate: data.minHrDate.present ? data.minHrDate.value : this.minHrDate,
      maxHrv: data.maxHrv.present ? data.maxHrv.value : this.maxHrv,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BaselineData(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('baselineId: $baselineId, ')
          ..write('maxHr: $maxHr, ')
          ..write('minHrDate: $minHrDate, ')
          ..write('maxHrv: $maxHrv')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(lastModifiedTime, baselineId, maxHr, minHrDate, maxHrv);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BaselineData &&
          other.lastModifiedTime == this.lastModifiedTime &&
          other.baselineId == this.baselineId &&
          other.maxHr == this.maxHr &&
          other.minHrDate == this.minHrDate &&
          other.maxHrv == this.maxHrv);
}

class BaselineCompanion extends UpdateCompanion<BaselineData> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> baselineId;
  final Value<int> maxHr;
  final Value<DateTime> minHrDate;
  final Value<int> maxHrv;
  const BaselineCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.baselineId = const Value.absent(),
    this.maxHr = const Value.absent(),
    this.minHrDate = const Value.absent(),
    this.maxHrv = const Value.absent(),
  });
  BaselineCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.baselineId = const Value.absent(),
    required int maxHr,
    required DateTime minHrDate,
    required int maxHrv,
  }) : maxHr = Value(maxHr),
       minHrDate = Value(minHrDate),
       maxHrv = Value(maxHrv);
  static Insertable<BaselineData> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? baselineId,
    Expression<int>? maxHr,
    Expression<DateTime>? minHrDate,
    Expression<int>? maxHrv,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (baselineId != null) 'baseline_id': baselineId,
      if (maxHr != null) 'max_hr': maxHr,
      if (minHrDate != null) 'min_hr_date': minHrDate,
      if (maxHrv != null) 'max_hrv': maxHrv,
    });
  }

  BaselineCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? baselineId,
    Value<int>? maxHr,
    Value<DateTime>? minHrDate,
    Value<int>? maxHrv,
  }) {
    return BaselineCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      baselineId: baselineId ?? this.baselineId,
      maxHr: maxHr ?? this.maxHr,
      minHrDate: minHrDate ?? this.minHrDate,
      maxHrv: maxHrv ?? this.maxHrv,
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
    if (minHrDate.present) {
      map['min_hr_date'] = Variable<DateTime>(minHrDate.value);
    }
    if (maxHrv.present) {
      map['max_hrv'] = Variable<int>(maxHrv.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BaselineCompanion(')
          ..write('lastModifiedTime: $lastModifiedTime, ')
          ..write('baselineId: $baselineId, ')
          ..write('maxHr: $maxHr, ')
          ..write('minHrDate: $minHrDate, ')
          ..write('maxHrv: $maxHrv')
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
  static const VerificationMeta _hrvMeta = const VerificationMeta('hrv');
  @override
  late final GeneratedColumn<int> hrv = GeneratedColumn<int>(
    'hrv',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES hrv (hrv)',
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
    hrv,
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
    if (data.containsKey('hrv')) {
      context.handle(
        _hrvMeta,
        hrv.isAcceptableOrUnknown(data['hrv']!, _hrvMeta),
      );
    } else if (isInserting) {
      context.missing(_hrvMeta);
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
      hrv: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}hrv'],
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
  final int hrv;
  final int baselineId;
  const HealthOverviewData({
    required this.lastModifiedTime,
    required this.healthScore,
    required this.sleepId,
    required this.stepsId,
    required this.hrv,
    required this.baselineId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['last_modified_time'] = Variable<DateTime>(lastModifiedTime);
    map['health_score'] = Variable<int>(healthScore);
    map['sleep_id'] = Variable<int>(sleepId);
    map['steps_id'] = Variable<int>(stepsId);
    map['hrv'] = Variable<int>(hrv);
    map['baseline_id'] = Variable<int>(baselineId);
    return map;
  }

  HealthOverviewCompanion toCompanion(bool nullToAbsent) {
    return HealthOverviewCompanion(
      lastModifiedTime: Value(lastModifiedTime),
      healthScore: Value(healthScore),
      sleepId: Value(sleepId),
      stepsId: Value(stepsId),
      hrv: Value(hrv),
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
      hrv: serializer.fromJson<int>(json['hrv']),
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
      'hrv': serializer.toJson<int>(hrv),
      'baselineId': serializer.toJson<int>(baselineId),
    };
  }

  HealthOverviewData copyWith({
    DateTime? lastModifiedTime,
    int? healthScore,
    int? sleepId,
    int? stepsId,
    int? hrv,
    int? baselineId,
  }) => HealthOverviewData(
    lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
    healthScore: healthScore ?? this.healthScore,
    sleepId: sleepId ?? this.sleepId,
    stepsId: stepsId ?? this.stepsId,
    hrv: hrv ?? this.hrv,
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
      hrv: data.hrv.present ? data.hrv.value : this.hrv,
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
          ..write('hrv: $hrv, ')
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
    hrv,
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
          other.hrv == this.hrv &&
          other.baselineId == this.baselineId);
}

class HealthOverviewCompanion extends UpdateCompanion<HealthOverviewData> {
  final Value<DateTime> lastModifiedTime;
  final Value<int> healthScore;
  final Value<int> sleepId;
  final Value<int> stepsId;
  final Value<int> hrv;
  final Value<int> baselineId;
  const HealthOverviewCompanion({
    this.lastModifiedTime = const Value.absent(),
    this.healthScore = const Value.absent(),
    this.sleepId = const Value.absent(),
    this.stepsId = const Value.absent(),
    this.hrv = const Value.absent(),
    this.baselineId = const Value.absent(),
  });
  HealthOverviewCompanion.insert({
    this.lastModifiedTime = const Value.absent(),
    this.healthScore = const Value.absent(),
    required int sleepId,
    required int stepsId,
    required int hrv,
    required int baselineId,
  }) : sleepId = Value(sleepId),
       stepsId = Value(stepsId),
       hrv = Value(hrv),
       baselineId = Value(baselineId);
  static Insertable<HealthOverviewData> custom({
    Expression<DateTime>? lastModifiedTime,
    Expression<int>? healthScore,
    Expression<int>? sleepId,
    Expression<int>? stepsId,
    Expression<int>? hrv,
    Expression<int>? baselineId,
  }) {
    return RawValuesInsertable({
      if (lastModifiedTime != null) 'last_modified_time': lastModifiedTime,
      if (healthScore != null) 'health_score': healthScore,
      if (sleepId != null) 'sleep_id': sleepId,
      if (stepsId != null) 'steps_id': stepsId,
      if (hrv != null) 'hrv': hrv,
      if (baselineId != null) 'baseline_id': baselineId,
    });
  }

  HealthOverviewCompanion copyWith({
    Value<DateTime>? lastModifiedTime,
    Value<int>? healthScore,
    Value<int>? sleepId,
    Value<int>? stepsId,
    Value<int>? hrv,
    Value<int>? baselineId,
  }) {
    return HealthOverviewCompanion(
      lastModifiedTime: lastModifiedTime ?? this.lastModifiedTime,
      healthScore: healthScore ?? this.healthScore,
      sleepId: sleepId ?? this.sleepId,
      stepsId: stepsId ?? this.stepsId,
      hrv: hrv ?? this.hrv,
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
    if (hrv.present) {
      map['hrv'] = Variable<int>(hrv.value);
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
          ..write('hrv: $hrv, ')
          ..write('baselineId: $baselineId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TimestampsTable timestamps = $TimestampsTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final $UserInfoTable userInfo = $UserInfoTable(this);
  late final $NotificationsTable notifications = $NotificationsTable(this);
  late final $SleepTable sleep = $SleepTable(this);
  late final $StepsTable steps = $StepsTable(this);
  late final $HrvTable hrv = $HrvTable(this);
  late final $HeartRateZonesTable heartRateZones = $HeartRateZonesTable(this);
  late final $HeartRateTable heartRate = $HeartRateTable(this);
  late final $BaselineTable baseline = $BaselineTable(this);
  late final $HealthOverviewTable healthOverview = $HealthOverviewTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    timestamps,
    settings,
    userInfo,
    notifications,
    sleep,
    steps,
    hrv,
    heartRateZones,
    heartRate,
    baseline,
    healthOverview,
  ];
}

typedef $$TimestampsTableCreateCompanionBuilder =
    TimestampsCompanion Function({
      Value<DateTime> lastModifiedTime,
      required DateTime time,
      required DateTime date,
      Value<int> rowid,
    });
typedef $$TimestampsTableUpdateCompanionBuilder =
    TimestampsCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<DateTime> time,
      Value<DateTime> date,
      Value<int> rowid,
    });

final class $$TimestampsTableReferences
    extends BaseReferences<_$AppDatabase, $TimestampsTable, Timestamp> {
  $$TimestampsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$NotificationsTable, List<Notification>>
  _notificationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.notifications,
    aliasName: $_aliasNameGenerator(
      db.timestamps.time,
      db.notifications.timestamp,
    ),
  );

  $$NotificationsTableProcessedTableManager get notificationsRefs {
    final manager = $$NotificationsTableTableManager($_db, $_db.notifications)
        .filter(
          (f) => f.timestamp.time.sqlEquals($_itemColumn<DateTime>('time')!),
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
    aliasName: $_aliasNameGenerator(db.timestamps.time, db.steps.timestamp),
  );

  $$StepsTableProcessedTableManager get stepsRefs {
    final manager = $$StepsTableTableManager($_db, $_db.steps).filter(
      (f) => f.timestamp.time.sqlEquals($_itemColumn<DateTime>('time')!),
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
    aliasName: $_aliasNameGenerator(db.timestamps.time, db.hrv.timestamp),
  );

  $$HrvTableProcessedTableManager get hrvRefs {
    final manager = $$HrvTableTableManager($_db, $_db.hrv).filter(
      (f) => f.timestamp.time.sqlEquals($_itemColumn<DateTime>('time')!),
    );

    final cache = $_typedResult.readTableOrNull(_hrvRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$HeartRateTable, List<HeartRateData>>
  _heartRateRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.heartRate,
    aliasName: $_aliasNameGenerator(db.timestamps.time, db.heartRate.timestamp),
  );

  $$HeartRateTableProcessedTableManager get heartRateRefs {
    final manager = $$HeartRateTableTableManager($_db, $_db.heartRate).filter(
      (f) => f.timestamp.time.sqlEquals($_itemColumn<DateTime>('time')!),
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

  ColumnFilters<DateTime> get time => $composableBuilder(
    column: $table.time,
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
      getCurrentColumn: (t) => t.time,
      referencedTable: $db.notifications,
      getReferencedColumn: (t) => t.timestamp,
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
      getCurrentColumn: (t) => t.time,
      referencedTable: $db.steps,
      getReferencedColumn: (t) => t.timestamp,
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
      getCurrentColumn: (t) => t.time,
      referencedTable: $db.hrv,
      getReferencedColumn: (t) => t.timestamp,
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
      getCurrentColumn: (t) => t.time,
      referencedTable: $db.heartRate,
      getReferencedColumn: (t) => t.timestamp,
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

  ColumnOrderings<DateTime> get time => $composableBuilder(
    column: $table.time,
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

  GeneratedColumn<DateTime> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  Expression<T> notificationsRefs<T extends Object>(
    Expression<T> Function($$NotificationsTableAnnotationComposer a) f,
  ) {
    final $$NotificationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.time,
      referencedTable: $db.notifications,
      getReferencedColumn: (t) => t.timestamp,
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
      getCurrentColumn: (t) => t.time,
      referencedTable: $db.steps,
      getReferencedColumn: (t) => t.timestamp,
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
      getCurrentColumn: (t) => t.time,
      referencedTable: $db.hrv,
      getReferencedColumn: (t) => t.timestamp,
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
      getCurrentColumn: (t) => t.time,
      referencedTable: $db.heartRate,
      getReferencedColumn: (t) => t.timestamp,
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
                Value<DateTime> time = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TimestampsCompanion(
                lastModifiedTime: lastModifiedTime,
                time: time,
                date: date,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                required DateTime time,
                required DateTime date,
                Value<int> rowid = const Value.absent(),
              }) => TimestampsCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                time: time,
                date: date,
                rowid: rowid,
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
                                (e) => e.timestamp == item.time,
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
                                (e) => e.timestamp == item.time,
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
                                (e) => e.timestamp == item.time,
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
                                (e) => e.timestamp == item.time,
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
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> settingsId,
      required bool theme,
      required String fontText,
      required bool reducedMotion,
      required int fontSize,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> settingsId,
      Value<bool> theme,
      Value<String> fontText,
      Value<bool> reducedMotion,
      Value<int> fontSize,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
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

  ColumnFilters<int> get settingsId => $composableBuilder(
    column: $table.settingsId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get theme => $composableBuilder(
    column: $table.theme,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fontText => $composableBuilder(
    column: $table.fontText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get reducedMotion => $composableBuilder(
    column: $table.reducedMotion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fontSize => $composableBuilder(
    column: $table.fontSize,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
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

  ColumnOrderings<int> get settingsId => $composableBuilder(
    column: $table.settingsId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get theme => $composableBuilder(
    column: $table.theme,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fontText => $composableBuilder(
    column: $table.fontText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get reducedMotion => $composableBuilder(
    column: $table.reducedMotion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fontSize => $composableBuilder(
    column: $table.fontSize,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
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

  GeneratedColumn<int> get settingsId => $composableBuilder(
    column: $table.settingsId,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get theme =>
      $composableBuilder(column: $table.theme, builder: (column) => column);

  GeneratedColumn<String> get fontText =>
      $composableBuilder(column: $table.fontText, builder: (column) => column);

  GeneratedColumn<bool> get reducedMotion => $composableBuilder(
    column: $table.reducedMotion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fontSize =>
      $composableBuilder(column: $table.fontSize, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          Setting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
          Setting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> settingsId = const Value.absent(),
                Value<bool> theme = const Value.absent(),
                Value<String> fontText = const Value.absent(),
                Value<bool> reducedMotion = const Value.absent(),
                Value<int> fontSize = const Value.absent(),
              }) => SettingsCompanion(
                lastModifiedTime: lastModifiedTime,
                settingsId: settingsId,
                theme: theme,
                fontText: fontText,
                reducedMotion: reducedMotion,
                fontSize: fontSize,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> settingsId = const Value.absent(),
                required bool theme,
                required String fontText,
                required bool reducedMotion,
                required int fontSize,
              }) => SettingsCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                settingsId: settingsId,
                theme: theme,
                fontText: fontText,
                reducedMotion: reducedMotion,
                fontSize: fontSize,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      Setting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (Setting, BaseReferences<_$AppDatabase, $SettingsTable, Setting>),
      Setting,
      PrefetchHooks Function()
    >;
typedef $$UserInfoTableCreateCompanionBuilder =
    UserInfoCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> infoId,
      required String name,
      required double weight,
      required DateTime dob,
      required double height,
    });
typedef $$UserInfoTableUpdateCompanionBuilder =
    UserInfoCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> infoId,
      Value<String> name,
      Value<double> weight,
      Value<DateTime> dob,
      Value<double> height,
    });

class $$UserInfoTableFilterComposer
    extends Composer<_$AppDatabase, $UserInfoTable> {
  $$UserInfoTableFilterComposer({
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

  ColumnFilters<int> get infoId => $composableBuilder(
    column: $table.infoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dob => $composableBuilder(
    column: $table.dob,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserInfoTableOrderingComposer
    extends Composer<_$AppDatabase, $UserInfoTable> {
  $$UserInfoTableOrderingComposer({
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

  ColumnOrderings<int> get infoId => $composableBuilder(
    column: $table.infoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dob => $composableBuilder(
    column: $table.dob,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserInfoTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserInfoTable> {
  $$UserInfoTableAnnotationComposer({
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

  GeneratedColumn<int> get infoId =>
      $composableBuilder(column: $table.infoId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<DateTime> get dob =>
      $composableBuilder(column: $table.dob, builder: (column) => column);

  GeneratedColumn<double> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);
}

class $$UserInfoTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserInfoTable,
          UserInfoData,
          $$UserInfoTableFilterComposer,
          $$UserInfoTableOrderingComposer,
          $$UserInfoTableAnnotationComposer,
          $$UserInfoTableCreateCompanionBuilder,
          $$UserInfoTableUpdateCompanionBuilder,
          (
            UserInfoData,
            BaseReferences<_$AppDatabase, $UserInfoTable, UserInfoData>,
          ),
          UserInfoData,
          PrefetchHooks Function()
        > {
  $$UserInfoTableTableManager(_$AppDatabase db, $UserInfoTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserInfoTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserInfoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserInfoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> infoId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<DateTime> dob = const Value.absent(),
                Value<double> height = const Value.absent(),
              }) => UserInfoCompanion(
                lastModifiedTime: lastModifiedTime,
                infoId: infoId,
                name: name,
                weight: weight,
                dob: dob,
                height: height,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> infoId = const Value.absent(),
                required String name,
                required double weight,
                required DateTime dob,
                required double height,
              }) => UserInfoCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                infoId: infoId,
                name: name,
                weight: weight,
                dob: dob,
                height: height,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserInfoTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserInfoTable,
      UserInfoData,
      $$UserInfoTableFilterComposer,
      $$UserInfoTableOrderingComposer,
      $$UserInfoTableAnnotationComposer,
      $$UserInfoTableCreateCompanionBuilder,
      $$UserInfoTableUpdateCompanionBuilder,
      (
        UserInfoData,
        BaseReferences<_$AppDatabase, $UserInfoTable, UserInfoData>,
      ),
      UserInfoData,
      PrefetchHooks Function()
    >;
typedef $$NotificationsTableCreateCompanionBuilder =
    NotificationsCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> notificationId,
      required String notifHeader,
      required String notifBody,
      required DateTime timestamp,
    });
typedef $$NotificationsTableUpdateCompanionBuilder =
    NotificationsCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> notificationId,
      Value<String> notifHeader,
      Value<String> notifBody,
      Value<DateTime> timestamp,
    });

final class $$NotificationsTableReferences
    extends BaseReferences<_$AppDatabase, $NotificationsTable, Notification> {
  $$NotificationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TimestampsTable _timestampTable(_$AppDatabase db) =>
      db.timestamps.createAlias(
        $_aliasNameGenerator(db.notifications.timestamp, db.timestamps.time),
      );

  $$TimestampsTableProcessedTableManager get timestamp {
    final $_column = $_itemColumn<DateTime>('timestamp')!;

    final manager = $$TimestampsTableTableManager(
      $_db,
      $_db.timestamps,
    ).filter((f) => f.time.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_timestampTable($_db));
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

  $$TimestampsTableFilterComposer get timestamp {
    final $$TimestampsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestamp,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.time,
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

  $$TimestampsTableOrderingComposer get timestamp {
    final $$TimestampsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestamp,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.time,
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

  $$TimestampsTableAnnotationComposer get timestamp {
    final $$TimestampsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestamp,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.time,
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
          PrefetchHooks Function({bool timestamp})
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
                Value<DateTime> timestamp = const Value.absent(),
              }) => NotificationsCompanion(
                lastModifiedTime: lastModifiedTime,
                notificationId: notificationId,
                notifHeader: notifHeader,
                notifBody: notifBody,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> notificationId = const Value.absent(),
                required String notifHeader,
                required String notifBody,
                required DateTime timestamp,
              }) => NotificationsCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                notificationId: notificationId,
                notifHeader: notifHeader,
                notifBody: notifBody,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NotificationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({timestamp = false}) {
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
                    if (timestamp) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.timestamp,
                                referencedTable: $$NotificationsTableReferences
                                    ._timestampTable(db),
                                referencedColumn: $$NotificationsTableReferences
                                    ._timestampTable(db)
                                    .time,
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
      PrefetchHooks Function({bool timestamp})
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
      required DateTime timestamp,
      required int steps,
    });
typedef $$StepsTableUpdateCompanionBuilder =
    StepsCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> stepsId,
      Value<DateTime> timestamp,
      Value<int> steps,
    });

final class $$StepsTableReferences
    extends BaseReferences<_$AppDatabase, $StepsTable, Step> {
  $$StepsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TimestampsTable _timestampTable(_$AppDatabase db) =>
      db.timestamps.createAlias(
        $_aliasNameGenerator(db.steps.timestamp, db.timestamps.time),
      );

  $$TimestampsTableProcessedTableManager get timestamp {
    final $_column = $_itemColumn<DateTime>('timestamp')!;

    final manager = $$TimestampsTableTableManager(
      $_db,
      $_db.timestamps,
    ).filter((f) => f.time.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_timestampTable($_db));
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

  ColumnFilters<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnFilters(column),
  );

  $$TimestampsTableFilterComposer get timestamp {
    final $$TimestampsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestamp,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.time,
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

  ColumnOrderings<int> get steps => $composableBuilder(
    column: $table.steps,
    builder: (column) => ColumnOrderings(column),
  );

  $$TimestampsTableOrderingComposer get timestamp {
    final $$TimestampsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestamp,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.time,
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

  GeneratedColumn<int> get steps =>
      $composableBuilder(column: $table.steps, builder: (column) => column);

  $$TimestampsTableAnnotationComposer get timestamp {
    final $$TimestampsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestamp,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.time,
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
          PrefetchHooks Function({bool timestamp, bool healthOverviewRefs})
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
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> steps = const Value.absent(),
              }) => StepsCompanion(
                lastModifiedTime: lastModifiedTime,
                stepsId: stepsId,
                timestamp: timestamp,
                steps: steps,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> stepsId = const Value.absent(),
                required DateTime timestamp,
                required int steps,
              }) => StepsCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                stepsId: stepsId,
                timestamp: timestamp,
                steps: steps,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$StepsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({timestamp = false, healthOverviewRefs = false}) {
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
                        if (timestamp) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.timestamp,
                                    referencedTable: $$StepsTableReferences
                                        ._timestampTable(db),
                                    referencedColumn: $$StepsTableReferences
                                        ._timestampTable(db)
                                        .time,
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
      PrefetchHooks Function({bool timestamp, bool healthOverviewRefs})
    >;
typedef $$HrvTableCreateCompanionBuilder =
    HrvCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> hrv,
      required DateTime timestamp,
    });
typedef $$HrvTableUpdateCompanionBuilder =
    HrvCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> hrv,
      Value<DateTime> timestamp,
    });

final class $$HrvTableReferences
    extends BaseReferences<_$AppDatabase, $HrvTable, HrvData> {
  $$HrvTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TimestampsTable _timestampTable(_$AppDatabase db) => db.timestamps
      .createAlias($_aliasNameGenerator(db.hrv.timestamp, db.timestamps.time));

  $$TimestampsTableProcessedTableManager get timestamp {
    final $_column = $_itemColumn<DateTime>('timestamp')!;

    final manager = $$TimestampsTableTableManager(
      $_db,
      $_db.timestamps,
    ).filter((f) => f.time.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_timestampTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$HealthOverviewTable, List<HealthOverviewData>>
  _healthOverviewRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.healthOverview,
    aliasName: $_aliasNameGenerator(db.hrv.hrv, db.healthOverview.hrv),
  );

  $$HealthOverviewTableProcessedTableManager get healthOverviewRefs {
    final manager = $$HealthOverviewTableTableManager(
      $_db,
      $_db.healthOverview,
    ).filter((f) => f.hrv.hrv.sqlEquals($_itemColumn<int>('hrv')!));

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

  ColumnFilters<int> get hrv => $composableBuilder(
    column: $table.hrv,
    builder: (column) => ColumnFilters(column),
  );

  $$TimestampsTableFilterComposer get timestamp {
    final $$TimestampsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestamp,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.time,
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
      getCurrentColumn: (t) => t.hrv,
      referencedTable: $db.healthOverview,
      getReferencedColumn: (t) => t.hrv,
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

  ColumnOrderings<int> get hrv => $composableBuilder(
    column: $table.hrv,
    builder: (column) => ColumnOrderings(column),
  );

  $$TimestampsTableOrderingComposer get timestamp {
    final $$TimestampsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestamp,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.time,
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

  GeneratedColumn<int> get hrv =>
      $composableBuilder(column: $table.hrv, builder: (column) => column);

  $$TimestampsTableAnnotationComposer get timestamp {
    final $$TimestampsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestamp,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.time,
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
      getCurrentColumn: (t) => t.hrv,
      referencedTable: $db.healthOverview,
      getReferencedColumn: (t) => t.hrv,
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
          PrefetchHooks Function({bool timestamp, bool healthOverviewRefs})
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
                Value<int> hrv = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
              }) => HrvCompanion(
                lastModifiedTime: lastModifiedTime,
                hrv: hrv,
                timestamp: timestamp,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> hrv = const Value.absent(),
                required DateTime timestamp,
              }) => HrvCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                hrv: hrv,
                timestamp: timestamp,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (e.readTable(table), $$HrvTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({timestamp = false, healthOverviewRefs = false}) {
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
                        if (timestamp) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.timestamp,
                                    referencedTable: $$HrvTableReferences
                                        ._timestampTable(db),
                                    referencedColumn: $$HrvTableReferences
                                        ._timestampTable(db)
                                        .time,
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
                                (e) => e.hrv == item.hrv,
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
      PrefetchHooks Function({bool timestamp, bool healthOverviewRefs})
    >;
typedef $$HeartRateZonesTableCreateCompanionBuilder =
    HeartRateZonesCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> hrZoneId,
      required int restingLower,
      required int restingUpper,
      required int exerciseLower,
      required int exerciseHigher,
      required int exertionLower,
      required int exertionUpper,
    });
typedef $$HeartRateZonesTableUpdateCompanionBuilder =
    HeartRateZonesCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> hrZoneId,
      Value<int> restingLower,
      Value<int> restingUpper,
      Value<int> exerciseLower,
      Value<int> exerciseHigher,
      Value<int> exertionLower,
      Value<int> exertionUpper,
    });

final class $$HeartRateZonesTableReferences
    extends BaseReferences<_$AppDatabase, $HeartRateZonesTable, HeartRateZone> {
  $$HeartRateZonesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$HeartRateTable, List<HeartRateData>>
  _heartRateRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.heartRate,
    aliasName: $_aliasNameGenerator(
      db.heartRateZones.hrZoneId,
      db.heartRate.hrZone,
    ),
  );

  $$HeartRateTableProcessedTableManager get heartRateRefs {
    final manager = $$HeartRateTableTableManager($_db, $_db.heartRate).filter(
      (f) => f.hrZone.hrZoneId.sqlEquals($_itemColumn<int>('hr_zone_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_heartRateRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HeartRateZonesTableFilterComposer
    extends Composer<_$AppDatabase, $HeartRateZonesTable> {
  $$HeartRateZonesTableFilterComposer({
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

  ColumnFilters<int> get hrZoneId => $composableBuilder(
    column: $table.hrZoneId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get restingLower => $composableBuilder(
    column: $table.restingLower,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get restingUpper => $composableBuilder(
    column: $table.restingUpper,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exerciseLower => $composableBuilder(
    column: $table.exerciseLower,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exerciseHigher => $composableBuilder(
    column: $table.exerciseHigher,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exertionLower => $composableBuilder(
    column: $table.exertionLower,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get exertionUpper => $composableBuilder(
    column: $table.exertionUpper,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> heartRateRefs(
    Expression<bool> Function($$HeartRateTableFilterComposer f) f,
  ) {
    final $$HeartRateTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hrZoneId,
      referencedTable: $db.heartRate,
      getReferencedColumn: (t) => t.hrZone,
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

class $$HeartRateZonesTableOrderingComposer
    extends Composer<_$AppDatabase, $HeartRateZonesTable> {
  $$HeartRateZonesTableOrderingComposer({
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

  ColumnOrderings<int> get hrZoneId => $composableBuilder(
    column: $table.hrZoneId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get restingLower => $composableBuilder(
    column: $table.restingLower,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get restingUpper => $composableBuilder(
    column: $table.restingUpper,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exerciseLower => $composableBuilder(
    column: $table.exerciseLower,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exerciseHigher => $composableBuilder(
    column: $table.exerciseHigher,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exertionLower => $composableBuilder(
    column: $table.exertionLower,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get exertionUpper => $composableBuilder(
    column: $table.exertionUpper,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HeartRateZonesTableAnnotationComposer
    extends Composer<_$AppDatabase, $HeartRateZonesTable> {
  $$HeartRateZonesTableAnnotationComposer({
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

  GeneratedColumn<int> get hrZoneId =>
      $composableBuilder(column: $table.hrZoneId, builder: (column) => column);

  GeneratedColumn<int> get restingLower => $composableBuilder(
    column: $table.restingLower,
    builder: (column) => column,
  );

  GeneratedColumn<int> get restingUpper => $composableBuilder(
    column: $table.restingUpper,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exerciseLower => $composableBuilder(
    column: $table.exerciseLower,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exerciseHigher => $composableBuilder(
    column: $table.exerciseHigher,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exertionLower => $composableBuilder(
    column: $table.exertionLower,
    builder: (column) => column,
  );

  GeneratedColumn<int> get exertionUpper => $composableBuilder(
    column: $table.exertionUpper,
    builder: (column) => column,
  );

  Expression<T> heartRateRefs<T extends Object>(
    Expression<T> Function($$HeartRateTableAnnotationComposer a) f,
  ) {
    final $$HeartRateTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hrZoneId,
      referencedTable: $db.heartRate,
      getReferencedColumn: (t) => t.hrZone,
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

class $$HeartRateZonesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HeartRateZonesTable,
          HeartRateZone,
          $$HeartRateZonesTableFilterComposer,
          $$HeartRateZonesTableOrderingComposer,
          $$HeartRateZonesTableAnnotationComposer,
          $$HeartRateZonesTableCreateCompanionBuilder,
          $$HeartRateZonesTableUpdateCompanionBuilder,
          (HeartRateZone, $$HeartRateZonesTableReferences),
          HeartRateZone,
          PrefetchHooks Function({bool heartRateRefs})
        > {
  $$HeartRateZonesTableTableManager(
    _$AppDatabase db,
    $HeartRateZonesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HeartRateZonesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HeartRateZonesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HeartRateZonesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> hrZoneId = const Value.absent(),
                Value<int> restingLower = const Value.absent(),
                Value<int> restingUpper = const Value.absent(),
                Value<int> exerciseLower = const Value.absent(),
                Value<int> exerciseHigher = const Value.absent(),
                Value<int> exertionLower = const Value.absent(),
                Value<int> exertionUpper = const Value.absent(),
              }) => HeartRateZonesCompanion(
                lastModifiedTime: lastModifiedTime,
                hrZoneId: hrZoneId,
                restingLower: restingLower,
                restingUpper: restingUpper,
                exerciseLower: exerciseLower,
                exerciseHigher: exerciseHigher,
                exertionLower: exertionLower,
                exertionUpper: exertionUpper,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> hrZoneId = const Value.absent(),
                required int restingLower,
                required int restingUpper,
                required int exerciseLower,
                required int exerciseHigher,
                required int exertionLower,
                required int exertionUpper,
              }) => HeartRateZonesCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                hrZoneId: hrZoneId,
                restingLower: restingLower,
                restingUpper: restingUpper,
                exerciseLower: exerciseLower,
                exerciseHigher: exerciseHigher,
                exertionLower: exertionLower,
                exertionUpper: exertionUpper,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HeartRateZonesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({heartRateRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (heartRateRefs) db.heartRate],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (heartRateRefs)
                    await $_getPrefetchedData<
                      HeartRateZone,
                      $HeartRateZonesTable,
                      HeartRateData
                    >(
                      currentTable: table,
                      referencedTable: $$HeartRateZonesTableReferences
                          ._heartRateRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$HeartRateZonesTableReferences(
                            db,
                            table,
                            p0,
                          ).heartRateRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.hrZone == item.hrZoneId,
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

typedef $$HeartRateZonesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HeartRateZonesTable,
      HeartRateZone,
      $$HeartRateZonesTableFilterComposer,
      $$HeartRateZonesTableOrderingComposer,
      $$HeartRateZonesTableAnnotationComposer,
      $$HeartRateZonesTableCreateCompanionBuilder,
      $$HeartRateZonesTableUpdateCompanionBuilder,
      (HeartRateZone, $$HeartRateZonesTableReferences),
      HeartRateZone,
      PrefetchHooks Function({bool heartRateRefs})
    >;
typedef $$HeartRateTableCreateCompanionBuilder =
    HeartRateCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> hrId,
      required DateTime timestamp,
      required int dailyAvg,
      required int hrZone,
    });
typedef $$HeartRateTableUpdateCompanionBuilder =
    HeartRateCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> hrId,
      Value<DateTime> timestamp,
      Value<int> dailyAvg,
      Value<int> hrZone,
    });

final class $$HeartRateTableReferences
    extends BaseReferences<_$AppDatabase, $HeartRateTable, HeartRateData> {
  $$HeartRateTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TimestampsTable _timestampTable(_$AppDatabase db) =>
      db.timestamps.createAlias(
        $_aliasNameGenerator(db.heartRate.timestamp, db.timestamps.time),
      );

  $$TimestampsTableProcessedTableManager get timestamp {
    final $_column = $_itemColumn<DateTime>('timestamp')!;

    final manager = $$TimestampsTableTableManager(
      $_db,
      $_db.timestamps,
    ).filter((f) => f.time.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_timestampTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $HeartRateZonesTable _hrZoneTable(_$AppDatabase db) =>
      db.heartRateZones.createAlias(
        $_aliasNameGenerator(db.heartRate.hrZone, db.heartRateZones.hrZoneId),
      );

  $$HeartRateZonesTableProcessedTableManager get hrZone {
    final $_column = $_itemColumn<int>('hr_zone')!;

    final manager = $$HeartRateZonesTableTableManager(
      $_db,
      $_db.heartRateZones,
    ).filter((f) => f.hrZoneId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_hrZoneTable($_db));
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

  $$TimestampsTableFilterComposer get timestamp {
    final $$TimestampsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestamp,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.time,
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

  $$HeartRateZonesTableFilterComposer get hrZone {
    final $$HeartRateZonesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hrZone,
      referencedTable: $db.heartRateZones,
      getReferencedColumn: (t) => t.hrZoneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HeartRateZonesTableFilterComposer(
            $db: $db,
            $table: $db.heartRateZones,
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

  $$TimestampsTableOrderingComposer get timestamp {
    final $$TimestampsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestamp,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.time,
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

  $$HeartRateZonesTableOrderingComposer get hrZone {
    final $$HeartRateZonesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hrZone,
      referencedTable: $db.heartRateZones,
      getReferencedColumn: (t) => t.hrZoneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HeartRateZonesTableOrderingComposer(
            $db: $db,
            $table: $db.heartRateZones,
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

  $$TimestampsTableAnnotationComposer get timestamp {
    final $$TimestampsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.timestamp,
      referencedTable: $db.timestamps,
      getReferencedColumn: (t) => t.time,
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

  $$HeartRateZonesTableAnnotationComposer get hrZone {
    final $$HeartRateZonesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hrZone,
      referencedTable: $db.heartRateZones,
      getReferencedColumn: (t) => t.hrZoneId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HeartRateZonesTableAnnotationComposer(
            $db: $db,
            $table: $db.heartRateZones,
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
          PrefetchHooks Function({bool timestamp, bool hrZone})
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
                Value<DateTime> timestamp = const Value.absent(),
                Value<int> dailyAvg = const Value.absent(),
                Value<int> hrZone = const Value.absent(),
              }) => HeartRateCompanion(
                lastModifiedTime: lastModifiedTime,
                hrId: hrId,
                timestamp: timestamp,
                dailyAvg: dailyAvg,
                hrZone: hrZone,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> hrId = const Value.absent(),
                required DateTime timestamp,
                required int dailyAvg,
                required int hrZone,
              }) => HeartRateCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                hrId: hrId,
                timestamp: timestamp,
                dailyAvg: dailyAvg,
                hrZone: hrZone,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HeartRateTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({timestamp = false, hrZone = false}) {
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
                    if (timestamp) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.timestamp,
                                referencedTable: $$HeartRateTableReferences
                                    ._timestampTable(db),
                                referencedColumn: $$HeartRateTableReferences
                                    ._timestampTable(db)
                                    .time,
                              )
                              as T;
                    }
                    if (hrZone) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.hrZone,
                                referencedTable: $$HeartRateTableReferences
                                    ._hrZoneTable(db),
                                referencedColumn: $$HeartRateTableReferences
                                    ._hrZoneTable(db)
                                    .hrZoneId,
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
      PrefetchHooks Function({bool timestamp, bool hrZone})
    >;
typedef $$BaselineTableCreateCompanionBuilder =
    BaselineCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> baselineId,
      required int maxHr,
      required DateTime minHrDate,
      required int maxHrv,
    });
typedef $$BaselineTableUpdateCompanionBuilder =
    BaselineCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> baselineId,
      Value<int> maxHr,
      Value<DateTime> minHrDate,
      Value<int> maxHrv,
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

  ColumnFilters<DateTime> get minHrDate => $composableBuilder(
    column: $table.minHrDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get maxHrv => $composableBuilder(
    column: $table.maxHrv,
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

  ColumnOrderings<DateTime> get minHrDate => $composableBuilder(
    column: $table.minHrDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get maxHrv => $composableBuilder(
    column: $table.maxHrv,
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

  GeneratedColumn<DateTime> get minHrDate =>
      $composableBuilder(column: $table.minHrDate, builder: (column) => column);

  GeneratedColumn<int> get maxHrv =>
      $composableBuilder(column: $table.maxHrv, builder: (column) => column);

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
                Value<DateTime> minHrDate = const Value.absent(),
                Value<int> maxHrv = const Value.absent(),
              }) => BaselineCompanion(
                lastModifiedTime: lastModifiedTime,
                baselineId: baselineId,
                maxHr: maxHr,
                minHrDate: minHrDate,
                maxHrv: maxHrv,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> baselineId = const Value.absent(),
                required int maxHr,
                required DateTime minHrDate,
                required int maxHrv,
              }) => BaselineCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                baselineId: baselineId,
                maxHr: maxHr,
                minHrDate: minHrDate,
                maxHrv: maxHrv,
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
      required int hrv,
      required int baselineId,
    });
typedef $$HealthOverviewTableUpdateCompanionBuilder =
    HealthOverviewCompanion Function({
      Value<DateTime> lastModifiedTime,
      Value<int> healthScore,
      Value<int> sleepId,
      Value<int> stepsId,
      Value<int> hrv,
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

  static $HrvTable _hrvTable(_$AppDatabase db) => db.hrv.createAlias(
    $_aliasNameGenerator(db.healthOverview.hrv, db.hrv.hrv),
  );

  $$HrvTableProcessedTableManager get hrv {
    final $_column = $_itemColumn<int>('hrv')!;

    final manager = $$HrvTableTableManager(
      $_db,
      $_db.hrv,
    ).filter((f) => f.hrv.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_hrvTable($_db));
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

  $$HrvTableFilterComposer get hrv {
    final $$HrvTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hrv,
      referencedTable: $db.hrv,
      getReferencedColumn: (t) => t.hrv,
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

  $$HrvTableOrderingComposer get hrv {
    final $$HrvTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hrv,
      referencedTable: $db.hrv,
      getReferencedColumn: (t) => t.hrv,
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

  $$HrvTableAnnotationComposer get hrv {
    final $$HrvTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.hrv,
      referencedTable: $db.hrv,
      getReferencedColumn: (t) => t.hrv,
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
            bool hrv,
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
                Value<int> hrv = const Value.absent(),
                Value<int> baselineId = const Value.absent(),
              }) => HealthOverviewCompanion(
                lastModifiedTime: lastModifiedTime,
                healthScore: healthScore,
                sleepId: sleepId,
                stepsId: stepsId,
                hrv: hrv,
                baselineId: baselineId,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> lastModifiedTime = const Value.absent(),
                Value<int> healthScore = const Value.absent(),
                required int sleepId,
                required int stepsId,
                required int hrv,
                required int baselineId,
              }) => HealthOverviewCompanion.insert(
                lastModifiedTime: lastModifiedTime,
                healthScore: healthScore,
                sleepId: sleepId,
                stepsId: stepsId,
                hrv: hrv,
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
                hrv = false,
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
                        if (hrv) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.hrv,
                                    referencedTable:
                                        $$HealthOverviewTableReferences
                                            ._hrvTable(db),
                                    referencedColumn:
                                        $$HealthOverviewTableReferences
                                            ._hrvTable(db)
                                            .hrv,
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
        bool hrv,
        bool baselineId,
      })
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TimestampsTableTableManager get timestamps =>
      $$TimestampsTableTableManager(_db, _db.timestamps);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
  $$UserInfoTableTableManager get userInfo =>
      $$UserInfoTableTableManager(_db, _db.userInfo);
  $$NotificationsTableTableManager get notifications =>
      $$NotificationsTableTableManager(_db, _db.notifications);
  $$SleepTableTableManager get sleep =>
      $$SleepTableTableManager(_db, _db.sleep);
  $$StepsTableTableManager get steps =>
      $$StepsTableTableManager(_db, _db.steps);
  $$HrvTableTableManager get hrv => $$HrvTableTableManager(_db, _db.hrv);
  $$HeartRateZonesTableTableManager get heartRateZones =>
      $$HeartRateZonesTableTableManager(_db, _db.heartRateZones);
  $$HeartRateTableTableManager get heartRate =>
      $$HeartRateTableTableManager(_db, _db.heartRate);
  $$BaselineTableTableManager get baseline =>
      $$BaselineTableTableManager(_db, _db.baseline);
  $$HealthOverviewTableTableManager get healthOverview =>
      $$HealthOverviewTableTableManager(_db, _db.healthOverview);
}
