import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
  static Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;

    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      print(
          "iOS Device info ${iosDeviceInfo.name} and iOS version: ${iosDeviceInfo.systemVersion}  and iOS device Id: ${iosDeviceInfo.identifierForVendor}");
      deviceId = iosDeviceInfo.identifierForVendor;
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      print("Android Device info ${androidDeviceInfo.model}");
      print(
          "Android Device info ${androidDeviceInfo.model} and Android version: ${androidDeviceInfo.version} and Android deviceID: ${androidDeviceInfo.id}");
      deviceId = androidDeviceInfo.id;
    }
    return deviceId;
  }
}
