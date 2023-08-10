import 'package:passit/core/states/app_settings/app_settings.dart';
import 'package:passit/core/states/app_settings/device_mode.dart';

class FontSizer {
  final double mobile, mid, large;
  FontSizer({required this.mobile, required this.mid, required this.large});

  double get size => AppSettings.instance.deviceMode == DeviceMode.large
      ? large
      : AppSettings.instance.deviceMode == DeviceMode.mid
          ? mid
          : mobile;
}
