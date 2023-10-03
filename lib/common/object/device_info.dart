
class DeviceInfo {
  String? platform;
  String? version;
  String? device;

  DeviceInfo({this.platform, this.version, this.device});

  @override
  String toString() {
    return 'DeviceInfo{platform: $platform, version: $version, device: $device}';
  }
}
