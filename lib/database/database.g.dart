// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
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
  List<GeneratedColumn> get $columns => [id, houseNumber, reading, unit, total];
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
  final int reading;
  final int unit;
  final int total;
  const TenantDetail(
      {required this.id,
      required this.houseNumber,
      required this.reading,
      required this.unit,
      required this.total});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['house_number'] = Variable<int>(houseNumber);
    map['reading'] = Variable<int>(reading);
    map['unit'] = Variable<int>(unit);
    map['total'] = Variable<int>(total);
    return map;
  }

  TenantDetailsCompanion toCompanion(bool nullToAbsent) {
    return TenantDetailsCompanion(
      id: Value(id),
      houseNumber: Value(houseNumber),
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
      'reading': serializer.toJson<int>(reading),
      'unit': serializer.toJson<int>(unit),
      'total': serializer.toJson<int>(total),
    };
  }

  TenantDetail copyWith(
          {int? id, int? houseNumber, int? reading, int? unit, int? total}) =>
      TenantDetail(
        id: id ?? this.id,
        houseNumber: houseNumber ?? this.houseNumber,
        reading: reading ?? this.reading,
        unit: unit ?? this.unit,
        total: total ?? this.total,
      );
  @override
  String toString() {
    return (StringBuffer('TenantDetail(')
          ..write('id: $id, ')
          ..write('houseNumber: $houseNumber, ')
          ..write('reading: $reading, ')
          ..write('unit: $unit, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, houseNumber, reading, unit, total);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TenantDetail &&
          other.id == this.id &&
          other.houseNumber == this.houseNumber &&
          other.reading == this.reading &&
          other.unit == this.unit &&
          other.total == this.total);
}

class TenantDetailsCompanion extends UpdateCompanion<TenantDetail> {
  final Value<int> id;
  final Value<int> houseNumber;
  final Value<int> reading;
  final Value<int> unit;
  final Value<int> total;
  const TenantDetailsCompanion({
    this.id = const Value.absent(),
    this.houseNumber = const Value.absent(),
    this.reading = const Value.absent(),
    this.unit = const Value.absent(),
    this.total = const Value.absent(),
  });
  TenantDetailsCompanion.insert({
    this.id = const Value.absent(),
    required int houseNumber,
    required int reading,
    required int unit,
    required int total,
  })  : houseNumber = Value(houseNumber),
        reading = Value(reading),
        unit = Value(unit),
        total = Value(total);
  static Insertable<TenantDetail> custom({
    Expression<int>? id,
    Expression<int>? houseNumber,
    Expression<int>? reading,
    Expression<int>? unit,
    Expression<int>? total,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (houseNumber != null) 'house_number': houseNumber,
      if (reading != null) 'reading': reading,
      if (unit != null) 'unit': unit,
      if (total != null) 'total': total,
    });
  }

  TenantDetailsCompanion copyWith(
      {Value<int>? id,
      Value<int>? houseNumber,
      Value<int>? reading,
      Value<int>? unit,
      Value<int>? total}) {
    return TenantDetailsCompanion(
      id: id ?? this.id,
      houseNumber: houseNumber ?? this.houseNumber,
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
          ..write('reading: $reading, ')
          ..write('unit: $unit, ')
          ..write('total: $total')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TenantDetailsTable tenantDetails = $TenantDetailsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tenantDetails];
}
