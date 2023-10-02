// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $TenantInfoTable extends TenantInfo
    with TableInfo<$TenantInfoTable, Tenants> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TenantInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
      'date', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _houseNumberMeta =
      const VerificationMeta('houseNumber');
  @override
  late final GeneratedColumn<int> houseNumber = GeneratedColumn<int>(
      'house_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tenantNameMeta =
      const VerificationMeta('tenantName');
  @override
  late final GeneratedColumn<String> tenantName = GeneratedColumn<String>(
      'tenant_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, date, houseNumber, tenantName];
  @override
  String get aliasedName => _alias ?? 'tenant_info';
  @override
  String get actualTableName => 'tenant_info';
  @override
  VerificationContext validateIntegrity(Insertable<Tenants> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('house_number')) {
      context.handle(
          _houseNumberMeta,
          houseNumber.isAcceptableOrUnknown(
              data['house_number']!, _houseNumberMeta));
    } else if (isInserting) {
      context.missing(_houseNumberMeta);
    }
    if (data.containsKey('tenant_name')) {
      context.handle(
          _tenantNameMeta,
          tenantName.isAcceptableOrUnknown(
              data['tenant_name']!, _tenantNameMeta));
    } else if (isInserting) {
      context.missing(_tenantNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tenants map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tenants(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}date'])!,
      houseNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}house_number'])!,
      tenantName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tenant_name'])!,
    );
  }

  @override
  $TenantInfoTable createAlias(String alias) {
    return $TenantInfoTable(attachedDatabase, alias);
  }
}

