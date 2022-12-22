import 'package:flutter/services.dart';
import 'package:screen_orientation/screen_orientation_interface.dart';

class ScreenOrientationIosService extends ScreenOrientationService {
  final MethodChannel _channel = const MethodChannel('screen_orientation');

  @override
  Future<void> init() async {
    _channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == "orientationCallback") {
        orientationCallback(int.parse(call.arguments));
      }
    });
    await _channel.invokeMethod('init');
  }
}
