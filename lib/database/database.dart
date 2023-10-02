import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_sample/models/tenant_details.dart';
import 'package:flutter_sample/models/tenant_info.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DataClassName('TenantDetail')
class TenantDetails extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get houseNumber => integer()();

  IntColumn get timeStamp => integer()();

  IntColumn get reading => integer()();

  IntColumn get unit => integer()();

  IntColumn get total => integer()();
}

@DataClassName('Tenants')
class TenantInfo extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get date => integer()();

  IntColumn get houseNumber => integer()();

  TextColumn get tenantName => text()();
}

@DriftDatabase(tables: [TenantInfo, TenantDetails])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> addTenantInfo(TenantInfoDetails details) async {
    final infoDao = (into(tenantInfo).insert(TenantInfoCompanion(
        houseNumber: Value(details.houseNumber),
        date: Value(details.timeStamp),
        tenantName: Value(details.tenantName))));
    final insertedData = await infoDao;
    return insertedData;
  }

  Future<Tenants> returnTenantInfo(int houseNumber) async {
    final query = select(tenantInfo)
      ..where((tbl) => tbl.houseNumber.equals(houseNumber));
    return await query.getSingle();
  }

  Stream<List<Tenants>> getAllTenants() {
    return select(tenantInfo).watch();
  }

  Future<void> deleteTenant(int houseNumber) {
    return transaction(
      () async {
        await (delete(tenantInfo)
              ..where((tbl) => tbl.houseNumber.equals(houseNumber)))
            .go();
        await (delete(tenantDetails)
              ..where((tbl) => tbl.houseNumber.equals(houseNumber)))
            .go();
      },
    );
  }

  Future<List<TenantDetail>> getAllTenantDetails() =>
      select(tenantDetails).get();

  Stream<List<TenantDetail>> getTenantDetails(int houseNumber) {
    return (select(tenantDetails)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.timeStamp, mode: OrderingMode.desc)
          ])
          ..where((t) => t.houseNumber.equals(houseNumber)))
        .watch();
  }

  Future<int> addTenantDetail(TenantReading reading) async {
    return await into(tenantDetails).insert(TenantDetailsCompanion(
        houseNumber: Value(reading.houseNumber),
        timeStamp: Value(reading.timeStamp),
        reading: Value(reading.reading),
        unit: Value(reading.unit),
        total: Value(reading.total)));
  }

  Future<int?> getLastData(int houseNumber) async {
    final query = select(tenantDetails)
      ..orderBy(
          [(t) => OrderingTerm(expression: t.reading, mode: OrderingMode.desc)])
      ..where((t) => t.houseNumber.equals(houseNumber))
      ..limit(1); // Limit the result to 1 row to get the last reading.

    final result = await query.getSingleOrNull();

    return result?.reading;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationSupportDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
