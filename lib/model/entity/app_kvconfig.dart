import 'package:floor/floor.dart';

@entity
class AppKvConfig{
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String key;
  final String value;
  final String type;
  final String desc;
  final DateTime createTime;
  final DateTime updateTime;

  const AppKvConfig(
    this.id,
    this.key,
    this.value,
    this.type,
    this.desc,
    this.createTime,
    this.updateTime,
  );
}