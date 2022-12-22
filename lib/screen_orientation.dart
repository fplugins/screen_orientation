import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:screen_orientation/screen_orientation_android.dart';
import 'package:screen_orientation/screen_orientation_interface.dart';
import 'package:screen_orientation/screen_orientation_ios.dart';

class ScreenOrientation {
  late ScreenOrientationService _screenOrientationService;
  static int portraitUp = 1;
  static int portraitDown = 2;
  static int landscapeLeft = 3;
  static int landscapeRight = 4;

  // 静态变量指向自身
  static final ScreenOrientation _instance = ScreenOrientation._();
  // 私有构造器
  ScreenOrientation._();
  // 方案1：静态方法获得实例变量
  static ScreenOrientation getInstance() => _instance;
  // 方案2：工厂构造方法获得实例变量
  factory ScreenOrientation() => _instance;
  // 方案3：静态属性获得实例变量
  static ScreenOrientation get instance => _instance;

  //初始化
  Future<void> init() async {
    if (Platform.isIOS) {
      _screenOrientationService = ScreenOrientationIosService();
    } else if (Platform.isAndroid) {
      _screenOrientationService = ScreenOrientationAndroidService();
    }
    await _screenOrientationService.init();
  }

  //方向监听
  void listenerOrientation(ValueChanged<int> orientationCallback) async {
    _screenOrientationService.setOrientationCallback(orientationCallback);
  }
}
