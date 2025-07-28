import '../../database/app_db.dart';
import '../../database/db_holder.dart';
import '../../model/entity/app_kvconfig.dart';
import '../../repository/app_kvconfig/app_kvconfig_dao.dart';

class AppKvConfigService{
  // 单例模式
  static final AppKvConfigService _singleton = AppKvConfigService._internal();
  factory AppKvConfigService() => _singleton;
  AppKvConfigService._internal();

  Future<List<AppKvConfig>> findAll() async {
    final db = await AppDatabaseHolder.database;
    return db.appKvConfigDao.findAll();
  }

  Future<AppKvConfig?> findByKey(String key) async {
    final db = await AppDatabaseHolder.database;
    return db.appKvConfigDao.findByKey(key);
  }

  Future<int> update(AppKvConfig appKvConfig) async {
    final db = await AppDatabaseHolder.database;
    return db.appKvConfigDao.update(appKvConfig);
  }
}