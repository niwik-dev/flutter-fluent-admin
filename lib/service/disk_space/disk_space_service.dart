import 'package:disk_space_2/disk_space_2.dart';

class DiskSpaceService{
  // 单例模式
  static final DiskSpaceService _instance = DiskSpaceService._internal();
  factory DiskSpaceService() => _instance;
  DiskSpaceService._internal();

  static const int kiloByte = 1024;
  static const int megaByte = 1024 * kiloByte;
  static const int gigaByte = 1024 * megaByte;

  Future<double?> getTotalDiskSpace() async {
    var totalDiskSpace = await DiskSpace.getTotalDiskSpace;
    return totalDiskSpace;
  }

  Future<double?> getFreeDiskSpace() async {
    var freeDiskSpace = await DiskSpace.getFreeDiskSpace;
    return freeDiskSpace;
  }

  String formatVolume(double volume){
    if (volume < kiloByte) {
      return '${volume.toStringAsFixed(2)} MB';
    } else if (volume < megaByte) {
      return '${(volume / kiloByte).toStringAsFixed(2)} GB';
    } else{
      return '${(volume / megaByte).toStringAsFixed(2)} PB';
    }
  }
}