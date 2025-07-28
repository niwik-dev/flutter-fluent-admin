import 'package:floor/floor.dart';
import 'package:flutter_admin/model/entity/app_kvconfig.dart';


@dao
abstract class AppKvConfigDao{
  @Query('SELECT * FROM AppKvConfig')
  Future<List<AppKvConfig>> findAll();

  @Query('SELECT * FROM AppKvConfig WHERE id = :id')
  Future<AppKvConfig?> findById(int id);

  @Query('SELECT * FROM AppKvConfig WHERE key = :key')
  Future<AppKvConfig?> findByKey(String key);

  @Update()
  Future<int> update(AppKvConfig appKvConfig);
}