import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

import '../object/device_info.dart';


Future<DeviceInfo> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  DeviceInfo deviceData = DeviceInfo();

  try {
    if (Platform.isAndroid) {
      deviceData = _readAndroidDeviceInfo(await deviceInfoPlugin.androidInfo);
    } else if (Platform.isIOS) {
      deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
    }
  } catch (error) {
    error.printError();
  }

  return deviceData;
}

DeviceInfo _readAndroidDeviceInfo(AndroidDeviceInfo info) {
  var release = info.version.release;
  var sdkInt = info.version.sdkInt;
  var manufacturer = info.manufacturer;
  var model = info.model;

  return DeviceInfo(
    platform: 'android',
    version: "android $release (SDK $sdkInt)",
    device: "$manufacturer $model",
  );
}

DeviceInfo _readIosDeviceInfo(IosDeviceInfo info) {
  var systemName = info.systemName;
  var version = info.systemVersion;
  var machine = info.utsname.machine;

  return DeviceInfo(
    platform: 'ios',
    version: "$systemName $version",
    device: machine,
  );
}
