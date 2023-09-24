import 'package:flutter/foundation.dart';
import 'package:flutter_sample/database/database.dart';

class DatabaseProvider extends ChangeNotifier {
  final AppDatabase _database = AppDatabase();

  AppDatabase get database => _database;
}
