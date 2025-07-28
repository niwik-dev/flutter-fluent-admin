import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../repository/app_kvconfig/app_kvconfig_dao.dart';
import '../model/entity/app_kvconfig.dart';
import 'type/date_cvt.dart';

part 'app_db.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 1, entities: [AppKvConfig])
abstract class AppDatabase extends FloorDatabase {
  AppKvConfigDao get appKvConfigDao;
}