class Tenants extends DataClass implements Insertable<Tenants> {
  final int id;
  final int date;
  final int houseNumber;
  final String tenantName;
  const Tenants(
      {required this.id,
      required this.date,
      required this.houseNumber,
      required this.tenantName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<int>(date);
    map['house_number'] = Variable<int>(houseNumber);
    map['tenant_name'] = Variable<String>(tenantName);
    return map;
  }

  TenantInfoCompanion toCompanion(bool nullToAbsent) {
    return TenantInfoCompanion(
      id: Value(id),
      date: Value(date),
      houseNumber: Value(houseNumber),
      tenantName: Value(tenantName),
    );
  }

  factory Tenants.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tenants(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<int>(json['date']),
      houseNumber: serializer.fromJson<int>(json['houseNumber']),
      tenantName: serializer.fromJson<String>(json['tenantName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<int>(date),
      'houseNumber': serializer.toJson<int>(houseNumber),
      'tenantName': serializer.toJson<String>(tenantName),
    };
  }

  Tenants copyWith(
          {int? id, int? date, int? houseNumber, String? tenantName}) =>
      Tenants(
        id: id ?? this.id,
        date: date ?? this.date,
        houseNumber: houseNumber ?? this.houseNumber,
        tenantName: tenantName ?? this.tenantName,
      );
  @override
  String toString() {
    return (StringBuffer('Tenants(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('houseNumber: $houseNumber, ')
          ..write('tenantName: $tenantName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, houseNumber, tenantName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tenants &&
          other.id == this.id &&
          other.date == this.date &&
          other.houseNumber == this.houseNumber &&
          other.tenantName == this.tenantName);
}

class TenantInfoCompanion extends UpdateCompanion<Tenants> {
  final Value<int> id;
  final Value<int> date;
  final Value<int> houseNumber;
  final Value<String> tenantName;
  const TenantInfoCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.houseNumber = const Value.absent(),
    this.tenantName = const Value.absent(),
  });
  TenantInfoCompanion.insert({
    this.id = const Value.absent(),
    required int date,
    required int houseNumber,
    required String tenantName,
  })  : date = Value(date),
        houseNumber = Value(houseNumber),
        tenantName = Value(tenantName);
  static Insertable<Tenants> custom({
    Expression<int>? id,
    Expression<int>? date,
    Expression<int>? houseNumber,
    Expression<String>? tenantName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (houseNumber != null) 'house_number': houseNumber,
      if (tenantName != null) 'tenant_name': tenantName,
    });
  }

  TenantInfoCompanion copyWith(
      {Value<int>? id,
      Value<int>? date,
      Value<int>? houseNumber,
      Value<String>? tenantName}) {
    return TenantInfoCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      houseNumber: houseNumber ?? this.houseNumber,
      tenantName: tenantName ?? this.tenantName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (houseNumber.present) {
      map['house_number'] = Variable<int>(houseNumber.value);
    }
    if (tenantName.present) {
      map['tenant_name'] = Variable<String>(tenantName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TenantInfoCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('houseNumber: $houseNumber, ')
          ..write('tenantName: $tenantName')
          ..write(')'))
        .toString();
  }
}

class $TenantDetailsTable extends TenantDetails
    with TableInfo<$TenantDetailsTable, TenantDetail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TenantDetailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _houseNumberMeta =
      const VerificationMeta('houseNumber');
  @override
  late final GeneratedColumn<int> houseNumber = GeneratedColumn<int>(
      'house_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _timeStampMeta =
      const VerificationMeta('timeStamp');
  @override
  late final GeneratedColumn<int> timeStamp = GeneratedColumn<int>(
      'time_stamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _readingMeta =
      const VerificationMeta('reading');
  @override
  late final GeneratedColumn<int> reading = GeneratedColumn<int>(
      'reading', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<int> unit = GeneratedColumn<int>(
      'unit', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
      'total', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, houseNumber, timeStamp, reading, unit, total];
  @override
  String get aliasedName => _alias ?? 'tenant_details';
  @override
  String get actualTableName => 'tenant_details';
  @override
  VerificationContext validateIntegrity(Insertable<TenantDetail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('house_number')) {
      context.handle(
          _houseNumberMeta,
          houseNumber.isAcceptableOrUnknown(
              data['house_number']!, _houseNumberMeta));
    } else if (isInserting) {
      context.missing(_houseNumberMeta);
    }
    if (data.containsKey('time_stamp')) {
      context.handle(_timeStampMeta,
          timeStamp.isAcceptableOrUnknown(data['time_stamp']!, _timeStampMeta));
    } else if (isInserting) {
      context.missing(_timeStampMeta);
    }
    if (data.containsKey('reading')) {
      context.handle(_readingMeta,
          reading.isAcceptableOrUnknown(data['reading']!, _readingMeta));
    } else if (isInserting) {
      context.missing(_readingMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TenantDetail map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TenantDetail(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      houseNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}house_number'])!,
      timeStamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_stamp'])!,
      reading: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reading'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total'])!,
    );
  }

  @override
  $TenantDetailsTable createAlias(String alias) {
    return $TenantDetailsTable(attachedDatabase, alias);
  }
}

class TenantDetail extends DataClass implements Insertable<TenantDetail> {
  final int id;
  final int houseNumber;
  final int timeStamp;
  final int reading;
  final int unit;
  final int total;
  const TenantDetail(
      {required this.id,
      required this.houseNumber,
      required this.timeStamp,
      required this.reading,
      required this.unit,
      required this.total});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['house_number'] = Variable<int>(houseNumber);
    map['time_stamp'] = Variable<int>(timeStamp);
    map['reading'] = Variable<int>(reading);
    map['unit'] = Variable<int>(unit);
    map['total'] = Variable<int>(total);
    return map;
  }

  TenantDetailsCompanion toCompanion(bool nullToAbsent) {
    return TenantDetailsCompanion(
      id: Value(id),
      houseNumber: Value(houseNumber),
      timeStamp: Value(timeStamp),
      reading: Value(reading),
      unit: Value(unit),
      total: Value(total),
    );
  }

  factory TenantDetail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TenantDetail(
      id: serializer.fromJson<int>(json['id']),
      houseNumber: serializer.fromJson<int>(json['houseNumber']),
      timeStamp: serializer.fromJson<int>(json['timeStamp']),
      reading: serializer.fromJson<int>(json['reading']),
      unit: serializer.fromJson<int>(json['unit']),
      total: serializer.fromJson<int>(json['total']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'houseNumber': serializer.toJson<int>(houseNumber),
      'timeStamp': serializer.toJson<int>(timeStamp),
      'reading': serializer.toJson<int>(reading),
      'unit': serializer.toJson<int>(unit),
      'total': serializer.toJson<int>(total),
    };
  }

  TenantDetail copyWith(
          {int? id,
          int? houseNumber,
          int? timeStamp,
          int? reading,
          int? unit,
          int? total}) =>
      TenantDetail(
        id: id ?? this.id,
        houseNumber: houseNumber ?? this.houseNumber,
        timeStamp: timeStamp ?? this.timeStamp,
        reading: reading ?? this.reading,
        unit: unit ?? this.unit,
        total: total ?? this.total,
      );
  @override
  String toString() {
    return (StringBuffer('TenantDetail(')
          ..write('id: $id, ')
          ..write('houseNumber: $houseNumber, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('reading: $reading, ')
          ..write('unit: $unit, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, houseNumber, timeStamp, reading, unit, total);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TenantDetail &&
          other.id == this.id &&
          other.houseNumber == this.houseNumber &&
          other.timeStamp == this.timeStamp &&
          other.reading == this.reading &&
          other.unit == this.unit &&
          other.total == this.total);
}

class TenantDetailsCompanion extends UpdateCompanion<TenantDetail> {
  final Value<int> id;
  final Value<int> houseNumber;
  final Value<int> timeStamp;
  final Value<int> reading;
  final Value<int> unit;
  final Value<int> total;
  const TenantDetailsCompanion({
    this.id = const Value.absent(),
    this.houseNumber = const Value.absent(),
    this.timeStamp = const Value.absent(),
    this.reading = const Value.absent(),
    this.unit = const Value.absent(),
    this.total = const Value.absent(),
  });
  TenantDetailsCompanion.insert({
    this.id = const Value.absent(),
    required int houseNumber,
    required int timeStamp,
    required int reading,
    required int unit,
    required int total,
  })  : houseNumber = Value(houseNumber),
        timeStamp = Value(timeStamp),
        reading = Value(reading),
        unit = Value(unit),
        total = Value(total);
  static Insertable<TenantDetail> custom({
    Expression<int>? id,
    Expression<int>? houseNumber,
    Expression<int>? timeStamp,
    Expression<int>? reading,
    Expression<int>? unit,
    Expression<int>? total,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (houseNumber != null) 'house_number': houseNumber,
      if (timeStamp != null) 'time_stamp': timeStamp,
      if (reading != null) 'reading': reading,
      if (unit != null) 'unit': unit,
      if (total != null) 'total': total,
    });
  }

  TenantDetailsCompanion copyWith(
      {Value<int>? id,
      Value<int>? houseNumber,
      Value<int>? timeStamp,
      Value<int>? reading,
      Value<int>? unit,
      Value<int>? total}) {
    return TenantDetailsCompanion(
      id: id ?? this.id,
      houseNumber: houseNumber ?? this.houseNumber,
      timeStamp: timeStamp ?? this.timeStamp,
      reading: reading ?? this.reading,
      unit: unit ?? this.unit,
      total: total ?? this.total,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (houseNumber.present) {
      map['house_number'] = Variable<int>(houseNumber.value);
    }
    if (timeStamp.present) {
      map['time_stamp'] = Variable<int>(timeStamp.value);
    }
    if (reading.present) {
      map['reading'] = Variable<int>(reading.value);
    }
    if (unit.present) {
      map['unit'] = Variable<int>(unit.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TenantDetailsCompanion(')
          ..write('id: $id, ')
          ..write('houseNumber: $houseNumber, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('reading: $reading, ')
          ..write('unit: $unit, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TenantInfoTable tenantInfo = $TenantInfoTable(this);
  late final $TenantDetailsTable tenantDetails = $TenantDetailsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [tenantInfo, tenantDetails];
}
