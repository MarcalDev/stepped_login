import 'package:permission_handler/permission_handler.dart';

class AppPermissions{
  static Future<PermissionStatus> getCameraPermission() async{
    await Permission.camera.request();
    return await Permission.camera.status;    
  }

  static Future<PermissionStatus> getStoragePermission() async{
    await Permission.storage.request();
    return await Permission.storage.status;    
  }
}