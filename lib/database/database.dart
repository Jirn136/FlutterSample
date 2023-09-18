import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class TenantDetails extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get houseNumber => integer()();

  IntColumn get reading => integer()();

  IntColumn get unit => integer()();

  IntColumn get total => integer()();
}

@DriftDatabase(tables: [TenantDetails])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<TenantDetail>> getTenantDetails(int houseNumber) {
    return (select(tenantDetails)
          ..where((t) => t.houseNumber.equals(houseNumber)))
        .watch();
  }

  Future<int> addTenantDetail(TenantDetail detail) {
    return into(tenantDetails).insert(detail);
  }

  Stream<TenantDetail> getLastReadingData(int houseNumber) {
    return (select(tenantDetails)
          ..orderBy([
            (t) => OrderingTerm(expression: t.reading, mode: OrderingMode.desc)
          ])
          ..where((t) => t.houseNumber.equals(houseNumber)))
        .watchSingle();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationSupportDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
