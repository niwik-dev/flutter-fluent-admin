import 'package:system_info2/system_info2.dart';

class SystemInfoService{
  // 单例模式
  static final SystemInfoService _instance = SystemInfoService._internal();
  factory SystemInfoService() => _instance;
  SystemInfoService._internal();
  
  static const int kiloByte = 1024;
  static const int megaByte = 1024 * kiloByte;
  static const int gigaByte = 1024 * megaByte;

  String formatByte(int byte){
    if(byte < kiloByte){
      return byte.toString() + "B";
    }
    else if(byte < megaByte){
      return "${(byte / kiloByte).toStringAsFixed(2)}KB";
    }
    else if(byte < gigaByte){
      return "${(byte / megaByte).toStringAsFixed(2)}MB";
    }else{
      return "${(byte / gigaByte).toStringAsFixed(2)}GB";
    }
  }

  int getMemoryTotal(){
    int totalMemoryByte = SysInfo.getTotalPhysicalMemory();
    return totalMemoryByte;
  }

  int getMemoryUsed(){
    int totalMemoryByte = SysInfo.getTotalPhysicalMemory();
    int usedMemoryByte = SysInfo.getFreePhysicalMemory();
    return totalMemoryByte - usedMemoryByte;
  }

  int getMemoryFree(){
    int freeMemoryByte = SysInfo.getFreePhysicalMemory();
    return freeMemoryByte;
  }

  String getMemoryUsedPercent(){
    return '${
      (((SysInfo.getTotalPhysicalMemory()-SysInfo.getFreePhysicalMemory())/SysInfo.getTotalPhysicalMemory())*100).toStringAsFixed(2)
    } %';
  }

  String getKernelInfo() {
    return '${SysInfo.kernelName} ${SysInfo.kernelBitness}位';
  }

  String getSystemInfo() {
    return '${SysInfo.operatingSystemName} ${SysInfo.operatingSystemVersion}';
  }

  String getCoreInfo() {
    return '${SysInfo.cores.first.name}';
  }
}